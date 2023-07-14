module main

fn test_1() {
	expect := [[1]]
	assert combinations(1, 1, []) == expect
}

fn test_2() {
	expect := [[2]]
	assert combinations(2, 1, []) == expect
}

fn test_3() {
	expect := [[3]]
	assert combinations(3, 1, []) == expect
}

fn test_4() {
	expect := [[4]]
	assert combinations(4, 1, []) == expect
}

fn test_5() {
	expect := [[5]]
	assert combinations(5, 1, []) == expect
}

fn test_6() {
	expect := [[6]]
	assert combinations(6, 1, []) == expect
}

fn test_7() {
	expect := [[7]]
	assert combinations(7, 1, []) == expect
}

fn test_8() {
	expect := [[8]]
	assert combinations(8, 1, []) == expect
}

fn test_9() {
	expect := [[9]]
	assert combinations(9, 1, []) == expect
}

fn test_cage_with_sum_45_contains_all_digits_1_9() {
	expect := [[1, 2, 3, 4, 5, 6, 7, 8, 9]]
	assert combinations(45, 9, []) == expect
}

fn test_cage_with_only_1_possible_combination() {
	expect := [[1, 2, 4]]
	assert combinations(7, 3, []) == expect
}

fn test_cage_with_several_combinations() {
	expect := [[1, 9], [2, 8], [3, 7], [4, 6]]
	assert combinations(10, 2, []) == expect
}

fn test_cage_with_several_combinations_that_is_restricted() {
	expect := [[2, 8], [3, 7]]
	assert combinations(10, 2, [1, 4]) == expect
}
