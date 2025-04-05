module main

fn test_orange_and_orange_and_black() {
	assert label(['orange', 'orange', 'black']) == '33 ohms'
}

fn test_blue_and_grey_and_brown() {
	assert label(['blue', 'grey', 'brown']) == '680 ohms'
}

fn test_red_and_black_and_red() {
	assert label(['red', 'black', 'red']) == '2 kiloohms'
}

fn test_green_and_brown_and_orange() {
	assert label(['green', 'brown', 'orange']) == '51 kiloohms'
}

fn test_yellow_and_violet_and_yellow() {
	assert label(['yellow', 'violet', 'yellow']) == '470 kiloohms'
}

fn test_blue_and_violet_and_blue() {
	assert label(['blue', 'violet', 'blue']) == '67 megaohms'
}

fn test_minimum_possible_value() {
	assert label(['black', 'black', 'black']) == '0 ohms'
}

fn test_maximum_possible_value() {
	assert label(['white', 'white', 'white']) == '99 gigaohms'
}

fn test_first_two_colors_make_an_invalid_octal_number() {
	assert label(['black', 'grey', 'black']) == '8 ohms'
}

fn test_ignore_extra_colors() {
	assert label(['blue', 'green', 'yellow', 'orange']) == '650 kiloohms'
}

fn test_orange_and_orange_and_red() {
	assert label(['orange', 'orange', 'red']) == '3.3 kiloohms'
}

fn test_orange_and_orange_and_green() {
	assert label(['orange', 'orange', 'green']) == '3.3 megaohms'
}

fn test_white_and_white_and_violet() {
	assert label(['white', 'white', 'violet']) == '990 megaohms'
}

fn test_white_and_white_and_grey() {
	assert label(['white', 'white', 'grey']) == '9.9 gigaohms'
}
