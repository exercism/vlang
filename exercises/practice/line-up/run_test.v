module main

fn test_format_smallest_non_exceptional_ordinal_numeral_4() {
	assert format('Gianna', 4) == 'Gianna, you are the 4th customer we serve today. Thank you!'
}

fn test_format_greatest_single_digit_non_exceptional_ordinal_numeral_9() {
	assert format('Maarten', 9) == 'Maarten, you are the 9th customer we serve today. Thank you!'
}

fn test_format_non_exceptional_ordinal_numeral_5() {
	assert format('Petronila', 5) == 'Petronila, you are the 5th customer we serve today. Thank you!'
}

fn test_format_non_exceptional_ordinal_numeral_6() {
	assert format('Attakullakulla', 6) == 'Attakullakulla, you are the 6th customer we serve today. Thank you!'
}

fn test_format_non_exceptional_ordinal_numeral_7() {
	assert format('Kate', 7) == 'Kate, you are the 7th customer we serve today. Thank you!'
}

fn test_format_non_exceptional_ordinal_numeral_8() {
	assert format('Maximiliano', 8) == 'Maximiliano, you are the 8th customer we serve today. Thank you!'
}

fn test_format_exceptional_ordinal_numeral_1() {
	assert format('Mary', 1) == 'Mary, you are the 1st customer we serve today. Thank you!'
}

fn test_format_exceptional_ordinal_numeral_2() {
	assert format('Haruto', 2) == 'Haruto, you are the 2nd customer we serve today. Thank you!'
}

fn test_format_exceptional_ordinal_numeral_3() {
	assert format('Henriette', 3) == 'Henriette, you are the 3rd customer we serve today. Thank you!'
}

fn test_format_smallest_two_digit_non_exceptional_ordinal_numeral_10() {
	assert format('Alvarez', 10) == 'Alvarez, you are the 10th customer we serve today. Thank you!'
}

fn test_format_non_exceptional_ordinal_numeral_11() {
	assert format('Jacqueline', 11) == 'Jacqueline, you are the 11th customer we serve today. Thank you!'
}

fn test_format_non_exceptional_ordinal_numeral_12() {
	assert format('Juan', 12) == 'Juan, you are the 12th customer we serve today. Thank you!'
}

fn test_format_non_exceptional_ordinal_numeral_13() {
	assert format('Patricia', 13) == 'Patricia, you are the 13th customer we serve today. Thank you!'
}

fn test_format_exceptional_ordinal_numeral_21() {
	assert format('Washi', 21) == 'Washi, you are the 21st customer we serve today. Thank you!'
}

fn test_format_exceptional_ordinal_numeral_62() {
	assert format('Nayra', 62) == 'Nayra, you are the 62nd customer we serve today. Thank you!'
}

fn test_format_exceptional_ordinal_numeral_100() {
	assert format('John', 100) == 'John, you are the 100th customer we serve today. Thank you!'
}

fn test_format_exceptional_ordinal_numeral_101() {
	assert format('Zeinab', 101) == 'Zeinab, you are the 101st customer we serve today. Thank you!'
}

fn test_format_non_exceptional_ordinal_numeral_112() {
	assert format('Knud', 112) == 'Knud, you are the 112th customer we serve today. Thank you!'
}

fn test_format_exceptional_ordinal_numeral_123() {
	assert format('Yma', 123) == 'Yma, you are the 123rd customer we serve today. Thank you!'
}
