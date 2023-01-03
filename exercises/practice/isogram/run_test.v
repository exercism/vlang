module main

fn test_empty_string() {
	assert is_isogram('')
}

fn test_isogram() {
	assert is_isogram('isogram')
}

fn test_eleven() {
	assert !is_isogram('eleven')
}

fn test_duplicate_z() {
	assert !is_isogram('zzyzx')
}

fn test_longest_english_isogram() {
	assert is_isogram('subdermatoglyphic')
}

fn test_duplicate_mixed_case() {
	assert !is_isogram('Alphabet')
}

fn test_duplicate_mixed_case_2() {
	assert !is_isogram('alphAbet')
}

fn test_with_hyphen() {
	assert is_isogram('thumbscrew-japingly')
}

fn test_with_hyphen_double_p() {
	assert !is_isogram('thumbscrew-jappingly')
}

fn test_with_double_hyphen() {
	assert is_isogram('six-year-old')
}

fn test_with_name() {
	assert is_isogram('Emily Jung Schwartzkopf')
}

fn test_duplicate_in_middle() {
	assert !is_isogram('accentor')
}

fn test_first_and_last_same() {
	assert !is_isogram('angola')
}

fn test_with_duplicated_char_and_hypens() {
	assert !is_isogram('up-to-date')
}
