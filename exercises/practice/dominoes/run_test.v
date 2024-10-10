module main

fn test_empty_input_empty_output() {
	dominoes := [][]int{}
	assert can_chain(dominoes)
}

fn test_singleton_input_singleton_output() {
	dominoes := [[1, 1]]
	assert can_chain(dominoes)
}

fn test_singleton_that_cant_be_chained() {
	dominoes := [[1, 2]]
	assert !can_chain(dominoes)
}

fn test_three_elements() {
	dominoes := [[1, 2], [3, 1], [2, 3]]
	assert can_chain(dominoes)
}

fn test_can_reverse_dominoes() {
	dominoes := [[1, 2], [1, 3], [2, 3]]
	assert can_chain(dominoes)
}

fn test_cant_be_chained() {
	dominoes := [[1, 2], [4, 1], [2, 3]]
	assert !can_chain(dominoes)
}

fn test_disconnected___simple() {
	dominoes := [[1, 1], [2, 2]]
	assert !can_chain(dominoes)
}

fn test_disconnected___double_loop() {
	dominoes := [[1, 2], [2, 1], [3, 4], [4, 3]]
	assert !can_chain(dominoes)
}

fn test_disconnected___single_isolated() {
	dominoes := [[1, 2], [2, 3], [3, 1], [4, 4]]
	assert !can_chain(dominoes)
}

fn test_need_backtrack() {
	dominoes := [[1, 2], [2, 3], [3, 1], [2, 4], [2, 4]]
	assert can_chain(dominoes)
}

fn test_separate_loops() {
	dominoes := [[1, 2], [2, 3], [3, 1], [1, 1], [2, 2], [3, 3]]
	assert can_chain(dominoes)
}

fn test_nine_elements() {
	dominoes := [[1, 2], [5, 3], [3, 1], [1, 2], [2, 4], [1, 6], [2, 3], [3, 4], [5, 6]]
	assert can_chain(dominoes)
}

fn test_separate_three_domino_loops() {
	dominoes := [[1, 2], [2, 3], [3, 1], [4, 5], [5, 6], [6, 4]]
	assert !can_chain(dominoes)
}
