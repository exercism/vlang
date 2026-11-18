module main

fn test_orange_orange_black_and_red() {
	assert label(['orange', 'orange', 'black', 'red']) == '33 ohms ±2%'
}

fn test_blue_gray_brown_and_violet() {
	assert label(['blue', 'grey', 'brown', 'violet']) == '680 ohms ±0.1%'
}

fn test_red_black_red_and_green() {
	assert label(['red', 'black', 'red', 'green']) == '2 kiloohms ±0.5%'
}

fn test_green_brownm_orange_and_grey() {
	assert label(['green', 'brown', 'orange', 'grey']) == '51 kiloohms ±0.05%'
}

fn test_only_one_band() {
	assert label(['black']) == '0 ohms'
}

fn test_orange_orange_yellow_black_and_brown() {
	assert label(['orange', 'orange', 'yellow', 'black', 'brown']) == '334 ohms ±1%'
}

fn test_red_green_yellow_yellow_and_brown() {
	assert label(['red', 'green', 'yellow', 'yellow', 'brown']) == '2.54 megaohms ±1%'
}

fn test_blue_gray_white_brown_and_brown() {
	assert label(['blue', 'grey', 'white', 'brown', 'brown']) == '6.89 kiloohms ±1%'
}

fn test_violet_orange_red_and_gray() {
	assert label(['violet', 'orange', 'red', 'grey']) == '7.3 kiloohms ±0.05%'
}

fn test_brown_red_orange_green_and_blue() {
	assert label(['brown', 'red', 'orange', 'green', 'blue']) == '12.3 megaohms ±0.25%'
}

fn test_brown_black_brown_yellow_and_violet() {
	assert label(['brown', 'black', 'brown', 'yellow', 'violet']) == '1.01 megaohms ±0.1%'
}

fn test_brown_black_red_and_red() {
	assert label(['brown', 'black', 'red', 'red']) == '1 kiloohms ±2%'
}

fn test_orange_orange_red_and_gold() {
	assert label(['orange', 'orange', 'red', 'gold']) == '3.3 kiloohms ±5%'
}

fn test_orange_orange_green_and_silver() {
	assert label(['orange', 'orange', 'green', 'silver']) == '3.3 megaohms ±10%'
}

fn test_white_white_violet_and_green() {
	assert label(['white', 'white', 'violet', 'green']) == '990 megaohms ±0.5%'
}

fn test_white_white_grey_and_blue() {
	assert label(['white', 'white', 'grey', 'blue']) == '9.9 gigaohms ±0.25%'
}
