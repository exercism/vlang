module main

fn test_an_empty_board_has_no_winner() {
	board := [
		'. . . . .',
		' . . . . .',
		'  . . . . .',
		'   . . . . .',
		'    . . . . .',
	]
	if _ := winner(board) {
		assert false, 'should return nothing'
	} else {
		assert true
	}
}

fn test_x_can_win_on_a_1x1_board() {
	board := [
		'X',
	]
	assert winner(board)! == `X`
}

fn test_o_can_win_on_a_1x1_board() {
	board := [
		'O',
	]
	assert winner(board)! == `O`
}

fn test_only_edges_does_not_make_a_winner() {
	board := [
		'O O O X',
		' X . . X',
		'  X . . X',
		'   X O O O',
	]
	if _ := winner(board) {
		assert false, 'should return nothing'
	} else {
		assert true
	}
}

fn test_illegal_diagonal_does_not_make_a_winner() {
	board := [
		'X O . .',
		' O X X X',
		'  O X O .',
		'   . O X .',
		'    X X O O',
	]
	if _ := winner(board) {
		assert false, 'should return nothing'
	} else {
		assert true
	}
}

fn test_nobody_wins_crossing_adjacent_angles() {
	board := [
		'X . . .',
		' . X O .',
		'  O . X O',
		'   . O . X',
		'    . . O .',
	]
	if _ := winner(board) {
		assert false, 'should return nothing'
	} else {
		assert true
	}
}

fn test_x_wins_crossing_from_left_to_right() {
	board := [
		'. O . .',
		' O X X X',
		'  O X O .',
		'   X X O X',
		'    . O X .',
	]
	assert winner(board)! == `X`
}

fn test_o_wins_crossing_from_top_to_bottom() {
	board := [
		'. O . .',
		' O X X X',
		'  O O O .',
		'   X X O X',
		'    . O X .',
	]
	assert winner(board)! == `O`
}

fn test_x_wins_using_a_convoluted_path() {
	board := [
		'. X X . .',
		' X . X . X',
		'  . X . X .',
		'   . X X . .',
		'    O O O O O',
	]
	assert winner(board)! == `X`
}

fn test_x_wins_using_a_spiral_path() {
	board := [
		'O X X X X X X X X',
		' O X O O O O O O O',
		'  O X O X X X X X O',
		'   O X O X O O O X O',
		'    O X O X X X O X O',
		'     O X O O O X O X O',
		'      O X X X X X O X O',
		'       O O O O O O O X O',
		'        X X X X X X X X O',
	]
	assert winner(board)! == `X`
}
