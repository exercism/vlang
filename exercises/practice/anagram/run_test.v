module main

fn test_no_matches() {
	candidates := ['hello', 'world', 'zombies', 'pants']
	expected := []string{}
	assert find_anagrams('diaper', candidates) == expected
}

fn test_detects_two_anagrams() {
	candidates := ['lemons', 'cherry', 'melons']
	expected := ['lemons', 'melons']
	assert find_anagrams('solemn', candidates) == expected
}

fn test_does_not_detect_anagram_subsets() {
	candidates := ['dog', 'goody']
	expected := []string{}
	assert find_anagrams('good', candidates) == expected
}

fn test_detects_anagram() {
	candidates := ['enlists', 'google', 'inlets', 'banana']
	expected := ['inlets']
	assert find_anagrams('listen', candidates) == expected
}

fn test_detects_three_anagrams() {
	candidates := ['gallery', 'ballerina', 'regally', 'clergy', 'largely', 'leading']
	expected := ['gallery', 'regally', 'largely']
	assert find_anagrams('allergy', candidates) == expected
}

fn test_detects_multiple_anagrams_with_different_case() {
	candidates := ['Eons', 'ONES']
	expected := ['Eons', 'ONES']
	assert find_anagrams('nose', candidates) == expected
}

fn test_does_not_detect_non_anagrams_with_identical_checksum() {
	candidates := ['last']
	expected := []string{}
	assert find_anagrams('mass', candidates) == expected
}

fn test_detects_anagrams_case_insensitively() {
	candidates := ['cashregister', 'Carthorse', 'radishes']
	expected := ['Carthorse']
	assert find_anagrams('Orchestra', candidates) == expected
}

fn test_detects_anagrams_using_case_insensitive_subject() {
	candidates := ['cashregister', 'carthorse', 'radishes']
	expected := ['carthorse']
	assert find_anagrams('Orchestra', candidates) == expected
}

fn test_detects_anagrams_using_case_insensitive_possible_matches() {
	candidates := ['cashregister', 'Carthorse', 'radishes']
	expected := ['Carthorse']
	assert find_anagrams('orchestra', candidates) == expected
}

fn test_does_not_detect_an_anagram_if_the_original_word_is_repeated() {
	candidates := ['goGoGO']
	expected := []string{}
	assert find_anagrams('go', candidates) == expected
}

fn test_anagrams_must_use_all_letters_exactly_once() {
	candidates := ['patter']
	expected := []string{}
	assert find_anagrams('tapper', candidates) == expected
}

fn test_words_are_not_anagrams_of_themselves() {
	candidates := ['BANANA']
	expected := []string{}
	assert find_anagrams('BANANA', candidates) == expected
}

fn test_words_are_not_anagrams_of_themselves_even_if_letter_case_is_partially_different() {
	candidates := ['Banana']
	expected := []string{}
	assert find_anagrams('BANANA', candidates) == expected
}

fn test_words_are_not_anagrams_of_themselves_even_if_letter_case_is_completely_different() {
	candidates := ['banana']
	expected := []string{}
	assert find_anagrams('BANANA', candidates) == expected
}

fn test_words_other_than_themselves_can_be_anagrams() {
	candidates := ['LISTEN', 'Silent']
	expected := ['Silent']
	assert find_anagrams('LISTEN', candidates) == expected
}

fn test_different_characters_may_have_the_same_bytes() {
	candidates := ['€a']
	expected := []string{}
	assert find_anagrams('a⬂', candidates) == expected
}
