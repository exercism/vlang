module main

fn test_finds_a_value_in_an_array_with_one_element() {
	if res := find([6], 6) {
		assert res == 0
	} else {
		assert false, 'find([6], 6) should not return an error'
	}
}

fn test_finds_a_value_in_the_middle_of_an_array() {
	if res := find([1, 3, 4, 6, 8, 9, 11], 6) {
		assert res == 3
	} else {
		assert false, 'find([1, 3, 4, 6, 8, 9, 11], 6) should not return an error'
	}
}

fn test_finds_a_value_at_the_beginning_of_an_array() {
	if res := find([1, 3, 4, 6, 8, 9, 11], 1) {
		assert res == 0
	} else {
		assert false, 'find([1, 3, 4, 6, 8, 9, 11], 1) should not return an error'
	}
}

fn test_finds_a_value_at_the_end_of_an_array() {
	if res := find([1, 3, 4, 6, 8, 9, 11], 11) {
		assert res == 6
	} else {
		assert false, 'find([1, 3, 4, 6, 8, 9, 11], 11) should not return an error'
	}
}

fn test_finds_a_value_in_an_array_of_odd_length() {
	if res := find([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634], 144) {
		assert res == 9
	} else {
		assert false, 'find([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634], 144) should not return an error'
	}
}

fn test_finds_a_value_in_an_array_of_even_length() {
	if res := find([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377], 21) {
		assert res == 5
	} else {
		assert false, 'find([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377], 21) should not return an error'
	}
}

fn test_identifies_that_a_value_is_not_included_in_the_array() {
	if res := find([1, 3, 4, 6, 8, 9, 11], 7) {
		assert false, 'identifies that a value is not included in the array should return an error'
	} else {
		assert err.msg() == 'value not in array'
	}
}

fn test_a_value_smaller_than_the_arrays_smallest_value_is_not_found() {
	if res := find([1, 3, 4, 6, 8, 9, 11], 0) {
		assert false, "a value smaller than the array's smallest value is not found should return an error"
	} else {
		assert err.msg() == 'value not in array'
	}
}

fn test_a_value_larger_than_the_arrays_largest_value_is_not_found() {
	if res := find([1, 3, 4, 6, 8, 9, 11], 13) {
		assert false, "a value larger than the array's largest value is not found should return an error"
	} else {
		assert err.msg() == 'value not in array'
	}
}

fn test_nothing_is_found_in_an_empty_array() {
	if res := find([]int{}, 1) {
		assert false, 'nothing is found in an empty array should return an error'
	} else {
		assert err.msg() == 'value not in array'
	}
}

fn test_nothing_is_found_when_the_left_and_right_bounds_cross() {
	if res := find([1, 2], 0) {
		assert false, 'nothing is found when the left and right bounds cross should return an error'
	} else {
		assert err.msg() == 'value not in array'
	}
}
