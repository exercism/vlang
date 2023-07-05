module main

// Grid rows and columns are 1-indexed.
struct Pair {
	column int
	row    int
}

struct WordLocation {
	start Pair
	end   Pair
}

fn search(grid []string, words_to_search_for []string) map[string]?WordLocation {
	mut result := map[string]?WordLocation{}
	rows := grid.len
	columns := if rows == 0 { 0 } else { grid[0].len }
	for word in words_to_search_for {
		last_char_index := word.len - 1
		mut word_result := ?WordLocation(none)
		for delta_row in -1 .. 2 {
			begin_row := if delta_row < 0 { last_char_index } else { 0 }
			end_row := if delta_row <= 0 { rows } else { rows - last_char_index }
			for delta_column in -1 .. 2 {
				if delta_row == 0 && delta_column == 0 {
					continue
				}
				begin_column := if delta_column < 0 { last_char_index } else { 0 }
				end_column := if delta_column <= 0 { columns } else { columns - last_char_index }

				for row in begin_row .. end_row {
					scan: for column in begin_column .. end_column {
						for i in 0 .. word.len {
							if grid[row + i * delta_row][column + i * delta_column] != word[i] {
								continue scan
							}
						}
						word_result = ?WordLocation{
							start: Pair{
								column: column + 1
								row: row + 1
							}
							end: Pair{
								column: column + 1 + last_char_index * delta_column
								row: row + 1 + last_char_index * delta_row
							}
						}
					}
				}
			}
		}
		result[word] = word_result
	}
	return result
}
