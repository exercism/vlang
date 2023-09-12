module main

fn test_smallest_perfect_number_is_classified_correctly() {
	assert classify(6)! == .perfect
}

fn test_medium_perfect_number_is_classified_correctly() {
	assert classify(28)! == .perfect
}

fn test_large_perfect_number_is_classified_correctly() {
	assert classify(33_550_336)! == .perfect
}

fn test_smallest_abundant_number_is_classified_correctly() {
	assert classify(12)! == .abundant
}

fn test_medium_abundant_number_is_classified_correctly() {
	assert classify(30)! == .abundant
}

fn test_large_abundant_number_is_classified_correctly() {
	assert classify(33_550_335)! == .abundant
}

fn test_smallest_prime_deficient_number_is_classified_correctly() {
	assert classify(2)! == .deficient
}

fn test_smallest_non_prime_deficient_number_is_classified_correctly() {
	assert classify(4)! == .deficient
}

fn test_medium_deficient_number_is_classified_correctly() {
	assert classify(32)! == .deficient
}

fn test_large_deficient_number_is_classified_correctly() {
	assert classify(33_550_337)! == .deficient
}

fn test_edge_case_no_factors_other_than_itself_is_classified_correctly() {
	assert classify(1)! == .deficient
}

fn test_zero_is_rejected_as_it_is_not_a_positive_integer() {
	assert_result_error(0)
}

fn test_negative_integer_is_rejected_as_it_is_not_a_positive_integer() {
	assert_result_error(-1)
}

// expect 'error'
fn assert_result_error(n int) {
	if r := classify(n) {
		assert false, 'Expected error, not "${r}"'
	} else {
		assert err.msg() == 'Classification is only possible for positive integers.'
	}
}
