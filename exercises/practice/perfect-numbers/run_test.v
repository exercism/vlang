module main

fn test_smallest_perfect_number_is_classified_correctly() {
	if res := classify(6) {
		assert res == Number.perfect
	} else {
		assert false, 'classify(6) should not return an error'
	}
}

fn test_medium_perfect_number_is_classified_correctly() {
	if res := classify(28) {
		assert res == Number.perfect
	} else {
		assert false, 'classify(28) should not return an error'
	}
}

fn test_large_perfect_number_is_classified_correctly() {
	if res := classify(33550336) {
		assert res == Number.perfect
	} else {
		assert false, 'classify(33550336) should not return an error'
	}
}

fn test_smallest_abundant_number_is_classified_correctly() {
	if res := classify(12) {
		assert res == Number.abundant
	} else {
		assert false, 'classify(12) should not return an error'
	}
}

fn test_medium_abundant_number_is_classified_correctly() {
	if res := classify(30) {
		assert res == Number.abundant
	} else {
		assert false, 'classify(30) should not return an error'
	}
}

fn test_large_abundant_number_is_classified_correctly() {
	if res := classify(33550335) {
		assert res == Number.abundant
	} else {
		assert false, 'classify(33550335) should not return an error'
	}
}

fn test_perfect_square_abundant_number_is_classified_correctly() {
	if res := classify(196) {
		assert res == Number.abundant
	} else {
		assert false, 'classify(196) should not return an error'
	}
}

fn test_smallest_prime_deficient_number_is_classified_correctly() {
	if res := classify(2) {
		assert res == Number.deficient
	} else {
		assert false, 'classify(2) should not return an error'
	}
}

fn test_smallest_non_prime_deficient_number_is_classified_correctly() {
	if res := classify(4) {
		assert res == Number.deficient
	} else {
		assert false, 'classify(4) should not return an error'
	}
}

fn test_medium_deficient_number_is_classified_correctly() {
	if res := classify(32) {
		assert res == Number.deficient
	} else {
		assert false, 'classify(32) should not return an error'
	}
}

fn test_large_deficient_number_is_classified_correctly() {
	if res := classify(33550337) {
		assert res == Number.deficient
	} else {
		assert false, 'classify(33550337) should not return an error'
	}
}

fn test_edge_case_no_factors_other_than_itself_is_classified_correctly() {
	if res := classify(1) {
		assert res == Number.deficient
	} else {
		assert false, 'classify(1) should not return an error'
	}
}

fn test_zero_is_rejected_as_it_is_not_a_positive_integer() {
	if res := classify(0) {
		assert false, 'Zero is rejected (as it is not a positive integer) should return an error'
	} else {
		assert err.msg() == 'Classification is only possible for positive integers.'
	}
}

fn test_negative_integer_is_rejected_as_it_is_not_a_positive_integer() {
	if res := classify(-1) {
		assert false, 'Negative integer is rejected (as it is not a positive integer) should return an error'
	} else {
		assert err.msg() == 'Classification is only possible for positive integers.'
	}
}
