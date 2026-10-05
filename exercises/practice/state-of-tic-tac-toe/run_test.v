module main

fn test_won_games__finished_game_where_x_won_via_left_column_victory() {
	board := [
		'XOO',
		'X  ',
		'X  ',
	]
	if res := gamestate(board) {
		assert res == .win
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_won_games__finished_game_where_x_won_via_middle_column_victory() {
	board := [
		'OXO',
		' X ',
		' X ',
	]
	if res := gamestate(board) {
		assert res == .win
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_won_games__finished_game_where_x_won_via_right_column_victory() {
	board := [
		'OOX',
		'  X',
		'  X',
	]
	if res := gamestate(board) {
		assert res == .win
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_won_games__finished_game_where_o_won_via_left_column_victory() {
	board := [
		'OXX',
		'OX ',
		'O  ',
	]
	if res := gamestate(board) {
		assert res == .win
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_won_games__finished_game_where_o_won_via_middle_column_victory() {
	board := [
		'XOX',
		' OX',
		' O ',
	]
	if res := gamestate(board) {
		assert res == .win
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_won_games__finished_game_where_o_won_via_right_column_victory() {
	board := [
		'XXO',
		' XO',
		'  O',
	]
	if res := gamestate(board) {
		assert res == .win
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_won_games__finished_game_where_x_won_via_top_row_victory() {
	board := [
		'XXX',
		'XOO',
		'O  ',
	]
	if res := gamestate(board) {
		assert res == .win
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_won_games__finished_game_where_x_won_via_middle_row_victory() {
	board := [
		'O  ',
		'XXX',
		' O ',
	]
	if res := gamestate(board) {
		assert res == .win
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_won_games__finished_game_where_x_won_via_bottom_row_victory() {
	board := [
		' OO',
		'O X',
		'XXX',
	]
	if res := gamestate(board) {
		assert res == .win
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_won_games__finished_game_where_o_won_via_top_row_victory() {
	board := [
		'OOO',
		'XXO',
		'XX ',
	]
	if res := gamestate(board) {
		assert res == .win
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_won_games__finished_game_where_o_won_via_middle_row_victory() {
	board := [
		'XX ',
		'OOO',
		'X  ',
	]
	if res := gamestate(board) {
		assert res == .win
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_won_games__finished_game_where_o_won_via_bottom_row_victory() {
	board := [
		'XOX',
		' XX',
		'OOO',
	]
	if res := gamestate(board) {
		assert res == .win
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_won_games__finished_game_where_x_won_via_falling_diagonal_victory() {
	board := [
		'XOO',
		' X ',
		'  X',
	]
	if res := gamestate(board) {
		assert res == .win
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_won_games__finished_game_where_x_won_via_rising_diagonal_victory() {
	board := [
		'O X',
		'OX ',
		'X  ',
	]
	if res := gamestate(board) {
		assert res == .win
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_won_games__finished_game_where_o_won_via_falling_diagonal_victory() {
	board := [
		'OXX',
		'OOX',
		'X O',
	]
	if res := gamestate(board) {
		assert res == .win
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_won_games__finished_game_where_o_won_via_rising_diagonal_victory() {
	board := [
		'  O',
		' OX',
		'OXX',
	]
	if res := gamestate(board) {
		assert res == .win
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_won_games__finished_game_where_x_won_via_a_row_and_a_column_victory() {
	board := [
		'XXX',
		'XOO',
		'XOO',
	]
	if res := gamestate(board) {
		assert res == .win
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_won_games__finished_game_where_x_won_via_two_diagonal_victories() {
	board := [
		'XOX',
		'OXO',
		'XOX',
	]
	if res := gamestate(board) {
		assert res == .win
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_drawn_games__draw() {
	board := [
		'XOX',
		'XXO',
		'OXO',
	]
	if res := gamestate(board) {
		assert res == .draw
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_drawn_games__another_draw() {
	board := [
		'XXO',
		'OXX',
		'XOO',
	]
	if res := gamestate(board) {
		assert res == .draw
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_ongoing_games__ongoing_game__one_move_in() {
	board := [
		'   ',
		'X  ',
		'   ',
	]
	if res := gamestate(board) {
		assert res == .ongoing
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_ongoing_games__ongoing_game__two_moves_in() {
	board := [
		'O  ',
		' X ',
		'   ',
	]
	if res := gamestate(board) {
		assert res == .ongoing
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_ongoing_games__ongoing_game__five_moves_in() {
	board := [
		'X  ',
		' XO',
		'OX ',
	]
	if res := gamestate(board) {
		assert res == .ongoing
	} else {
		assert false, 'gamestate(board) should not return an error'
	}
}

fn test_invalid_boards__invalid_board__x_went_twice() {
	board := [
		'XX ',
		'   ',
		'   ',
	]
	if res := gamestate(board) {
		assert false, 'Invalid board: X went twice should return an error'
	} else {
		assert err.msg() == 'Wrong turn order: X went twice'
	}
}

fn test_invalid_boards__invalid_board__o_started() {
	board := [
		'OOX',
		'   ',
		'   ',
	]
	if res := gamestate(board) {
		assert false, 'Invalid board: O started should return an error'
	} else {
		assert err.msg() == 'Wrong turn order: O started'
	}
}

fn test_invalid_boards__invalid_board__x_won_and_o_kept_playing() {
	board := [
		'XXX',
		'OOO',
		'   ',
	]
	if res := gamestate(board) {
		assert false, 'Invalid board: X won and O kept playing should return an error'
	} else {
		assert err.msg() == 'Impossible board: game should have ended after the game was won'
	}
}

fn test_invalid_boards__invalid_board__players_kept_playing_after_a_win() {
	board := [
		'XXX',
		'OOO',
		'XOX',
	]
	if res := gamestate(board) {
		assert false, 'Invalid board: players kept playing after a win should return an error'
	} else {
		assert err.msg() == 'Impossible board: game should have ended after the game was won'
	}
}

fn test_invalid_boards__invalid_board__o_kept_playing_after_x_wins() {
	board := [
		'OO ',
		'XXX',
		' O ',
	]
	if res := gamestate(board) {
		assert false, 'Invalid board: O kept playing after X wins should return an error'
	} else {
		assert err.msg() == 'Impossible board: game should have ended after the game was won'
	}
}

fn test_invalid_boards__invalid_board__x_kept_playing_after_o_wins() {
	board := [
		'XX ',
		'OOO',
		' XX',
	]
	if res := gamestate(board) {
		assert false, 'Invalid board: X kept playing after O wins should return an error'
	} else {
		assert err.msg() == 'Impossible board: game should have ended after the game was won'
	}
}
