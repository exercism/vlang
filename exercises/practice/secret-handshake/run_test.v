module main

fn test_wink_for_1() {
	assert commands(1) == [.wink]
}

fn test_double_blink_for_10() {
	assert commands(2) == [.double_blink]
}

fn test_close_your_eyes_for_100() {
	assert commands(4) == [.close_your_eyes]
}

fn test_jump_for_1000() {
	assert commands(8) == [.jump]
}

fn test_combine_two_actions() {
	assert commands(3) == [.wink, .double_blink]
}

fn test_reverse_two_actions() {
	assert commands(19) == [.double_blink, .wink]
}

fn test_reversing_one_action_gives_the_same_action() {
	assert commands(24) == [.jump]
}

fn test_reversing_no_actions_still_gives_no_actions() {
	assert commands(16) == []
}

fn test_all_possible_actions() {
	assert commands(15) == [.wink, .double_blink, .close_your_eyes, .jump]
}

fn test_reverse_all_possible_actions() {
	assert commands(31) == [.jump, .close_your_eyes, .double_blink, .wink]
}

fn test_do_nothing_for_zero() {
	assert commands(0) == []
}
