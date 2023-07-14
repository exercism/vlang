module main

fn test_empty_plaintext_results_in_an_empty_ciphertext() {
	phrase := ''
	expect := ''
	assert ciphertext(phrase) == expect
}

fn test_normalization_results_in_empty_plaintext() {
	phrase := '... --- ...'
	expect := ''
	assert ciphertext(phrase) == expect
}

fn test_lowercase() {
	phrase := 'A'
	expect := 'a'
	assert ciphertext(phrase) == expect
}

fn test_remove_spaces() {
	phrase := '  b '
	expect := 'b'
	assert ciphertext(phrase) == expect
}

fn test_remove_punctuation() {
	phrase := '@1,%!'
	expect := '1'
	assert ciphertext(phrase) == expect
}

fn test_9_character_plaintext_results_in_3_chunks_of_3_characters() {
	phrase := 'This is fun!'
	expect := 'tsf hiu isn'
	assert ciphertext(phrase) == expect
}

fn test_8_character_plaintext_results_in_3_chunks_the_last_one_with_a_trailing_space() {
	phrase := 'Chill out.'
	expect := 'clu hlt io '
	assert ciphertext(phrase) == expect
}

fn test_54_character_plaintext_results_in_7_chunks_the_last_two_with_trailing_spaces() {
	phrase := 'If man was meant to stay on the ground, god would have given us roots.'
	expect := 'imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau '
	assert ciphertext(phrase) == expect
}
