module main

fn test_brown_and_black() {
	assert value(['brown', 'black']) == 10
}

fn test_blue_and_grey() {
	assert value(['blue', 'grey']) == 68
}

fn test_yellow_and_violet() {
	assert value(['yellow', 'violet']) == 47
}

fn test_white_and_red() {
	assert value(['white', 'red']) == 92
}

fn test_orange_and_orange() {
	assert value(['orange', 'orange']) == 33
}

fn test_ignore_additional_colors() {
	assert value(['green', 'brown', 'orange']) == 51
}

fn test_black_and_brown_one_digit() {
	assert value(['black', 'brown']) == 1
}
