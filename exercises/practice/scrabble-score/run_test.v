module main

fn test_lowercase_letter() {
	assert score('a') == 1
}

fn test_uppercase_letter() {
	assert score('A') == 1
}

fn test_valuable_letter() {
	assert score('f') == 4
}

fn test_short_word() {
	assert score('at') == 2
}

fn test_short_valuable_word() {
	assert score('zoo') == 12
}

fn test_medium_word() {
	assert score('street') == 6
}

fn test_medium_valuable_word() {
	assert score('quirky') == 22
}

fn test_long_mixed_case_word() {
	assert score('OxyphenButazone') == 41
}

fn test_english_like_word() {
	assert score('pinata') == 8
}

fn test_empty_input() {
	assert score('') == 0
}

fn test_entire_alphabet() {
	assert score('abcdefghijklmnopqrstuvwxyz') == 87
}
