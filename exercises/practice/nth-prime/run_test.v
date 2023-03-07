module main

fn test_first_prime() {
	assert nth_prime(1)! == 2
}

fn test_second_prime() {
	assert nth_prime(2)! == 3
}

fn test_sixth_prime() {
	assert nth_prime(6)! == 13
}

fn test_big_prime() {
	assert nth_prime(10001)! == 104743
}

fn test_zeroth_prime() {
	if res := nth_prime(0) {
		assert false, 'there is no zeroth prime'
	} else {
		assert err.msg() == 'n must be greater than 0'
	}
}
