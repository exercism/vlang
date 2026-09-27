module main

import sync

enum Operation {
	open
	deposit
	withdraw
	close
	balance
}

struct Step {
mut:
	operation Operation
	amount    int
}

fn op_open() Step {
	return Step{
		operation: Operation.open
	}
}

fn op_deposit(amount int) Step {
	return Step{
		operation: Operation.deposit
		amount:    amount
	}
}

fn op_withdraw(amount int) Step {
	return Step{
		operation: Operation.withdraw
		amount:    amount
	}
}

fn op_close() Step {
	return Step{
		operation: Operation.close
	}
}

fn op_balance() Step {
	return Step{
		operation: Operation.balance
	}
}

// Replays `steps` in order against a brand new account and returns the balance
// that the last `balance` step saw, together with the message of the first step
// that failed. The message is empty when every step succeeded.
fn replay(steps []Step) (int, string) {
	mut account := new_account()
	mut balance := 0
	for step in steps {
		match step.operation {
			.open {
				account.open() or { return balance, err.msg() }
			}
			.deposit {
				account.deposit(step.amount) or { return balance, err.msg() }
			}
			.withdraw {
				account.withdraw(step.amount) or { return balance, err.msg() }
			}
			.close {
				account.close() or { return balance, err.msg() }
			}
			.balance {
				balance = account.balance() or { return balance, err.msg() }
			}
		}
	}
	return balance, ''
}

// Returns a brand new, open account, together with the message of the error
// that stopped it from opening.
fn opened_account() (&Account, string) {
	mut account := new_account()
	account.open() or { return account, err.msg() }
	return account, ''
}

fn test_newly_opened_account_has_zero_balance() {
	balance, message := replay([op_open(), op_balance()])
	assert message == ''
	assert balance == 0
}

fn test_single_deposit() {
	balance, message := replay([op_open(), op_deposit(100), op_balance()])
	assert message == ''
	assert balance == 100
}

fn test_multiple_deposits() {
	balance, message := replay([op_open(), op_deposit(100), op_deposit(50), op_balance()])
	assert message == ''
	assert balance == 150
}

fn test_withdraw_once() {
	balance, message := replay([op_open(), op_deposit(100), op_withdraw(75), op_balance()])
	assert message == ''
	assert balance == 25
}

fn test_withdraw_twice() {
	balance, message := replay([op_open(), op_deposit(100), op_withdraw(80), op_withdraw(20),
		op_balance()])
	assert message == ''
	assert balance == 0
}

fn test_can_do_multiple_operations_sequentially() {
	balance, message := replay([op_open(), op_deposit(100), op_deposit(110), op_withdraw(200),
		op_deposit(60), op_withdraw(50), op_balance()])
	assert message == ''
	assert balance == 20
}

fn test_cannot_check_balance_of_closed_account() {
	_, message := replay([op_open(), op_close(), op_balance()])
	assert message == 'account not open'
}

fn test_cannot_deposit_into_closed_account() {
	_, message := replay([op_open(), op_close(), op_deposit(50)])
	assert message == 'account not open'
}

fn test_cannot_deposit_into_unopened_account() {
	_, message := replay([op_deposit(50)])
	assert message == 'account not open'
}

fn test_cannot_withdraw_from_closed_account() {
	_, message := replay([op_open(), op_close(), op_withdraw(50)])
	assert message == 'account not open'
}

fn test_cannot_close_an_account_that_was_not_opened() {
	_, message := replay([op_close()])
	assert message == 'account not open'
}

fn test_cannot_open_an_already_opened_account() {
	_, message := replay([op_open(), op_open()])
	assert message == 'account already open'
}

fn test_reopened_account_does_not_retain_balance() {
	balance, message := replay([op_open(), op_deposit(50), op_close(), op_open(), op_balance()])
	assert message == ''
	assert balance == 0
}

fn test_cannot_withdraw_more_than_deposited() {
	_, message := replay([op_open(), op_deposit(25), op_withdraw(50)])
	assert message == 'amount must be less than balance'
}

fn test_cannot_withdraw_negative() {
	_, message := replay([op_open(), op_deposit(100), op_withdraw(-50)])
	assert message == 'amount must be greater than 0'
}

fn test_cannot_deposit_negative() {
	_, message := replay([op_open(), op_deposit(-50)])
	assert message == 'amount must be greater than 0'
}

fn test_can_handle_concurrent_transactions() {
	mut account, message := opened_account()
	assert message == ''
	mut workers := sync.new_waitgroup()
	for _ in 0 .. 1000 {
		workers.add(1)
		spawn churn(mut account, 1, workers)
	}
	workers.wait()
	balance := account.balance() or { -1 }
	assert balance == 0
}

// Moves `amount` into `account` and straight back out of it. A withdrawal can
// lose the race against the withdrawal of another worker and find the account
// empty, in which case it is simply tried again after a fresh deposit. The
// number of tries is bounded, so a `withdraw` that never succeeds leaves money
// behind and fails the test instead of hanging it.
fn churn(mut account Account, amount int, workers &sync.WaitGroup) {
	defer {
		workers.done()
	}
	for tries := 0; tries < 1000; tries++ {
		account.deposit(amount) or { return }
		account.withdraw(amount) or { continue }
		return
	}
}
