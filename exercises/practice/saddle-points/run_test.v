module main

fn test_can_identify_single_saddle_point() {
	matrix := [
		[9, 8, 7],
		[5, 3, 2],
		[6, 6, 7],
	]
	expected := [
		Point{
			row: 2
			column: 1
		},
	]
	assert saddle_points(matrix) == expected
}

fn test_can_identify_that_empty_matrix_has_no_saddle_points() {
	matrix := [
		[]int{},
	]
	expected := []Point{}
	assert saddle_points(matrix) == expected
}

fn test_can_identify_lack_of_saddle_points_when_there_are_none() {
	matrix := [
		[1, 2, 3],
		[3, 1, 2],
		[2, 3, 1],
	]
	expected := []Point{}
	assert saddle_points(matrix) == expected
}

fn test_can_identify_multiple_saddle_points_in_a_column() {
	matrix := [
		[4, 5, 4],
		[3, 5, 5],
		[1, 5, 4],
	]
	expected := [
		Point{
			row: 1
			column: 2
		},
		Point{
			row: 2
			column: 2
		},
		Point{
			row: 3
			column: 2
		},
	]
	assert saddle_points(matrix) == expected
}

fn test_can_identify_multiple_saddle_points_in_a_row() {
	matrix := [
		[6, 7, 8],
		[5, 5, 5],
		[7, 5, 6],
	]
	expected := [
		Point{
			row: 2
			column: 1
		},
		Point{
			row: 2
			column: 2
		},
		Point{
			row: 2
			column: 3
		},
	]
	assert saddle_points(matrix) == expected
}

fn test_can_identify_saddle_point_in_bottom_right_corner() {
	matrix := [
		[8, 7, 9],
		[6, 7, 6],
		[3, 2, 5],
	]
	expected := [
		Point{
			row: 3
			column: 3
		},
	]
	assert saddle_points(matrix) == expected
}

fn test_can_identify_saddle_points_in_a_non_square_matrix() {
	matrix := [
		[3, 1, 3],
		[3, 2, 4],
	]
	expected := [
		Point{
			row: 1
			column: 1
		},
		Point{
			row: 1
			column: 3
		},
	]
	assert saddle_points(matrix) == expected
}

fn test_can_identify_that_saddle_points_in_a_single_column_matrix_are_those_with_the_minimum_value() {
	matrix := [
		[2],
		[1],
		[4],
		[1],
	]
	expected := [
		Point{
			row: 2
			column: 1
		},
		Point{
			row: 4
			column: 1
		},
	]
	assert saddle_points(matrix) == expected
}

fn test_can_identify_that_saddle_points_in_a_single_row_matrix_are_those_with_the_maximum_value() {
	matrix := [
		[2, 5, 3, 5],
	]
	expected := [
		Point{
			row: 1
			column: 2
		},
		Point{
			row: 1
			column: 4
		},
	]
	assert saddle_points(matrix) == expected
}
