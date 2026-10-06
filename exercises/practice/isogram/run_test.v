module main

fn test_empty_string() {
	assert is_isogram('')
}

fn test_isogram_with_only_lower_case_characters() {
	assert is_isogram('isogram')
}

fn test_word_with_one_duplicated_character() {
	assert !is_isogram('eleven')
}

fn test_word_with_one_duplicated_character_from_the_end_of_the_alphabet() {
	assert !is_isogram('zzyzx')
}

fn test_longest_reported_english_isogram() {
	assert is_isogram('subdermatoglyphic')
}

fn test_word_with_duplicated_character_in_mixed_case() {
	assert !is_isogram('Alphabet')
}

fn test_word_with_duplicated_character_in_mixed_case_lowercase_first() {
	assert !is_isogram('alphAbet')
}

fn test_hypothetical_isogrammic_word_with_hyphen() {
	assert is_isogram('thumbscrew-japingly')
}

fn test_hypothetical_word_with_duplicated_character_following_hyphen() {
	assert !is_isogram('thumbscrew-jappingly')
}

fn test_isogram_with_duplicated_hyphen() {
	assert is_isogram('six-year-old')
}

fn test_made_up_name_that_is_an_isogram() {
	assert is_isogram('Emily Jung Schwartzkopf')
}

fn test_duplicated_character_in_the_middle() {
	assert !is_isogram('accentor')
}

fn test_same_first_and_last_characters() {
	assert !is_isogram('angola')
}

fn test_word_with_duplicated_character_and_with_two_hyphens() {
	assert !is_isogram('up-to-date')
}
