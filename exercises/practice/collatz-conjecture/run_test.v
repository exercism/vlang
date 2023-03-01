module main

fn test_zero_steps_for_one() {
	if res := collatz(1) {
		assert res == 0
	} else {
		assert false, 'collatz(1) should return 0, not an error'
	}
}

fn test_divide_if_even() {
	if res := collatz(16) {
		assert res == 4
	} else {
		assert false, 'collatz(16) should return 4, not an error'
	}
}

fn test_even_and_odd_steps() {
	if res := collatz(12) {
		assert res == 9
	} else {
		assert false, 'collatz(12) should return 9, not an error'
	}
}

fn test_large_number_of_even_and_odd_steps() {
	if res := collatz(1000000) {
		assert res == 152
	} else {
		assert false, 'collatz(1000000) should return 152, not an error'
	}
}

fn test_zero_is_an_error() {
	if res := collatz(0) {
		assert false, 'collatz(0) should return an error, not ${res}'
	} else {
		assert true
	}
}

fn test_negative_value_is_an_error() {
	if res := collatz(-15) {
		assert false, 'collatz(-15) should return an error, not ${res}'
	} else {
		assert true
	}
}
