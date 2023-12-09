module main

const empty = []int{cap: 0}

fn test_empty_lists() {
	assert compare(empty, empty) == .equal
}

fn test_empty_list_within_non_empty_list() {
	list_two := [1, 2, 3]
	assert compare(empty, list_two) == .sublist
}

fn test_non_empty_list_contains_empty_list() {
	list_one := [1, 2, 3]
	assert compare(list_one, empty) == .superlist
}

fn test_list_equals_itself() {
	list_one := [1, 2, 3]
	list_two := [1, 2, 3]
	assert compare(list_one, list_two) == .equal
}

fn test_different_lists() {
	list_one := [1, 2, 3]
	list_two := [2, 3, 4]
	assert compare(list_one, list_two) == .unequal
}

fn test_false_start() {
	list_one := [1, 2, 5]
	list_two := [0, 1, 2, 3, 1, 2, 5, 6]
	assert compare(list_one, list_two) == .sublist
}

fn test_consecutive() {
	list_one := [1, 1, 2]
	list_two := [0, 1, 1, 1, 2, 1, 2]
	assert compare(list_one, list_two) == .sublist
}

fn test_sublist_at_start() {
	list_one := [0, 1, 2]
	list_two := [0, 1, 2, 3, 4, 5]
	assert compare(list_one, list_two) == .sublist
}

fn test_sublist_in_middle() {
	list_one := [2, 3, 4]
	list_two := [0, 1, 2, 3, 4, 5]
	assert compare(list_one, list_two) == .sublist
}

fn test_sublist_at_end() {
	list_one := [3, 4, 5]
	list_two := [0, 1, 2, 3, 4, 5]
	assert compare(list_one, list_two) == .sublist
}

fn test_at_start_of_superlist() {
	list_one := [0, 1, 2, 3, 4, 5]
	list_two := [0, 1, 2]
	assert compare(list_one, list_two) == .superlist
}

fn test_in_middle_of_superlist() {
	list_one := [0, 1, 2, 3, 4, 5]
	list_two := [2, 3]
	assert compare(list_one, list_two) == .superlist
}

fn test_at_end_of_superlist() {
	list_one := [0, 1, 2, 3, 4, 5]
	list_two := [3, 4, 5]
	assert compare(list_one, list_two) == .superlist
}

fn test_first_list_missing_element_from_second_list() {
	list_one := [1, 3]
	list_two := [1, 2, 3]
	assert compare(list_one, list_two) == .unequal
}

fn test_second_list_missing_element_from_first_list() {
	list_one := [1, 2, 3]
	list_two := [1, 3]
	assert compare(list_one, list_two) == .unequal
}

fn test_first_list_missing_additional_digits_from_second_list() {
	list_one := [1, 2]
	list_two := [1, 22]
	assert compare(list_one, list_two) == .unequal
}

fn test_order_matters_to_a_list() {
	list_one := [1, 2, 3]
	list_two := [3, 2, 1]
	assert compare(list_one, list_two) == .unequal
}

fn test_same_digits_but_different_numbers() {
	list_one := [1, 0, 1]
	list_two := [10, 1]
	assert compare(list_one, list_two) == .unequal
}
