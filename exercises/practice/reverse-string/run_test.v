module main

fn test_empty() {
	assert reverse_string("") == ""
}

fn test_word() {
	assert reverse_string("robot") == "tobor"
}

fn test_capitalized_word() {
	assert reverse_string("Ramen") == "nemaR"
}

fn test_sentence_with_punctuation() {
	assert reverse_string("I'm hungry!") == "!yrgnuh m'I"
}

fn test_palindrome() {
	assert reverse_string("racecar") == "racecar"
}

fn test_even_length_word() {
	assert reverse_string("drawer") == "reward"
}