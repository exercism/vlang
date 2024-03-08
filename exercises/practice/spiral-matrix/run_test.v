module main

fn test_empty_spiral() {
	expect := [][]int{}
	assert spiral_matrix(0) == expect
}

fn test_trivial_spiral() {
	expect := [
		[1],
	]
	assert spiral_matrix(1) == expect
}

fn test_spiral_of_size_2() {
	expect := [
		[1, 2],
		[4, 3],
	]
	assert spiral_matrix(2) == expect
}

fn test_spiral_of_size_3() {
	expect := [
		[1, 2, 3],
		[8, 9, 4],
		[7, 6, 5],
	]
	assert spiral_matrix(3) == expect
}

fn test_spiral_of_size_4() {
	expect := [
		[1, 2, 3, 4],
		[12, 13, 14, 5],
		[11, 16, 15, 6],
		[10, 9, 8, 7],
	]
	assert spiral_matrix(4) == expect
}

fn test_spiral_of_size_5() {
	expect := [
		[1, 2, 3, 4, 5],
		[16, 17, 18, 19, 6],
		[15, 24, 25, 20, 7],
		[14, 23, 22, 21, 8],
		[13, 12, 11, 10, 9],
	]
	assert spiral_matrix(5) == expect
}
