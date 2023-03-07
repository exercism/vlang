module main

fn test_finds_a_value_in_an_array_with_one_element() {
	assert find([6], 6)! == 0
}

fn test_finds_a_value_in_the_middle_of_an_array() {
	assert find([1, 3, 4, 6, 8, 9, 11], 6)! == 3
}

fn test_finds_a_value_at_the_beginning_of_an_array() {
	assert find([1, 3, 4, 6, 8, 9, 11], 1)! == 0
}

fn test_finds_a_value_at_the_end_of_an_array() {
	assert find([1, 3, 4, 6, 8, 9, 11], 11)! == 6
}

fn test_finds_a_value_in_an_array_of_odd_length() {
	assert find([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634], 144)! == 9
}

fn test_finds_a_value_in_an_array_of_even_length() {
	assert find([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377], 21)! == 5
}

fn test_identifies_that_a_value_is_not_included_in_the_array() {
	if found_index := find([1, 3, 4, 6, 8, 9, 11], 7) {
		assert false, 'should return an error'
	} else {
		assert err.msg() == 'value not in array'
	}
}

fn test_a_value_smaller_than_the_array_s_smallest_value_is_not_found() {
	if found_index := find([1, 3, 4, 6, 8, 9, 11], 0) {
		assert false, 'should return an error'
	} else {
		assert err.msg() == 'value not in array'
	}
}

fn test_a_value_larger_than_the_array_s_largest_value_is_not_found() {
	if found_index := find([1, 3, 4, 6, 8, 9, 11], 13) {
		assert false, 'should return an error'
	} else {
		assert err.msg() == 'value not in array'
	}
}

fn test_nothing_is_found_in_an_empty_array() {
	if found_index := find([], 1) {
		assert false, 'should return an error'
	} else {
		assert err.msg() == 'value not in array'
	}
}

fn test_nothing_is_found_when_the_left_and_right_bounds_cross() {
	if found_index := find([1, 2], 0) {
		assert false, 'should return an error'
	} else {
		assert err.msg() == 'value not in array'
	}
}
