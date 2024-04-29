module main

fn test_empty_matrix() {
	matrix := [][]int{}
	expect := [][]int{}
	assert tick(matrix) == expect
}

fn test_live_cells_with_zero_live_neighbors_die() {
	matrix := [
		[0, 0, 0],
		[0, 1, 0],
		[0, 0, 0],
	]
	expect := [
		[0, 0, 0],
		[0, 0, 0],
		[0, 0, 0],
	]
	assert tick(matrix) == expect
}

fn test_live_cells_with_only_one_live_neighbor_die() {
	matrix := [
		[0, 0, 0],
		[0, 1, 0],
		[0, 1, 0],
	]
	expect := [
		[0, 0, 0],
		[0, 0, 0],
		[0, 0, 0],
	]
	assert tick(matrix) == expect
}

fn test_live_cells_with_two_live_neighbors_stay_alive() {
	matrix := [
		[1, 0, 1],
		[1, 0, 1],
		[1, 0, 1],
	]
	expect := [
		[0, 0, 0],
		[1, 0, 1],
		[0, 0, 0],
	]
	assert tick(matrix) == expect
}

fn test_live_cells_with_three_live_neighbors_stay_alive() {
	matrix := [
		[0, 1, 0],
		[1, 0, 0],
		[1, 1, 0],
	]
	expect := [
		[0, 0, 0],
		[1, 0, 0],
		[1, 1, 0],
	]
	assert tick(matrix) == expect
}

fn test_dead_cells_with_three_live_neighbors_become_alive() {
	matrix := [
		[1, 1, 0],
		[0, 0, 0],
		[1, 0, 0],
	]
	expect := [
		[0, 0, 0],
		[1, 1, 0],
		[0, 0, 0],
	]
	assert tick(matrix) == expect
}

fn test_live_cells_with_four_or_more_neighbors_die() {
	matrix := [
		[1, 1, 1],
		[1, 1, 1],
		[1, 1, 1],
	]
	expect := [
		[1, 0, 1],
		[0, 0, 0],
		[1, 0, 1],
	]
	assert tick(matrix) == expect
}

fn test_bigger_matrix() {
	matrix := [
		[1, 1, 0, 1, 1, 0, 0, 0],
		[1, 0, 1, 1, 0, 0, 0, 0],
		[1, 1, 1, 0, 0, 1, 1, 1],
		[0, 0, 0, 0, 0, 1, 1, 0],
		[1, 0, 0, 0, 1, 1, 0, 0],
		[1, 1, 0, 0, 0, 1, 1, 1],
		[0, 0, 1, 0, 1, 0, 0, 1],
		[1, 0, 0, 0, 0, 0, 1, 1],
	]
	expect := [
		[1, 1, 0, 1, 1, 0, 0, 0],
		[0, 0, 0, 0, 0, 1, 1, 0],
		[1, 0, 1, 1, 1, 1, 0, 1],
		[1, 0, 0, 0, 0, 0, 0, 1],
		[1, 1, 0, 0, 1, 0, 0, 1],
		[1, 1, 0, 1, 0, 0, 0, 1],
		[1, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 1, 1],
	]
	assert tick(matrix) == expect
}
