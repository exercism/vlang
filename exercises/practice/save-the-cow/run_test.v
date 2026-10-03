module main

fn played(word string, guesses string) Game {
	mut game := new_game(word)
	for letter in guesses.bytes() {
		game.guess(letter) or { panic(err) }
	}
	return game
}

fn guess_failure(mut game Game, letter u8) string {
	mut message := 'guessing did not fail'
	game.guess(letter) or { message = err.msg() }
	return message
}

fn test_initially_9_failures_are_allowed_and_no_letters_are_guessed() {
	game := new_game('loot')
	assert game.state == State.ongoing
	assert game.masked_word() == '____'
	assert game.remaining == 9
}

fn test_after_10_failures_the_game_is_over() {
	game := played('loot', 'abcdefghij')
	assert game.state == State.lose
	assert game.masked_word() == '____'
	assert game.remaining == 0
}

fn test_losing_with_several_correct_guesses() {
	game := played('loot', 'toabcdefghij')
	assert game.state == State.lose
	assert game.masked_word() == '_oot'
	assert game.remaining == 0
}

fn test_feeding_a_correct_letter_removes_underscores() {
	game := played('loot', 't')
	assert game.state == State.ongoing
	assert game.masked_word() == '___t'
	assert game.remaining == 9
}

fn test_feeding_a_correct_letter_twice_counts_as_a_failure() {
	game := played('loot', 'tt')
	assert game.state == State.ongoing
	assert game.masked_word() == '___t'
	assert game.remaining == 8
}

fn test_guessing_a_repeated_letter_reveals_all_instances() {
	game := played('loot', 'tto')
	assert game.state == State.ongoing
	assert game.masked_word() == '_oot'
	assert game.remaining == 8
}

fn test_getting_all_the_letters_right_makes_for_a_win() {
	game := played('loot', 'ttol')
	assert game.state == State.win
	assert game.masked_word() == 'loot'
	assert game.remaining == 8
}

fn test_winning_on_the_last_guess_is_still_a_win() {
	game := played('loot', 'abcdefghitol')
	assert game.state == State.win
	assert game.masked_word() == 'loot'
	assert game.remaining == 0
}

fn test_guessing_after_a_lose_is_error() {
	mut game := new_game('loot')
	for letter in 'abcdefghij' {
		game.guess(letter)!
	}
	failure := guess_failure(mut game, `k`)
	assert failure == 'cannot guess after the game is lost'
}

fn test_guessing_after_a_win_is_error() {
	mut game := new_game('loot')
	for letter in 'tol' {
		game.guess(letter)!
	}
	failure := guess_failure(mut game, `l`)
	assert failure == 'cannot guess after the game is won'
}
