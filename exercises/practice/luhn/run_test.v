module main

fn test_single_digit_strings_can_not_be_valid() {
	assert !valid('1')
}

fn test_a_single_zero_is_invalid() {
	assert !valid('0')
}

fn test_a_simple_valid_sin_that_remains_valid_if_reversed() {
	assert valid('059')
}

fn test_a_simple_valid_sin_that_becomes_invalid_if_reversed() {
	assert valid('59')
}

fn test_a_valid_canadian_sin() {
	assert valid('055 444 285')
}

fn test_invalid_canadian_sin() {
	assert !valid('055 444 286')
}

fn test_invalid_credit_card() {
	assert !valid('8273 1232 7352 0569')
}

fn test_invalid_long_number_with_an_even_remainder() {
	assert !valid('1 2345 6789 1234 5678 9012')
}

fn test_invalid_long_number_with_a_remainder_divisible_by_5() {
	assert !valid('1 2345 6789 1234 5678 9013')
}

fn test_valid_number_with_an_even_number_of_digits() {
	assert valid('095 245 88')
}

fn test_valid_number_with_an_odd_number_of_spaces() {
	assert valid('234 567 891 234')
}

fn test_valid_strings_with_a_non_digit_added_at_the_end_become_invalid() {
	assert !valid('059a')
}

fn test_valid_strings_with_punctuation_included_become_invalid() {
	assert !valid('055-444-285')
}

fn test_valid_strings_with_symbols_included_become_invalid() {
	assert !valid('055# 444$ 285')
}

fn test_single_zero_with_space_is_invalid() {
	assert !valid(' 0')
}

fn test_more_than_a_single_zero_is_valid() {
	assert valid('0000 0')
}

fn test_input_digit_9_is_correctly_converted_to_output_digit_9() {
	assert valid('091')
}

fn test_very_long_input_is_valid() {
	assert valid('9999999999 9999999999 9999999999 9999999999')
}

fn test_valid_luhn_with_an_odd_number_of_digits_and_non_zero_first_digit() {
	assert valid('109')
}

fn test_using_ascii_value_for_non_doubled_non_digit_isnt_allowed() {
	assert !valid('055b 444 285')
}

fn test_using_ascii_value_for_doubled_non_digit_isnt_allowed() {
	assert !valid(':9')
}

fn test_non_numeric_non_space_char_in_the_middle_with_a_sum_thats_divisible_by_10_isnt_allowed() {
	assert !valid('59%59')
}
