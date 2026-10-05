module main

fn test_find_the_smallest_palindrome_from_single_digit_factors() {
	expected := Palindrome{
		value:   1
		factors: [[1, 1]]
	}
	if res := smallest(1, 9) {
		assert res == expected
	} else {
		assert false, 'smallest(1, 9) should not return an error'
	}
}

fn test_find_the_largest_palindrome_from_single_digit_factors() {
	expected := Palindrome{
		value:   9
		factors: [[1, 9], [3, 3]]
	}
	if res := largest(1, 9) {
		assert res == expected
	} else {
		assert false, 'largest(1, 9) should not return an error'
	}
}

fn test_find_the_smallest_palindrome_from_double_digit_factors() {
	expected := Palindrome{
		value:   121
		factors: [[11, 11]]
	}
	if res := smallest(10, 99) {
		assert res == expected
	} else {
		assert false, 'smallest(10, 99) should not return an error'
	}
}

fn test_find_the_largest_palindrome_from_double_digit_factors() {
	expected := Palindrome{
		value:   9009
		factors: [[91, 99]]
	}
	if res := largest(10, 99) {
		assert res == expected
	} else {
		assert false, 'largest(10, 99) should not return an error'
	}
}

fn test_find_the_smallest_palindrome_from_triple_digit_factors() {
	expected := Palindrome{
		value:   10201
		factors: [[101, 101]]
	}
	if res := smallest(100, 999) {
		assert res == expected
	} else {
		assert false, 'smallest(100, 999) should not return an error'
	}
}

fn test_find_the_largest_palindrome_from_triple_digit_factors() {
	expected := Palindrome{
		value:   906609
		factors: [[913, 993]]
	}
	if res := largest(100, 999) {
		assert res == expected
	} else {
		assert false, 'largest(100, 999) should not return an error'
	}
}

fn test_find_the_smallest_palindrome_from_four_digit_factors() {
	expected := Palindrome{
		value:   1002001
		factors: [[1001, 1001]]
	}
	if res := smallest(1000, 9999) {
		assert res == expected
	} else {
		assert false, 'smallest(1000, 9999) should not return an error'
	}
}

fn test_find_the_largest_palindrome_from_four_digit_factors() {
	expected := Palindrome{
		value:   99000099
		factors: [[9901, 9999]]
	}
	if res := largest(1000, 9999) {
		assert res == expected
	} else {
		assert false, 'largest(1000, 9999) should not return an error'
	}
}

fn test_empty_result_for_smallest_if_no_palindrome_in_the_range() {
	expected := Palindrome{
		value:   none
		factors: []
	}
	if res := smallest(1002, 1003) {
		assert res == expected
	} else {
		assert false, 'smallest(1002, 1003) should not return an error'
	}
}

fn test_empty_result_for_largest_if_no_palindrome_in_the_range() {
	expected := Palindrome{
		value:   none
		factors: []
	}
	if res := largest(15, 15) {
		assert res == expected
	} else {
		assert false, 'largest(15, 15) should not return an error'
	}
}

fn test_error_result_for_smallest_if_min_is_more_than_max() {
	if res := smallest(10000, 1) {
		assert false, 'if min more than max, smallest should return an error'
	} else {
		assert err.msg() == 'min must be <= max'
	}
}

fn test_error_result_for_largest_if_min_is_more_than_max() {
	if res := largest(2, 1) {
		assert false, 'if min more than max, largest should return an error'
	} else {
		assert err.msg() == 'min must be <= max'
	}
}

fn test_smallest_product_does_not_use_the_smallest_factor() {
	expected := Palindrome{
		value:   10988901
		factors: [[3297, 3333]]
	}
	if res := smallest(3215, 4000) {
		assert res == expected
	} else {
		assert false, 'smallest(3215, 4000) should not return an error'
	}
}
