module main

fn test_input_1() {
	assert raindrops(1) == '1'
}

fn test_input_3() {
	assert raindrops(3) == 'Pling'
}

fn test_input_5() {
	assert raindrops(5) == 'Plang'
}

fn test_input_7() {
	assert raindrops(7) == 'Plong'
}

fn test_input_6() {
	assert raindrops(6) == 'Pling'
}

fn test_input_8() {
	assert raindrops(8) == '8'
}

fn test_input_9() {
	assert raindrops(9) == 'Pling'
}

fn test_input_10() {
	assert raindrops(10) == 'Plang'
}

fn test_input_14() {
	assert raindrops(14) == 'Plong'
}

fn test_input_15() {
	assert raindrops(15) == 'PlingPlang'
}

fn test_input_21() {
	assert raindrops(21) == 'PlingPlong'
}

fn test_input_25() {
	assert raindrops(25) == 'Plang'
}

fn test_input_27() {
	assert raindrops(27) == 'Pling'
}

fn test_input_35() {
	assert raindrops(35) == 'PlangPlong'
}

fn test_input_49() {
	assert raindrops(49) == 'Plong'
}

fn test_input_52() {
	assert raindrops(52) == '52'
}

fn test_input_105() {
	assert raindrops(105) == 'PlingPlangPlong'
}

fn test_input_3125() {
	assert raindrops(3125) == 'Plang'
}
