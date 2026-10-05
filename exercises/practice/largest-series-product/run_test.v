module main

fn test_finds_the_largest_product_if_span_equals_length() {
	if res := largest_product('29', 2) {
		assert res == 18
	} else {
		assert false, "largest_product('29', 2) should not return an error"
	}
}

fn test_can_find_the_largest_product_of_2_with_numbers_in_order() {
	if res := largest_product('0123456789', 2) {
		assert res == 72
	} else {
		assert false, "largest_product('0123456789', 2) should not return an error"
	}
}

fn test_can_find_the_largest_product_of_2() {
	if res := largest_product('576802143', 2) {
		assert res == 48
	} else {
		assert false, "largest_product('576802143', 2) should not return an error"
	}
}

fn test_can_find_the_largest_product_of_3_with_numbers_in_order() {
	if res := largest_product('0123456789', 3) {
		assert res == 504
	} else {
		assert false, "largest_product('0123456789', 3) should not return an error"
	}
}

fn test_can_find_the_largest_product_of_3() {
	if res := largest_product('1027839564', 3) {
		assert res == 270
	} else {
		assert false, "largest_product('1027839564', 3) should not return an error"
	}
}

fn test_can_find_the_largest_product_of_5_with_numbers_in_order() {
	if res := largest_product('0123456789', 5) {
		assert res == 15120
	} else {
		assert false, "largest_product('0123456789', 5) should not return an error"
	}
}

fn test_can_get_the_largest_product_of_a_big_number() {
	if res := largest_product('73167176531330624919225119674426574742355349194934', 6) {
		assert res == 23520
	} else {
		assert false, "largest_product('73167176531330624919225119674426574742355349194934', 6) should not return an error"
	}
}

fn test_reports_zero_if_the_only_digits_are_zero() {
	if res := largest_product('0000', 2) {
		assert res == 0
	} else {
		assert false, "largest_product('0000', 2) should not return an error"
	}
}

fn test_reports_zero_if_all_spans_include_zero() {
	if res := largest_product('99099', 3) {
		assert res == 0
	} else {
		assert false, "largest_product('99099', 3) should not return an error"
	}
}

fn test_rejects_span_longer_than_string_length() {
	if res := largest_product('123', 4) {
		assert false, 'span longer than string length should return an error'
	} else {
		assert true
	}
}

fn test_reports_1_for_empty_string_and_empty_product_0_span() {
	if res := largest_product('', 0) {
		assert res == 1
	} else {
		assert false, "largest_product('', 0) should not return an error"
	}
}

fn test_reports_1_for_nonempty_string_and_empty_product_0_span() {
	if res := largest_product('123', 0) {
		assert res == 1
	} else {
		assert false, "largest_product('123', 0) should not return an error"
	}
}

fn test_rejects_empty_string_and_nonzero_span() {
	if res := largest_product('', 1) {
		assert false, 'empty string and nonzero span should return an error'
	} else {
		assert true
	}
}

fn test_rejects_invalid_character_in_digits() {
	if res := largest_product('1234a5', 2) {
		assert false, 'invalid character in digits should return an error'
	} else {
		assert err.msg() == 'digits input must only contain digits'
	}
}

fn test_rejects_negative_span() {
	if res := largest_product('12345', -1) {
		assert false, 'negative span should return an error'
	} else {
		assert err.msg() == 'span must not be negative'
	}
}
