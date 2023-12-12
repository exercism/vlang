module main

fn test_extract_row_from_one_number_matrix() {
	str := '1'
	assert row(str, 1) == [1]
}

fn test_can_extract_row() {
	str := '1 2\n3 4'
	assert row(str, 2) == [3, 4]
}

fn test_extract_row_where_numbers_have_different_widths() {
	str := '1 2\n10 20'
	assert row(str, 2) == [10, 20]
}

fn test_can_extract_row_from_non_square_matrix_with_no_corresponding_column() {
	str := '1 2 3\n4 5 6\n7 8 9\n8 7 6'
	assert row(str, 4) == [8, 7, 6]
}

fn test_extract_column_from_one_number_matrix() {
	str := '1'
	assert column(str, 1) == [1]
}

fn test_can_extract_column() {
	str := '1 2 3\n4 5 6\n7 8 9'
	assert column(str, 3) == [3, 6, 9]
}

fn test_can_extract_column_from_non_square_matrix_with_no_corresponding_row() {
	str := '1 2 3 4\n5 6 7 8\n9 8 7 6'
	assert column(str, 4) == [4, 8, 6]
}

fn test_extract_column_where_numbers_have_different_widths() {
	str := '89 1903 3\n18 3 1\n9 4 800'
	assert column(str, 2) == [1903, 3, 4]
}
