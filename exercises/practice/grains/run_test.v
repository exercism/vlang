module main

fn test_grains_on_square_1() {
	if res := grains_on_square(1) {
		assert res == 1
	} else {
		assert false, 'grains_on_square(1) should not return an error'
	}
}

fn test_grains_on_square_2() {
	if res := grains_on_square(2) {
		assert res == 2
	} else {
		assert false, 'grains_on_square(2) should not return an error'
	}
}

fn test_grains_on_square_3() {
	if res := grains_on_square(3) {
		assert res == 4
	} else {
		assert false, 'grains_on_square(3) should not return an error'
	}
}

fn test_grains_on_square_4() {
	if res := grains_on_square(4) {
		assert res == 8
	} else {
		assert false, 'grains_on_square(4) should not return an error'
	}
}

fn test_grains_on_square_16() {
	if res := grains_on_square(16) {
		assert res == 32768
	} else {
		assert false, 'grains_on_square(16) should not return an error'
	}
}

fn test_grains_on_square_32() {
	if res := grains_on_square(32) {
		assert res == 2147483648
	} else {
		assert false, 'grains_on_square(32) should not return an error'
	}
}

fn test_grains_on_square_64() {
	if res := grains_on_square(64) {
		assert res == 9223372036854775808
	} else {
		assert false, 'grains_on_square(64) should not return an error'
	}
}

fn test_square_0_is_invalid() {
	if res := grains_on_square(0) {
		assert false, 'square 0 is invalid should return an error'
	} else {
		assert true
	}
}

fn test_negative_square_is_invalid() {
	if res := grains_on_square(-1) {
		assert false, 'negative square is invalid should return an error'
	} else {
		assert true
	}
}

fn test_square_greater_than_64_is_invalid() {
	if res := grains_on_square(65) {
		assert false, 'square greater than 64 is invalid should return an error'
	} else {
		assert true
	}
}

fn test_returns_the_total_number_of_grains_on_the_board() {
	assert total_grains_on_board() == 18446744073709551615
}
