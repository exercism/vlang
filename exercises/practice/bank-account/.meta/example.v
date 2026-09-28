module main

import sync

// A single bank account.
//
// An account is shared by every goroutine that deposits into or withdraws
// from it, so `mutex` guards every read and every write of `balance` and
// `is_open`. Without it two deposits running at the same time would both
// read the same balance and one of the two amounts would be lost.
struct Account {
mut:
	balance int
	is_open bool
	mutex   &sync.Mutex = sync.new_mutex()
}

fn new_account() &Account {
	return &Account{}
}

// > returns an error when the account is already open
fn (mut a Account) open() ! {
	a.mutex.@lock()
	defer {
		a.mutex.unlock()
	}
	if a.is_open {
		return error('account already open')
	}
	a.balance = 0
	a.is_open = true
}

// > returns an error when the account is not open, or when `amount` is not positive
fn (mut a Account) deposit(amount int) ! {
	a.mutex.@lock()
	defer {
		a.mutex.unlock()
	}
	if !a.is_open {
		return error('account not open')
	}
	if amount <= 0 {
		return error('amount must be greater than 0')
	}
	a.balance += amount
}

// > returns an error when the account is not open, when `amount` is not
// > positive, or when the account holds less than `amount`
fn (mut a Account) withdraw(amount int) ! {
	a.mutex.@lock()
	defer {
		a.mutex.unlock()
	}
	if !a.is_open {
		return error('account not open')
	}
	if amount <= 0 {
		return error('amount must be greater than 0')
	}
	if amount > a.balance {
		return error('amount must be less than balance')
	}
	a.balance -= amount
}

// Closing an account forgets its balance, so reopening the same account
// starts from zero again.
//
// > returns an error when the account is not open
fn (mut a Account) close() ! {
	a.mutex.@lock()
	defer {
		a.mutex.unlock()
	}
	if !a.is_open {
		return error('account not open')
	}
	a.is_open = false
	a.balance = 0
}

// > returns an error when the account is not open
fn (mut a Account) balance() !int {
	a.mutex.@lock()
	defer {
		a.mutex.unlock()
	}
	if !a.is_open {
		return error('account not open')
	}
	return a.balance
}
