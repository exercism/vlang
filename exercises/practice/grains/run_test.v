module main

fn test_grains_sq_1() {
	assert grains_on_square(1)! == 1
}

fn test_grains_sq_2() {
	assert grains_on_square(2)! == 2
}

fn test_grains_sq_3() {
	assert grains_on_square(3)! == 4
}

fn test_grains_sq_4() {
	assert grains_on_square(4)! == 8
}

fn test_grains_sq_16() {
	assert grains_on_square(16)! == 32768
}

fn test_grains_sq_32() {
	assert grains_on_square(32)! == 2147483648
}

fn test_grains_sq_64() {
	assert grains_on_square(64)! == 9223372036854775808
}

fn test_error_0() {
	if res := grains_on_square(0) {
		assert false, "invalid square number should return error"
	} else {
		assert err.msg() == "square must be between 1 and 64" 
	}
}

fn test_error_1() {
	if res := grains_on_square(-1) {
		assert false, "invalid square number should return error"
	} else {
		assert err.msg() == "square must be between 1 and 64" 
	}
}

fn test_error_65() {
	if res := grains_on_square(65) {
		assert false, "invalid square number should return error"
	} else {
		assert err.msg() == "square must be between 1 and 64" 
	}
}

fn test_total_grains() {
	assert total_grains_on_board() == 18446744073709551615
}