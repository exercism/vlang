module main

const side_none = 0

// Bitwise XOR with a side can be used to find a player's other side.
const side_opposite = 1

const side_top = 2

const side_bottom = 3

const side_left = 4

const side_right = 5

struct Cell {
	row    int
	column int
	side   int = side_none
}

// Each cell has 6 adjacent cells.
const deltas = [
	Cell{
		row: 0
		column: -1
	},
	Cell{
		row: 0
		column: 1
	},
	Cell{
		row: -1
		column: 0
	},
	Cell{
		row: 1
		column: 0
	},
	Cell{
		row: -1
		column: 1
	},
	Cell{
		row: 1
		column: -1
	},
]

fn winner(board []string) ?rune {
	row_count := board.len
	column_count := (board[0].len + 1) >> 1

	mut pending := []Cell{cap: (row_count + 2) * (column_count + 2)}
	for column in 0 .. column_count {
		pending << Cell{
			row: -1
			column: column
			side: side_top
		}
		pending << Cell{
			row: row_count
			column: column
			side: side_bottom
		}
	}
	for row in 0 .. row_count {
		pending << Cell{
			row: row
			column: -1
			side: side_left
		}
		pending << Cell{
			row: row
			column: column_count
			side: side_right
		}
	}

	mut reached := [][]int{len: row_count, init: []int{len: column_count, init: side_none}}

	for pending.len > 0 {
		current := pending.pop()

		// "Player `O`" plays from top to bottom,
		// "Player `X`" plays from left to right.
		player := if current.side <= side_bottom { `O` } else { `X` }

		// We consider the 6 cells adjacent to current, excluding those we don't occupy.
		// If any have not previously been reached, we queue them.
		// If any have been reached from the opposite side, we have won.
		for delta in deltas {
			row := current.row + delta.row
			column := current.column + delta.column
			if row < 0 || row >= row_count || column < 0 || column >= column_count {
				continue
			}
			occupant := board[row][row + 2 * column]
			if occupant != player {
				continue
			}
			if reached[row][column] == current.side {
				continue
			}
			if reached[row][column] == side_none {
				reached[row][column] = current.side
				pending << Cell{
					row: row
					column: column
					side: current.side
				}
				continue
			}
			assert reached[row][column] == current.side ^ side_opposite
			return player
		}
	}

	// No player has won.
	return none
}
