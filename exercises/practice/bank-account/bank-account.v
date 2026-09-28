module main

import sync

// A single bank account. Accounts are opened before they can be used and
// closed when they are not needed any more; every operation on a closed
// account is an error.
//
// The same account can be used from several goroutines at the same time, for
// example when two people withdraw money from it in parallel. `mutex` is what
// keeps that safe: hold it while reading the balance and writing the new one,
// so that a deposit and a withdrawal can never interleave. `spawn` and a
// channel are the tools V gives you for running work in parallel.
struct Account {
mut:
	// How much money the account holds.
	balance int
	// Whether the account is currently open.
	is_open bool
	// Guards `balance` and `is_open` against concurrent access.
	mutex &sync.Mutex = sync.new_mutex()
}

fn new_account() &Account {
}

// > returns an error when the account is already open
fn (mut a Account) open() ! {
}

// > returns an error when the account is not open, or when `amount` is not positive
fn (mut a Account) deposit(amount int) ! {
}

// > returns an error when the account is not open, when `amount` is not
// > positive, or when the account holds less than `amount`
fn (mut a Account) withdraw(amount int) ! {
}

// Closing an account forgets its balance, so reopening the same account
// starts from zero again.
//
// > returns an error when the account is not open
fn (mut a Account) close() ! {
}

// > returns an error when the account is not open
fn (mut a Account) balance() !int {
}
