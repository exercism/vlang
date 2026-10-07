module main

fn test_an_empty_string() {
	assert reverse_string('') == ''
}

fn test_a_word() {
	assert reverse_string('robot') == 'tobor'
}

fn test_a_capitalized_word() {
	assert reverse_string('Ramen') == 'nemaR'
}

fn test_a_sentence_with_punctuation() {
	assert reverse_string("I'm hungry!") == "!yrgnuh m'I"
}

fn test_a_palindrome() {
	assert reverse_string('racecar') == 'racecar'
}

fn test_an_even_sized_word() {
	assert reverse_string('drawer') == 'reward'
}
