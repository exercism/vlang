module main

fn annotate(garden []string) []string {
	row_count := garden.len
	if row_count == 0 {
		return []
	}
	column_count := garden[0].len
	mut result := []string{cap: row_count}
	for row in 0 .. row_count {
		mut buffer := []u8{cap: column_count}
		for col in 0 .. column_count {
			if garden[row][col] == `*` {
				buffer << u8(`*`)
				continue
			}
			// Number of flowers in the 3x3 grid centred at (row,col), as ASCII digit.
			mut flower_count := `0`
			for r in maximum(0, row - 1) .. minimum(row_count, row + 2) {
				for c in maximum(0, col - 1) .. minimum(column_count, col + 2) {
					if garden[r][c] == `*` {
						flower_count++
					}
				}
			}
			buffer << u8(if flower_count > `0` { flower_count } else { ` ` })
		}
		assert buffer.len == column_count
		result << buffer.bytestr()
	}
	assert result.len == row_count
	return result
}

fn minimum(a int, b int) int {
	return if a < b { a } else { b }
}

fn maximum(a int, b int) int {
	return if a > b { a } else { b }
}
