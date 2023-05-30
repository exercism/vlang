module main

fn test_single_bit_one_to_decimal() {
	assert rebase(2, [1], 10)! == [1]
}

fn test_binary_to_single_decimal() {
	assert rebase(2, [1, 0, 1], 10)! == [5]
}

fn test_single_decimal_to_binary() {
	assert rebase(10, [5], 2)! == [1, 0, 1]
}

fn test_binary_to_multiple_decimal() {
	assert rebase(2, [1, 0, 1, 0, 1, 0], 10)! == [4, 2]
}

fn test_decimal_to_binary() {
	assert rebase(10, [4, 2], 2)! == [1, 0, 1, 0, 1, 0]
}

fn test_trinary_to_hexadecimal() {
	assert rebase(3, [1, 1, 2, 0], 16)! == [2, 10]
}

fn test_hexadecimal_to_trinary() {
	assert rebase(16, [2, 10], 3)! == [1, 1, 2, 0]
}

fn test_15_bit_integer() {
	assert rebase(97, [3, 46, 60], 73)! == [6, 10, 45]
}

fn test_empty_list() {
	assert rebase(2, [], 10)! == [0]
}

fn test_single_zero() {
	assert rebase(10, [0], 2)! == [0]
}

fn test_multiple_zeros() {
	assert rebase(10, [0, 0, 0], 2)! == [0]
}

fn test_leading_zeros() {
	assert rebase(7, [0, 6, 0], 10)! == [4, 2]
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
