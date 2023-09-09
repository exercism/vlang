module main

fn test_zero_rows() {
	assert rows(0) == []
}

fn test_single_row() {
	assert rows(1) == [
		[1],
	]
}

fn test_two_rows() {
	assert rows(2) == [
		[1],
		[1, 1],
	]
}

fn test_three_rows() {
	assert rows(3) == [
		[1],
		[1, 1],
		[1, 2, 1],
	]
}

fn test_four_rows() {
	assert rows(4) == [
		[1],
		[1, 1],
		[1, 2, 1],
		[1, 3, 3, 1],
	]
}

fn test_five_rows() {
	assert rows(5) == [
		[1],
		[1, 1],
		[1, 2, 1],
		[1, 3, 3, 1],
		[1, 4, 6, 4, 1],
	]
}

fn test_six_rows() {
	assert rows(6) == [
		[1],
		[1, 1],
		[1, 2, 1],
		[1, 3, 3, 1],
		[1, 4, 6, 4, 1],
		[1, 5, 10, 10, 5, 1],
	]
}

fn test_ten_rows() {
	assert rows(10) == [
		[1],
		[1, 1],
		[1, 2, 1],
		[1, 3, 3, 1],
		[1, 4, 6, 4, 1],
		[1, 5, 10, 10, 5, 1],
		[1, 6, 15, 20, 15, 6, 1],
		[1, 7, 21, 35, 35, 21, 7, 1],
		[1, 8, 28, 56, 70, 56, 28, 8, 1],
		[1, 9, 36, 84, 126, 126, 84, 36, 9, 1],
	]
}
