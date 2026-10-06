module main

fn test_initially_9_failures_are_allowed_and_no_letters_are_guessed() {
	game := new_game('loot')
	assert game.state == State.ongoing
	assert game.masked_word() == '____'
	assert game.remaining == 9
}

fn test_after_10_failures_the_game_is_over() {
	mut game := new_game('loot')
	for letter in 'abcdefghi' {
		game.guess(letter) or { assert false, 'guessing should not fail' }
	}
	if state := game.guess(`j`) {
		assert state == State.lose
	} else {
		assert false, 'guessing `j` should not fail'
	}
	assert game.state == State.lose
	assert game.masked_word() == '____'
	assert game.remaining == 0
}

fn test_losing_with_several_correct_guesses() {
	mut game := new_game('loot')
	for letter in 'toabcdefghi' {
		game.guess(letter) or { assert false, 'guessing should not fail' }
	}
	if state := game.guess(`j`) {
		assert state == State.lose
	} else {
		assert false, 'guessing `j` should not fail'
	}
	assert game.state == State.lose
	assert game.masked_word() == '_oot'
	assert game.remaining == 0
}

fn test_feeding_a_correct_letter_removes_underscores() {
	mut game := new_game('loot')
	if state := game.guess(`t`) {
		assert state == State.ongoing
	} else {
		assert false, 'guessing `t` should not fail'
	}
	assert game.state == State.ongoing
	assert game.masked_word() == '___t'
	assert game.remaining == 9
}

fn test_feeding_a_correct_letter_twice_counts_as_a_failure() {
	mut game := new_game('loot')
	for letter in 't' {
		game.guess(letter) or { assert false, 'guessing should not fail' }
	}
	if state := game.guess(`t`) {
		assert state == State.ongoing
	} else {
		assert false, 'guessing `t` should not fail'
	}
	assert game.state == State.ongoing
	assert game.masked_word() == '___t'
	assert game.remaining == 8
}

fn test_guessing_a_repeated_letter_reveals_all_instances() {
	mut game := new_game('loot')
	for letter in 'tt' {
		game.guess(letter) or { assert false, 'guessing should not fail' }
	}
	if state := game.guess(`o`) {
		assert state == State.ongoing
	} else {
		assert false, 'guessing `o` should not fail'
	}
	assert game.state == State.ongoing
	assert game.masked_word() == '_oot'
	assert game.remaining == 8
}

fn test_getting_all_the_letters_right_makes_for_a_win() {
	mut game := new_game('loot')
	for letter in 'tto' {
		game.guess(letter) or { assert false, 'guessing should not fail' }
	}
	if state := game.guess(`l`) {
		assert state == State.win
	} else {
		assert false, 'guessing `l` should not fail'
	}
	assert game.state == State.win
	assert game.masked_word() == 'loot'
	assert game.remaining == 8
}

fn test_winning_on_the_last_guess_is_still_a_win() {
	mut game := new_game('loot')
	for letter in 'abcdefghito' {
		game.guess(letter) or { assert false, 'guessing should not fail' }
	}
	if state := game.guess(`l`) {
		assert state == State.win
	} else {
		assert false, 'guessing `l` should not fail'
	}
	assert game.state == State.win
	assert game.masked_word() == 'loot'
	assert game.remaining == 0
}

fn test_guessing_after_a_lose_is_error() {
	mut game := new_game('loot')
	for letter in 'abcdefghij' {
		game.guess(letter) or { assert false, 'guessing should not fail' }
	}
	if _ := game.guess(`k`) {
		assert false, 'Guessing after a lose should return an error'
	} else {
		assert err.msg() == 'cannot guess after the game is lost'
	}
}

fn test_guessing_after_a_win_is_error() {
	mut game := new_game('loot')
	for letter in 'tol' {
		game.guess(letter) or { assert false, 'guessing should not fail' }
	}
	if _ := game.guess(`l`) {
		assert false, 'Guessing after a win should return an error'
	} else {
		assert err.msg() == 'cannot guess after the game is won'
	}
}
