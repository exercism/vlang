module main

fn test_square_of_sum_1() {
	assert square_of_sum(1) == 1
}

fn test_square_of_sum_5() {
	assert square_of_sum(5) == 225
}

fn test_square_of_sum_100() {
	assert square_of_sum(100) == 25_502_500
}

fn test_sum_of_squares_1() {
	assert sum_of_squares(1) == 1
}

fn test_sum_of_squares_5() {
	assert sum_of_squares(5) == 55
}

fn test_sum_of_squares_100() {
	assert sum_of_squares(100) == 338_350
}

fn test_difference_1() {
	assert difference(1) == 0
}

fn test_difference_5() {
	assert difference(5) == 170
}

fn test_difference_100() {
	assert difference(100) == 25_164_150
}
