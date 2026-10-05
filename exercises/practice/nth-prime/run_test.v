module main

fn test_first_prime() {
	if res := nth_prime(1) {
		assert res == 2
	} else {
		assert false, 'nth_prime(1) should not return an error'
	}
}

fn test_second_prime() {
	if res := nth_prime(2) {
		assert res == 3
	} else {
		assert false, 'nth_prime(2) should not return an error'
	}
}

fn test_sixth_prime() {
	if res := nth_prime(6) {
		assert res == 13
	} else {
		assert false, 'nth_prime(6) should not return an error'
	}
}

fn test_big_prime() {
	if res := nth_prime(10001) {
		assert res == 104743
	} else {
		assert false, 'nth_prime(10001) should not return an error'
	}
}

fn test_there_is_no_zeroth_prime() {
	if res := nth_prime(0) {
		assert false, 'there is no zeroth prime should return an error'
	} else {
		assert err.msg() == 'n must be greater than 0'
	}
}
