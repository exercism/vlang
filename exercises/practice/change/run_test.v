module main

fn test_change_for_1_cent() {
	assert find_fewest_coins([1, 5, 10, 25], 1)! == [1]
}

fn test_single_coin_change() {
	assert find_fewest_coins([1, 5, 10, 25, 100], 25)! == [25]
}

fn test_multiple_coin_change() {
	assert find_fewest_coins([1, 5, 10, 25, 100], 15)! == [5, 10]
}

fn test_change_with_lilliputian_coins() {
	assert find_fewest_coins([1, 4, 15, 20, 50], 23)! == [4, 4, 15]
}

fn test_change_with_lower_elbonia_coins() {
	assert find_fewest_coins([1, 5, 10, 21, 25], 63)! == [21, 21, 21]
}

fn test_large_target_values() {
	assert find_fewest_coins([1, 2, 5, 10, 20, 50, 100], 999)! == [2, 2, 5, 20, 20, 50, 100, 100,
		100, 100, 100, 100, 100, 100, 100]
}

fn test_possible_change_without_unit_coins_available() {
	assert find_fewest_coins([2, 5, 10, 20, 50], 21)! == [2, 2, 2, 5, 10]
}

fn test_another_possible_change_without_unit_coins_available() {
	assert find_fewest_coins([4, 5], 27)! == [4, 4, 4, 5, 5, 5]
}

fn test_no_coins_make_0_change() {
	assert find_fewest_coins([1, 5, 10, 21, 25], 0)! == []
}

fn test_error_testing_for_change_smaller_than_the_smallest_of_coins() {
	if res := find_fewest_coins([5, 10], 3) {
		assert false, 'error testing for change smaller than the smallest of coins should return an error'
	} else {
		assert err.msg() == "can't make target with given coins"
	}
}

fn test_error_if_no_combination_can_add_up_to_target() {
	if res := find_fewest_coins([5, 10], 94) {
		assert false, 'error if no combination can add up to target should return an error'
	} else {
		assert err.msg() == "can't make target with given coins"
	}
}

fn test_cannot_find_negative_change_values() {
	if res := find_fewest_coins([1, 2, 5], -5) {
		assert false, 'cannot find negative change values should return an error'
	} else {
		assert err.msg() == "target can't be negative"
	}
}
