module main

enum State as u8 {
	ongoing
	draw
	win
}

fn is_win(bitset int) bool {
	lines := [
		0x007,
		0x070,
		0x700,
		0x111,
		0x222,
		0x444,
		0x124,
		0x421,
	]

	for line in lines {
		if (bitset & line) == line {
			return true
		}
	}

	return false
}

fn gamestate(board []string) !State {
	mut count_x := 0
	mut count_o := 0
	mut bitset_x := 0
	mut bitset_o := 0
	for row in 0 .. 3 {
		for column in 0 .. 3 {
			if board[row][column] == `X` {
				count_x++
				bitset_x |= 1 << (4 * row + column)
			}

			if board[row][column] == `O` {
				count_o++
				bitset_o |= 1 << (4 * row + column)
			}
		}
	}

	if count_o > count_x {
		return error('Wrong turn order: O started')
	}

	if count_x > count_o + 1 {
		return error('Wrong turn order: X went twice')
	}

	mut win_x := is_win(bitset_x)
	mut win_o := is_win(bitset_o)

	if win_x || win_o {
		if win_x && win_o {
			return error('Impossible board: game should have ended after the game was won')
		}

		return .win
	}

	return if count_x + count_o == 9 { .draw } else { .ongoing }
}
