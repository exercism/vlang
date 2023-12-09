module main

fn test_cleans_the_number() {
	phrase := '(223) 456-7890'
	assert clean(phrase)! == '2234567890'
}

fn test_cleans_numbers_with_dots() {
	phrase := '223.456.7890'
	assert clean(phrase)! == '2234567890'
}

fn test_cleans_numbers_with_multiple_spaces() {
	phrase := '223 456   7890   '
	assert clean(phrase)! == '2234567890'
}

fn test_invalid_when_9_digits() {
	phrase := '123456789'
	if res := clean(phrase) {
		assert false, 'invalid when 9 digits should return an error'
	} else {
		assert err.msg() == 'must not be fewer than 10 digits'
	}
}

fn test_invalid_when_11_digits_does_not_start_with_a_1() {
	phrase := '22234567890'
	if res := clean(phrase) {
		assert false, 'invalid when 11 digits does not start with a 1 should return an error'
	} else {
		assert err.msg() == '11 digits must start with 1'
	}
}

fn test_valid_when_11_digits_and_starting_with_1() {
	phrase := '12234567890'
	assert clean(phrase)! == '2234567890'
}

fn test_valid_when_11_digits_and_starting_with_1_even_with_punctuation() {
	phrase := '+1 (223) 456-7890'
	assert clean(phrase)! == '2234567890'
}

fn test_invalid_when_more_than_11_digits() {
	phrase := '321234567890'
	if res := clean(phrase) {
		assert false, 'invalid when more than 11 digits should return an error'
	} else {
		assert err.msg() == 'must not be greater than 11 digits'
	}
}

fn test_invalid_with_letters() {
	phrase := '523-abc-7890'
	if res := clean(phrase) {
		assert false, 'invalid with letters should return an error'
	} else {
		assert err.msg() == 'letters not permitted'
	}
}

fn test_invalid_with_punctuations() {
	phrase := '523-@:!-7890'
	if res := clean(phrase) {
		assert false, 'invalid with punctuations should return an error'
	} else {
		assert err.msg() == 'punctuations not permitted'
	}
}

fn test_invalid_if_area_code_starts_with_0() {
	phrase := '(023) 456-7890'
	if res := clean(phrase) {
		assert false, 'invalid if area code starts with 0 should return an error'
	} else {
		assert err.msg() == 'area code cannot start with zero'
	}
}

fn test_invalid_if_area_code_starts_with_1() {
	phrase := '(123) 456-7890'
	if res := clean(phrase) {
		assert false, 'invalid if area code starts with 1 should return an error'
	} else {
		assert err.msg() == 'area code cannot start with one'
	}
}

fn test_invalid_if_exchange_code_starts_with_0() {
	phrase := '(223) 056-7890'
	if res := clean(phrase) {
		assert false, 'invalid if exchange code starts with 0 should return an error'
	} else {
		assert err.msg() == 'exchange code cannot start with zero'
	}
}

fn test_invalid_if_exchange_code_starts_with_1() {
	phrase := '(223) 156-7890'
	if res := clean(phrase) {
		assert false, 'invalid if exchange code starts with 1 should return an error'
	} else {
		assert err.msg() == 'exchange code cannot start with one'
	}
}

fn test_invalid_if_area_code_starts_with_0_on_valid_11_digit_number() {
	phrase := '1 (023) 456-7890'
	if res := clean(phrase) {
		assert false, 'invalid if area code starts with 0 on valid 11-digit number should return an error'
	} else {
		assert err.msg() == 'area code cannot start with zero'
	}
}

fn test_invalid_if_area_code_starts_with_1_on_valid_11_digit_number() {
	phrase := '1 (123) 456-7890'
	if res := clean(phrase) {
		assert false, 'invalid if area code starts with 1 on valid 11-digit number should return an error'
	} else {
		assert err.msg() == 'area code cannot start with one'
	}
}

fn test_invalid_if_exchange_code_starts_with_0_on_valid_11_digit_number() {
	phrase := '1 (223) 056-7890'
	if res := clean(phrase) {
		assert false, 'invalid if exchange code starts with 0 on valid 11-digit number should return an error'
	} else {
		assert err.msg() == 'exchange code cannot start with zero'
	}
}

fn test_invalid_if_exchange_code_starts_with_1_on_valid_11_digit_number() {
	phrase := '1 (223) 156-7890'
	if res := clean(phrase) {
		assert false, 'invalid if exchange code starts with 1 on valid 11-digit number should return an error'
	} else {
		assert err.msg() == 'exchange code cannot start with one'
	}
}
