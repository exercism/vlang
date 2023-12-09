module main

fn test_should_be_able_to_score_a_game_with_all_zeros() {
	mut game := Game.new()
	rolls := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	for pins in rolls {
		game.roll(pins)!
	}
	assert game.score()! == 0
}

fn test_should_be_able_to_score_a_game_with_no_strikes_or_spares() {
	mut game := Game.new()
	rolls := [3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6]
	for pins in rolls {
		game.roll(pins)!
	}
	assert game.score()! == 90
}

fn test_a_spare_followed_by_zeros_is_worth_ten_points() {
	mut game := Game.new()
	rolls := [6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	for pins in rolls {
		game.roll(pins)!
	}
	assert game.score()! == 10
}

fn test_points_scored_in_the_roll_after_a_spare_are_counted_twice() {
	mut game := Game.new()
	rolls := [6, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	for pins in rolls {
		game.roll(pins)!
	}
	assert game.score()! == 16
}

fn test_consecutive_spares_each_get_a_one_roll_bonus() {
	mut game := Game.new()
	rolls := [5, 5, 3, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	for pins in rolls {
		game.roll(pins)!
	}
	assert game.score()! == 31
}

fn test_a_spare_in_the_last_frame_gets_a_one_roll_bonus_that_is_counted_once() {
	mut game := Game.new()
	rolls := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 7]
	for pins in rolls {
		game.roll(pins)!
	}
	assert game.score()! == 17
}

fn test_a_strike_earns_ten_points_in_a_frame_with_a_single_roll() {
	mut game := Game.new()
	rolls := [10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	for pins in rolls {
		game.roll(pins)!
	}
	assert game.score()! == 10
}

fn test_points_scored_in_the_two_rolls_after_a_strike_are_counted_twice_as_a_bonus() {
	mut game := Game.new()
	rolls := [10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	for pins in rolls {
		game.roll(pins)!
	}
	assert game.score()! == 26
}

fn test_consecutive_strikes_each_get_the_two_roll_bonus() {
	mut game := Game.new()
	rolls := [10, 10, 10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	for pins in rolls {
		game.roll(pins)!
	}
	assert game.score()! == 81
}

fn test_a_strike_in_the_last_frame_gets_a_two_roll_bonus_that_is_counted_once() {
	mut game := Game.new()
	rolls := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 1]
	for pins in rolls {
		game.roll(pins)!
	}
	assert game.score()! == 18
}

fn test_rolling_a_spare_with_the_two_roll_bonus_does_not_get_a_bonus_roll() {
	mut game := Game.new()
	rolls := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 3]
	for pins in rolls {
		game.roll(pins)!
	}
	assert game.score()! == 20
}

fn test_strikes_with_the_two_roll_bonus_do_not_get_bonus_rolls() {
	mut game := Game.new()
	rolls := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10]
	for pins in rolls {
		game.roll(pins)!
	}
	assert game.score()! == 30
}

fn test_last_two_strikes_followed_by_only_last_bonus_with_non_strike_points() {
	mut game := Game.new()
	rolls := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 1]
	for pins in rolls {
		game.roll(pins)!
	}
	assert game.score()! == 31
}

fn test_a_strike_with_the_one_roll_bonus_after_a_spare_in_the_last_frame_does_not_get_a_bonus() {
	mut game := Game.new()
	rolls := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 10]
	for pins in rolls {
		game.roll(pins)!
	}
	assert game.score()! == 20
}

fn test_all_strikes_is_a_perfect_game() {
	mut game := Game.new()
	rolls := [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
	for pins in rolls {
		game.roll(pins)!
	}
	assert game.score()! == 300
}

fn test_rolls_cannot_score_negative_points() {
	mut game := Game.new()
	rolls := []int{}
	for pins in rolls {
		game.roll(pins)!
	}
	game.roll(-1) or {
		assert err.msg() == 'Negative roll is invalid'
		return
	}
	assert false, 'rolls cannot score negative points'
}

fn test_a_roll_cannot_score_more_than_10_points() {
	mut game := Game.new()
	rolls := []int{}
	for pins in rolls {
		game.roll(pins)!
	}
	game.roll(11) or {
		assert err.msg() == 'Pin count exceeds pins on the lane'
		return
	}
	assert false, 'a roll cannot score more than 10 points'
}

fn test_two_rolls_in_a_frame_cannot_score_more_than_10_points() {
	mut game := Game.new()
	rolls := [5]
	for pins in rolls {
		game.roll(pins)!
	}
	game.roll(6) or {
		assert err.msg() == 'Pin count exceeds pins on the lane'
		return
	}
	assert false, 'two rolls in a frame cannot score more than 10 points'
}

fn test_bonus_roll_after_a_strike_in_the_last_frame_cannot_score_more_than_10_points() {
	mut game := Game.new()
	rolls := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10]
	for pins in rolls {
		game.roll(pins)!
	}
	game.roll(11) or {
		assert err.msg() == 'Pin count exceeds pins on the lane'
		return
	}
	assert false, 'bonus roll after a strike in the last frame cannot score more than 10 points'
}

