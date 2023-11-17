module main

fn test_empty_string() {
	assert !is_pangram('')
}

fn test_perfect_lower_case() {
	assert is_pangram('abcdefghijklmnopqrstuvwxyz')
}

fn test_perfect_only_case() {
	assert is_pangram('the quick brown fox jumps over the lazy dog')
}

fn test_missing_letter_x() {
	assert !is_pangram('a quick movement of the enemy will jeopardize five gunboats')
}

fn test_missing_letter_h() {
	assert !is_pangram('five boxing wizards jump quickly at it')
}

fn test_with_underscores() {
	assert is_pangram('the_quick_brown_fox_jumps_over_the_lazy_dog')
}

fn test_with_numbers() {
	assert is_pangram('the 1 quick brown fox jumps over the 2 lazy dogs')
}

fn test_letters_replaced_by_numbers() {
	assert !is_pangram('7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog')
}

fn test_mixed_case_and_punctuation() {
	assert is_pangram('"Five quacking Zephyrs jolt my wax bed."')
}

fn test_case_insensitive() {
	assert !is_pangram('the quick brown fox jumps over with lazy FX')
}

fn test_a_m_lower_and_upper() {
	assert !is_pangram('abcdefghijklm ABCDEFGHIJKLM')
}
