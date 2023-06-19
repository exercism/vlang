module main

fn test_rotate_a_by_0_same_output_as_input() {
	phrase := 'a'
	shift_key := 0
	expect := 'a'
	assert rotate(phrase, shift_key) == expect
}

fn test_rotate_a_by_1() {
	phrase := 'a'
	shift_key := 1
	expect := 'b'
	assert rotate(phrase, shift_key) == expect
}

fn test_rotate_a_by_26_same_output_as_input() {
	phrase := 'a'
	shift_key := 26
	expect := 'a'
	assert rotate(phrase, shift_key) == expect
}

fn test_rotate_m_by_13() {
	phrase := 'm'
	shift_key := 13
	expect := 'z'
	assert rotate(phrase, shift_key) == expect
}

fn test_rotate_n_by_13_with_wrap_around_alphabet() {
	phrase := 'n'
	shift_key := 13
	expect := 'a'
	assert rotate(phrase, shift_key) == expect
}

fn test_rotate_capital_letters() {
	phrase := 'OMG'
	shift_key := 5
	expect := 'TRL'
	assert rotate(phrase, shift_key) == expect
}

fn test_rotate_spaces() {
	phrase := 'O M G'
	shift_key := 5
	expect := 'T R L'
	assert rotate(phrase, shift_key) == expect
}

fn test_rotate_numbers() {
	phrase := 'Testing 1 2 3 testing'
	shift_key := 4
	expect := 'Xiwxmrk 1 2 3 xiwxmrk'
	assert rotate(phrase, shift_key) == expect
}

fn test_rotate_punctuation() {
	phrase := "Let's eat, Grandma!"
	shift_key := 21
	expect := "Gzo'n zvo, Bmviyhv!"
	assert rotate(phrase, shift_key) == expect
}

fn test_rotate_all_letters() {
	phrase := 'The quick brown fox jumps over the lazy dog.'
	shift_key := 13
	expect := 'Gur dhvpx oebja sbk whzcf bire gur ynml qbt.'
	assert rotate(phrase, shift_key) == expect
}
