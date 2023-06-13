module main

struct Point {
	row    int
	column int
}

fn saddle_points(matrix [][]int) []Point {
	if matrix.len == 0 || matrix[0].len == 0 {
		return []
	}
	num_rows := matrix.len
	num_columns := matrix[0].len

	mut row_maximums := []int{cap: num_rows}
	for row in 0 .. num_rows {
		mut greatest := matrix[row][0]
		for column in 1 .. num_columns {
			element := matrix[row][column]
			if element > greatest {
				greatest = element
			}
		}
		row_maximums << greatest
	}
	assert row_maximums.len == num_rows

	mut column_minimums := []int{cap: num_columns}
	for column in 0 .. num_columns {
		mut least := matrix[0][column]
		for row in 1 .. num_rows {
			element := matrix[row][column]
			if element < least {
				least = element
			}
		}
		column_minimums << least
	}
	assert column_minimums.len == num_columns

	mut result := []Point{}
	for row in 0 .. num_rows {
		for column in 0 .. num_columns {
			element := matrix[row][column]
			if element == row_maximums[row] && element == column_minimums[column] {
				result << Point{
					row: row + 1
					column: column + 1
				}
			}
		}
	}
	return result
}