fn test_two_bonus_rolls_after_a_strike_in_the_last_frame_cannot_score_more_than_10_points() {
	mut game := Game.new()
	rolls := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 5]
	for pins in rolls {
		game.roll(pins)!
	}
	game.roll(6) or {
		assert err.msg() == 'Pin count exceeds pins on the lane'
		return
	}
	assert false, 'two bonus rolls after a strike in the last frame cannot score more than 10 points'
}

fn test_two_bonus_rolls_after_a_strike_in_the_last_frame_can_score_more_than_10_points_if_one_is_a_strike() {
	mut game := Game.new()
	rolls := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 6]
	for pins in rolls {
		game.roll(pins)!
	}
	assert game.score()! == 26
}

fn test_the_second_bonus_rolls_after_a_strike_in_the_last_frame_cannot_be_a_strike_if_the_first_one_is_not_a_strike() {
	mut game := Game.new()
	rolls := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 6]
	for pins in rolls {
		game.roll(pins)!
	}
	game.roll(10) or {
		assert err.msg() == 'Pin count exceeds pins on the lane'
		return
	}
	assert false, 'the second bonus rolls after a strike in the last frame cannot be a strike if the first one not a strike'
}

fn test_second_bonus_roll_after_a_strike_in_the_last_frame_cannot_score_more_than_10_points() {
	mut game := Game.new()
	rolls := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10]
	for pins in rolls {
		game.roll(pins)!
	}
	game.roll(11) or {
		assert err.msg() == 'Pin count exceeds pins on the lane'
		return
	}
	assert false, 'second bonus roll after a strike in the last frame cannot score more than 10 points'
}

fn test_an_unstarted_game_cannot_be_scored() {
	mut game := Game.new()
	rolls := []int{}
	for pins in rolls {
		game.roll(pins)!
	}
	if res := game.score() {
		assert false, 'an unstarted game cannot be scored should return an error'
	} else {
		assert err.msg() == 'Score cannot be taken until the end of the game'
	}
}

fn test_an_incomplete_game_cannot_be_scored() {
	mut game := Game.new()
	rolls := [0, 0]
	for pins in rolls {
		game.roll(pins)!
	}
	if res := game.score() {
		assert false, 'an incomplete game cannot be scored should return an error'
	} else {
		assert err.msg() == 'Score cannot be taken until the end of the game'
	}
}

fn test_cannot_roll_if_game_already_has_ten_frames() {
	mut game := Game.new()
	rolls := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	for pins in rolls {
		game.roll(pins)!
	}
	game.roll(0) or {
		assert err.msg() == 'Cannot roll after game is over'
		return
	}
	assert false, 'cannot roll if game already has ten frames'
}

fn test_bonus_rolls_for_a_strike_in_the_last_frame_must_be_rolled_before_score_can_be_calculated() {
	mut game := Game.new()
	rolls := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10]
	for pins in rolls {
		game.roll(pins)!
	}
	if res := game.score() {
		assert false, 'bonus rolls for a strike in the last frame must be rolled before score can be calculated should return an error'
	} else {
		assert err.msg() == 'Score cannot be taken until the end of the game'
	}
}

fn test_both_bonus_rolls_for_a_strike_in_the_last_frame_must_be_rolled_before_score_can_be_calculated() {
	mut game := Game.new()
	rolls := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10]
	for pins in rolls {
		game.roll(pins)!
	}
	if res := game.score() {
		assert false, 'both bonus rolls for a strike in the last frame must be rolled before score can be calculated should return an error'
	} else {
		assert err.msg() == 'Score cannot be taken until the end of the game'
	}
}

fn test_bonus_roll_for_a_spare_in_the_last_frame_must_be_rolled_before_score_can_be_calculated() {
	mut game := Game.new()
	rolls := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3]
	for pins in rolls {
		game.roll(pins)!
	}
	if res := game.score() {
		assert false, 'bonus roll for a spare in the last frame must be rolled before score can be calculated should return an error'
	} else {
		assert err.msg() == 'Score cannot be taken until the end of the game'
	}
}

fn test_cannot_roll_after_bonus_roll_for_spare() {
	mut game := Game.new()
	rolls := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 2]
	for pins in rolls {
		game.roll(pins)!
	}
	game.roll(2) or {
		assert err.msg() == 'Cannot roll after game is over'
		return
	}
	assert false, 'cannot roll after bonus roll for spare'
}

fn test_cannot_roll_after_bonus_rolls_for_strike() {
	mut game := Game.new()
	rolls := [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 3, 2]
	for pins in rolls {
		game.roll(pins)!
	}
	game.roll(2) or {
		assert err.msg() == 'Cannot roll after game is over'
		return
	}
	assert false, 'cannot roll after bonus rolls for strike'
}
