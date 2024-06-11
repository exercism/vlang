module main

fn test_yacht() {
	assert score(Category.yacht, [u8(5), 5, 5, 5, 5]) == 50
}

fn test_not_yacht() {
	assert score(Category.yacht, [u8(1), 3, 3, 2, 5]) == 0
}

fn test_ones() {
	assert score(Category.ones, [u8(1), 1, 1, 3, 5]) == 3
}

fn test_ones_out_of_order() {
	assert score(Category.ones, [u8(3), 1, 1, 5, 1]) == 3
}

fn test_no_ones() {
	assert score(Category.ones, [u8(4), 3, 6, 5, 5]) == 0
}

fn test_twos() {
	assert score(Category.twos, [u8(2), 3, 4, 5, 6]) == 2
}

fn test_fours() {
	assert score(Category.fours, [u8(1), 4, 1, 4, 1]) == 8
}

fn test_yacht_counted_as_threes() {
	assert score(Category.threes, [u8(3), 3, 3, 3, 3]) == 15
}

fn test_yacht_of_3s_counted_as_fives() {
	assert score(Category.fives, [u8(3), 3, 3, 3, 3]) == 0
}

fn test_fives() {
	assert score(Category.fives, [u8(1), 5, 3, 5, 3]) == 10
}

fn test_sixes() {
	assert score(Category.sixes, [u8(2), 3, 4, 5, 6]) == 6
}

fn test_full_house_two_small_three_big() {
	assert score(Category.full_house, [u8(2), 2, 4, 4, 4]) == 16
}

fn test_full_house_three_small_two_big() {
	assert score(Category.full_house, [u8(5), 3, 3, 5, 3]) == 19
}

fn test_two_pair_is_not_a_full_house() {
	assert score(Category.full_house, [u8(2), 2, 4, 4, 5]) == 0
}

fn test_four_of_a_kind_is_not_a_full_house() {
	assert score(Category.full_house, [u8(1), 4, 4, 4, 4]) == 0
}

fn test_yacht_is_not_a_full_house() {
	assert score(Category.full_house, [u8(2), 2, 2, 2, 2]) == 0
}

fn test_four_of_a_kind() {
	assert score(Category.four_of_a_kind, [u8(6), 6, 4, 6, 6]) == 24
}

fn test_yacht_can_be_scored_as_four_of_a_kind() {
	assert score(Category.four_of_a_kind, [u8(3), 3, 3, 3, 3]) == 12
}

fn test_full_house_is_not_four_of_a_kind() {
	assert score(Category.four_of_a_kind, [u8(3), 3, 3, 5, 5]) == 0
}

fn test_little_straight() {
	assert score(Category.little_straight, [u8(3), 5, 4, 1, 2]) == 30
}

fn test_little_straight_as_big_straight() {
	assert score(Category.big_straight, [u8(1), 2, 3, 4, 5]) == 0
}

fn test_four_in_order_but_not_a_little_straight() {
	assert score(Category.little_straight, [u8(1), 1, 2, 3, 4]) == 0
}

fn test_no_pairs_but_not_a_little_straight() {
	assert score(Category.little_straight, [u8(1), 2, 3, 4, 6]) == 0
}

fn test_minimum_is_1_maximum_is_5_but_not_a_little_straight() {
	assert score(Category.little_straight, [u8(1), 1, 3, 4, 5]) == 0
}

fn test_big_straight() {
	assert score(Category.big_straight, [u8(4), 6, 2, 5, 3]) == 30
}

fn test_big_straight_as_little_straight() {
	assert score(Category.little_straight, [u8(6), 5, 4, 3, 2]) == 0
}

fn test_no_pairs_but_not_a_big_straight() {
	assert score(Category.big_straight, [u8(6), 5, 4, 3, 1]) == 0
}

fn test_choice() {
	assert score(Category.choice, [u8(3), 3, 5, 6, 6]) == 23
}

fn test_yacht_as_choice() {
	assert score(Category.choice, [u8(2), 2, 2, 2, 2]) == 10
}
