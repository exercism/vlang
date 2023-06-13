module main

fn test_finds_the_largest_product_if_span_equals_length() {
	assert largest_product('29', 2)! == 18
}

fn test_can_find_the_largest_product_of_2_with_numbers_in_order() {
	assert largest_product('0123456789', 2)! == 72
}

fn test_can_find_the_largest_product_of_2() {
	assert largest_product('576802143', 2)! == 48
}

fn test_can_find_the_largest_product_of_3_with_numbers_in_order() {
	assert largest_product('0123456789', 3)! == 504
}

fn test_can_find_the_largest_product_of_3() {
	assert largest_product('1027839564', 3)! == 270
}

fn test_can_find_the_largest_product_of_5_with_numbers_in_order() {
	assert largest_product('0123456789', 5)! == 15120
}

fn test_can_get_the_largest_product_of_a_big_number() {
	assert largest_product('73167176531330624919225119674426574742355349194934', 6)! == 23520
}

fn test_reports_zero_if_the_only_digits_are_zero() {
	assert largest_product('0000', 2)! == 0
}

fn test_reports_zero_if_all_spans_include_zero() {
	assert largest_product('99099', 3)! == 0
}

fn test_rejects_span_longer_than_string_length() {
	if res := largest_product('123', 4) {
		assert false, 'should reject span longer than string length'
	} else {
		assert err.msg() == 'span must be smaller than string length'
	}
}

fn test_reports_1_for_empty_string_and_empty_product() {
	assert largest_product('', 0)! == 1
}

fn test_reports_1_for_nonempty_string_and_empty_product() {
	assert largest_product('123', 0)! == 1
}

fn test_rejects_empty_string_and_nonzero_span() {
	if res := largest_product('', 1) {
		assert false, 'should reject empty string and nonzero span'
	} else {
		assert err.msg() == 'span must be smaller than string length'
	}
}

fn test_rejects_invalid_character_in_digits() {
	if res := largest_product('1234a5', 2) {
		assert false, 'should reject invalid character in digits'
	} else {
		assert err.msg() == 'digits input must only contain digits'
	}
}

fn test_rejects_negative_span() {
	if res := largest_product('12345', -1) {
		assert false, 'should reject negative span'
	} else {
		assert err.msg() == 'span must not be negative'
	}
}
