module main

fn test_single_bit_one_to_decimal() {
	if res := rebase(2, [1], 10) {
		assert res == [1]
	} else {
		assert false, 'rebase(2, [1], 10) should not return an error'
	}
}

fn test_binary_to_single_decimal() {
	if res := rebase(2, [1, 0, 1], 10) {
		assert res == [5]
	} else {
		assert false, 'rebase(2, [1, 0, 1], 10) should not return an error'
	}
}

fn test_single_decimal_to_binary() {
	if res := rebase(10, [5], 2) {
		assert res == [1, 0, 1]
	} else {
		assert false, 'rebase(10, [5], 2) should not return an error'
	}
}

fn test_binary_to_multiple_decimal() {
	if res := rebase(2, [1, 0, 1, 0, 1, 0], 10) {
		assert res == [4, 2]
	} else {
		assert false, 'rebase(2, [1, 0, 1, 0, 1, 0], 10) should not return an error'
	}
}

fn test_decimal_to_binary() {
	if res := rebase(10, [4, 2], 2) {
		assert res == [1, 0, 1, 0, 1, 0]
	} else {
		assert false, 'rebase(10, [4, 2], 2) should not return an error'
	}
}

fn test_trinary_to_hexadecimal() {
	if res := rebase(3, [1, 1, 2, 0], 16) {
		assert res == [2, 10]
	} else {
		assert false, 'rebase(3, [1, 1, 2, 0], 16) should not return an error'
	}
}

fn test_hexadecimal_to_trinary() {
	if res := rebase(16, [2, 10], 3) {
		assert res == [1, 1, 2, 0]
	} else {
		assert false, 'rebase(16, [2, 10], 3) should not return an error'
	}
}

fn test_15_bit_integer() {
	if res := rebase(97, [3, 46, 60], 73) {
		assert res == [6, 10, 45]
	} else {
		assert false, 'rebase(97, [3, 46, 60], 73) should not return an error'
	}
}

fn test_empty_list() {
	if res := rebase(2, [], 10) {
		assert res == [0]
	} else {
		assert false, 'rebase(2, [], 10) should not return an error'
	}
}

fn test_single_zero() {
	if res := rebase(10, [0], 2) {
		assert res == [0]
	} else {
		assert false, 'rebase(10, [0], 2) should not return an error'
	}
}

fn test_multiple_zeros() {
	if res := rebase(10, [0, 0, 0], 2) {
		assert res == [0]
	} else {
		assert false, 'rebase(10, [0, 0, 0], 2) should not return an error'
	}
}

fn test_leading_zeros() {
	if res := rebase(7, [0, 6, 0], 10) {
		assert res == [4, 2]
	} else {
		assert false, 'rebase(7, [0, 6, 0], 10) should not return an error'
	}
}

fn test_input_base_is_one() {
	if res := rebase(1, [0], 10) {
		assert false, 'input base one should return an error'
	} else {
		assert err.msg() == 'input base must be >= 2'
	}
}

fn test_input_base_is_zero() {
	if res := rebase(0, [], 10) {
		assert false, 'input base zero should return an error'
	} else {
		assert err.msg() == 'input base must be >= 2'
	}
}

fn test_input_base_is_negative() {
	if res := rebase(-2, [1], 10) {
		assert false, 'input base negative should return an error'
	} else {
		assert err.msg() == 'input base must be >= 2'
	}
}

fn test_negative_digit() {
	if res := rebase(2, [1, -1, 1, 0, 1, 0], 10) {
		assert false, 'negative digit should return an error'
	} else {
		assert err.msg() == 'all digits must satisfy 0 <= d < input base'
	}
}

fn test_invalid_positive_digit() {
	if res := rebase(2, [1, 2, 1, 0, 1, 0], 10) {
		assert false, 'invalid positive digit should return an error'
	} else {
		assert err.msg() == 'all digits must satisfy 0 <= d < input base'
	}
}

fn test_output_base_is_one() {
	if res := rebase(2, [1, 0, 1, 0, 1, 0], 1) {
		assert false, 'output base one should return an error'
	} else {
		assert err.msg() == 'output base must be >= 2'
	}
}

fn test_output_base_is_zero() {
	if res := rebase(10, [7], 0) {
		assert false, 'output base zero should return an error'
	} else {
		assert err.msg() == 'output base must be >= 2'
	}
}

fn test_output_base_is_negative() {
	if res := rebase(2, [1], -7) {
		assert false, 'output base negative should return an error'
	} else {
		assert err.msg() == 'output base must be >= 2'
	}
}

fn test_both_bases_are_negative() {
	if res := rebase(-2, [1], -7) {
		assert false, 'both bases negative should return an error'
	} else {
		assert err.msg() == 'input base must be >= 2'
	}
}
