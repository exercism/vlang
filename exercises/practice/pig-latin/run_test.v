module main

fn test_ay_is_added_to_words_that_start_with_vowels__word_beginning_with_a() {
	assert translate('apple') == 'appleay'
}

fn test_ay_is_added_to_words_that_start_with_vowels__word_beginning_with_e() {
	assert translate('ear') == 'earay'
}

fn test_ay_is_added_to_words_that_start_with_vowels__word_beginning_with_i() {
	assert translate('igloo') == 'iglooay'
}

fn test_ay_is_added_to_words_that_start_with_vowels__word_beginning_with_o() {
	assert translate('object') == 'objectay'
}

fn test_ay_is_added_to_words_that_start_with_vowels__word_beginning_with_u() {
	assert translate('under') == 'underay'
}

fn test_ay_is_added_to_words_that_start_with_vowels__word_beginning_with_a_vowel_and_followed_by_a_qu() {
	assert translate('equal') == 'equalay'
}

fn test_first_letter_and_ay_are_moved_to_the_end_of_words_that_start_with_consonants__word_beginning_with_p() {
	assert translate('pig') == 'igpay'
}

fn test_first_letter_and_ay_are_moved_to_the_end_of_words_that_start_with_consonants__word_beginning_with_k() {
	assert translate('koala') == 'oalakay'
}

fn test_first_letter_and_ay_are_moved_to_the_end_of_words_that_start_with_consonants__word_beginning_with_x() {
	assert translate('xenon') == 'enonxay'
}

fn test_first_letter_and_ay_are_moved_to_the_end_of_words_that_start_with_consonants__word_beginning_with_q_without_a_following_u() {
	assert translate('qat') == 'atqay'
}

fn test_some_letter_clusters_are_treated_like_a_single_consonant__word_beginning_with_ch() {
	assert translate('chair') == 'airchay'
}

fn test_some_letter_clusters_are_treated_like_a_single_consonant__word_beginning_with_qu() {
	assert translate('queen') == 'eenquay'
}

fn test_some_letter_clusters_are_treated_like_a_single_consonant__word_beginning_with_qu_and_a_preceding_consonant() {
	assert translate('square') == 'aresquay'
}

fn test_some_letter_clusters_are_treated_like_a_single_consonant__word_beginning_with_th() {
	assert translate('therapy') == 'erapythay'
}

fn test_some_letter_clusters_are_treated_like_a_single_consonant__word_beginning_with_thr() {
	assert translate('thrush') == 'ushthray'
}

fn test_some_letter_clusters_are_treated_like_a_single_consonant__word_beginning_with_sch() {
	assert translate('school') == 'oolschay'
}

fn test_some_letter_clusters_are_treated_like_a_single_vowel__word_beginning_with_yt() {
	assert translate('yttria') == 'yttriaay'
}

fn test_some_letter_clusters_are_treated_like_a_single_vowel__word_beginning_with_xr() {
	assert translate('xray') == 'xrayay'
}

fn test_position_of_y_in_a_word_determines_if_it_is_a_consonant_or_a_vowel__y_is_treated_like_a_consonant_at_the_beginning_of_a_word() {
	assert translate('yellow') == 'ellowyay'
}

fn test_position_of_y_in_a_word_determines_if_it_is_a_consonant_or_a_vowel__y_is_treated_like_a_vowel_at_the_end_of_a_consonant_cluster() {
	assert translate('rhythm') == 'ythmrhay'
}

fn test_position_of_y_in_a_word_determines_if_it_is_a_consonant_or_a_vowel__y_as_second_letter_in_two_letter_word() {
	assert translate('my') == 'ymay'
}

fn test_phrases_are_translated__a_whole_phrase() {
	assert translate('quick fast run') == 'ickquay astfay unray'
}
