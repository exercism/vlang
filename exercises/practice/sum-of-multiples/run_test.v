module main

fn test_no_multiples_within_limit() {
	factors := [3, 5]
	assert sum(factors, 1) == 0
}

fn test_one_factor_has_multiples_within_limit() {
	factors := [3, 5]
	assert sum(factors, 4) == 3
}

fn test_more_than_one_multiple_within_limit() {
	factors := [3]
	assert sum(factors, 7) == 9
}

fn test_more_than_one_factor_with_multiples_within_limit() {
	factors := [3, 5]
	assert sum(factors, 10) == 23
}

fn test_each_multiple_is_only_counted_once() {
	factors := [3, 5]
	assert sum(factors, 100) == 2318
}

fn test_a_much_larger_limit() {
	factors := [3, 5]
	assert sum(factors, 1000) == 233168
}

fn test_three_factors() {
	factors := [7, 13, 17]
	assert sum(factors, 20) == 51
}

fn test_factors_not_relatively_prime() {
	factors := [4, 6]
	assert sum(factors, 15) == 30
}

fn test_some_pairs_of_factors_relatively_prime_and_some_not() {
	factors := [5, 6, 8]
	assert sum(factors, 150) == 4419
}

fn test_one_factor_is_a_multiple_of_another() {
	factors := [5, 25]
	assert sum(factors, 51) == 275
}

fn test_much_larger_factors() {
	factors := [43, 47]
	assert sum(factors, 10000) == 2203160
}

fn test_all_numbers_are_multiples_of_1() {
	factors := [1]
	assert sum(factors, 100) == 4950
}

fn test_no_factors_means_an_empty_sum() {
	factors := []int{}
	assert sum(factors, 10000) == 0
}

fn test_the_only_multiple_of_0_is_0() {
	factors := [0]
	assert sum(factors, 1) == 0
}

fn test_the_factor_0_does_not_affect_the_sum_of_multiples_of_other_factors() {
	factors := [3, 0]
	assert sum(factors, 4) == 3
}

fn test_solutions_using_include_exclude_must_extend_to_cardinality_greater_than_3() {
	factors := [2, 3, 5, 7, 11]
	assert sum(factors, 10000) == 39614537
}
