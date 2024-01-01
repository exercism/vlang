module main

fn test_only_a_single_book() {
	basket := [1]
	assert total(basket) == 800
}

fn test_two_of_the_same_book() {
	basket := [2, 2]
	assert total(basket) == 1600
}

fn test_empty_basket() {
	basket := []int{}
	assert total(basket) == 0
}

fn test_two_different_books() {
	basket := [1, 2]
	assert total(basket) == 1520
}

fn test_three_different_books() {
	basket := [1, 2, 3]
	assert total(basket) == 2160
}

fn test_four_different_books() {
	basket := [1, 2, 3, 4]
	assert total(basket) == 2560
}

fn test_five_different_books() {
	basket := [1, 2, 3, 4, 5]
	assert total(basket) == 3000
}

fn test_two_groups_of_four_is_cheaper_than_group_of_five_plus_group_of_three() {
	basket := [1, 1, 2, 2, 3, 3, 4, 5]
	assert total(basket) == 5120
}

fn test_two_groups_of_four_is_cheaper_than_groups_of_five_and_three() {
	basket := [1, 1, 2, 3, 4, 4, 5, 5]
	assert total(basket) == 5120
}

fn test_group_of_four_plus_group_of_two_is_cheaper_than_two_groups_of_three() {
	basket := [1, 1, 2, 2, 3, 4]
	assert total(basket) == 4080
}

fn test_two_each_of_first_four_books_and_one_copy_each_of_rest() {
	basket := [1, 1, 2, 2, 3, 3, 4, 4, 5]
	assert total(basket) == 5560
}

fn test_two_copies_of_each_book() {
	basket := [1, 1, 2, 2, 3, 3, 4, 4, 5, 5]
	assert total(basket) == 6000
}

fn test_three_copies_of_first_book_and_two_each_of_remaining() {
	basket := [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1]
	assert total(basket) == 6800
}

fn test_three_each_of_first_two_books_and_two_each_of_remaining_books() {
	basket := [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1, 2]
	assert total(basket) == 7520
}

fn test_four_groups_of_four_are_cheaper_than_two_groups_each_of_five_and_three() {
	basket := [1, 1, 2, 2, 3, 3, 4, 5, 1, 1, 2, 2, 3, 3, 4, 5]
	assert total(basket) == 10240
}

fn test_check_that_groups_of_four_are_created_properly_even_when_there_are_more_groups_of_three_than_groups_of_five() {
	basket := [1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 4, 4, 5, 5]
	assert total(basket) == 14560
}

fn test_one_group_of_one_and_four_is_cheaper_than_one_group_of_two_and_three() {
	basket := [1, 1, 2, 3, 4]
	assert total(basket) == 3360
}

fn test_one_group_of_one_and_two_plus_three_groups_of_four_is_cheaper_than_one_group_of_each_size() {
	basket := [1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5]
	assert total(basket) == 10000
}
