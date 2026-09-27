module main

// evaluate runs every line of source on one fresh machine and returns the
// values that are left on the stack afterwards.
fn evaluate(sources ...string) ![]int {
	mut machine := new_machine()
	for source in sources {
		machine.run(source) or { return err }
	}
	return machine.stack_values()
}

// assert_error fails unless running the given lines of source reports an
// error. The canonical data names the reason a case expects one in the
// `expected.error` field of the case, so only the fact that the run fails is
// checked here; the wording of the message is left to the implementation.
fn assert_error(sources ...string) {
	mut machine := new_machine()
	mut reason := ''
	for source in sources {
		machine.run(source) or { reason = err.msg() }
	}
	assert reason != '', 'expected a run of ${sources} to fail'
}

fn test_numbers_just_get_pushed_onto_the_stack() {
	assert evaluate('1 2 3 4 5')! == [1, 2, 3, 4, 5]
}

fn test_pushes_negative_numbers_onto_the_stack() {
	assert evaluate('-1 -2 -3 -4 -5')! == [-1, -2, -3, -4, -5]
}

fn test_addition_can_add_two_numbers() {
	assert evaluate('1 2 +')! == [3]
}

fn test_addition_errors_if_there_is_nothing_on_the_stack() {
	// expects: empty stack
	assert_error('+')
}

fn test_addition_errors_if_there_is_only_one_value_on_the_stack() {
	// expects: only one value on the stack
	assert_error('1 +')
}

fn test_addition_more_than_two_values_on_the_stack() {
	assert evaluate('1 2 3 +')! == [1, 5]
}

fn test_subtraction_can_subtract_two_numbers() {
	assert evaluate('3 4 -')! == [-1]
}

fn test_subtraction_errors_if_there_is_nothing_on_the_stack() {
	// expects: empty stack
	assert_error('-')
}

fn test_subtraction_errors_if_there_is_only_one_value_on_the_stack() {
	// expects: only one value on the stack
	assert_error('1 -')
}

fn test_subtraction_more_than_two_values_on_the_stack() {
	assert evaluate('1 12 3 -')! == [1, 9]
}

fn test_multiplication_can_multiply_two_numbers() {
	assert evaluate('2 4 *')! == [8]
}

fn test_multiplication_errors_if_there_is_nothing_on_the_stack() {
	// expects: empty stack
	assert_error('*')
}

fn test_multiplication_errors_if_there_is_only_one_value_on_the_stack() {
	// expects: only one value on the stack
	assert_error('1 *')
}

fn test_multiplication_more_than_two_values_on_the_stack() {
	assert evaluate('1 2 3 *')! == [1, 6]
}

fn test_division_can_divide_two_numbers() {
	assert evaluate('12 3 /')! == [4]
}

fn test_division_performs_integer_division() {
	assert evaluate('8 3 /')! == [2]
}

fn test_division_errors_if_dividing_by_zero() {
	// expects: divide by zero
	assert_error('4 0 /')
}

fn test_division_errors_if_there_is_nothing_on_the_stack() {
	// expects: empty stack
	assert_error('/')
}

fn test_division_errors_if_there_is_only_one_value_on_the_stack() {
	// expects: only one value on the stack
	assert_error('1 /')
}

fn test_division_more_than_two_values_on_the_stack() {
	assert evaluate('1 12 3 /')! == [1, 4]
}

fn test_combined_arithmetic_addition_and_subtraction() {
	assert evaluate('1 2 + 4 -')! == [-1]
}

fn test_combined_arithmetic_multiplication_and_division() {
	assert evaluate('2 4 * 3 /')! == [2]
}

fn test_combined_arithmetic_multiplication_and_addition() {
	assert evaluate('1 3 4 * +')! == [13]
}

fn test_combined_arithmetic_addition_and_multiplication() {
	assert evaluate('1 3 4 + *')! == [7]
}

fn test_dup_copies_a_value_on_the_stack() {
	assert evaluate('1 dup')! == [1, 1]
}

fn test_dup_copies_the_top_value_on_the_stack() {
	assert evaluate('1 2 dup')! == [1, 2, 2]
}

fn test_dup_errors_if_there_is_nothing_on_the_stack() {
	// expects: empty stack
	assert_error('dup')
}

fn test_drop_removes_the_top_value_on_the_stack_if_it_is_the_only_one() {
	assert evaluate('1 drop')!.len == 0
}

fn test_drop_removes_the_top_value_on_the_stack_if_it_is_not_the_only_one() {
	assert evaluate('1 2 drop')! == [1]
}

fn test_drop_errors_if_there_is_nothing_on_the_stack() {
	// expects: empty stack
	assert_error('drop')
}

fn test_swap_swaps_the_top_two_values_on_the_stack_if_they_are_the_only_ones() {
	assert evaluate('1 2 swap')! == [2, 1]
}

fn test_swap_swaps_the_top_two_values_on_the_stack_if_they_are_not_the_only_ones() {
	assert evaluate('1 2 3 swap')! == [1, 3, 2]
}

fn test_swap_errors_if_there_is_nothing_on_the_stack() {
	// expects: empty stack
	assert_error('swap')
}

fn test_swap_errors_if_there_is_only_one_value_on_the_stack() {
	// expects: only one value on the stack
	assert_error('1 swap')
}

fn test_over_copies_the_second_element_if_there_are_only_two() {
	assert evaluate('1 2 over')! == [1, 2, 1]
}

fn test_over_copies_the_second_element_if_there_are_more_than_two() {
	assert evaluate('1 2 3 over')! == [1, 2, 3, 2]
}

fn test_over_errors_if_there_is_nothing_on_the_stack() {
	// expects: empty stack
	assert_error('over')
}

fn test_over_errors_if_there_is_only_one_value_on_the_stack() {
	// expects: only one value on the stack
	assert_error('1 over')
}

fn test_user_defined_words_can_consist_of_built_in_words() {
	assert evaluate(': dup-twice dup dup ;', '1 dup-twice')! == [1, 1, 1]
}

fn test_user_defined_words_execute_in_the_right_order() {
	assert evaluate(': countup 1 2 3 ;', 'countup')! == [1, 2, 3]
}

fn test_user_defined_words_can_override_other_user_defined_words() {
	assert evaluate(': foo dup ;', ': foo dup dup ;', '1 foo')! == [1, 1, 1]
}

fn test_user_defined_words_can_override_built_in_words() {
	assert evaluate(': swap dup ;', '1 swap')! == [1, 1]
}

fn test_user_defined_words_can_override_built_in_operators() {
	assert evaluate(': + * ;', '3 4 +')! == [12]
}

fn test_user_defined_words_can_use_different_words_with_the_same_name() {
	assert evaluate(': foo 5 ;', ': bar foo ;', ': foo 6 ;', 'bar foo')! == [5, 6]
}

fn test_user_defined_words_can_define_word_that_uses_word_with_the_same_name() {
	assert evaluate(': foo 10 ;', ': foo foo 1 + ;', 'foo')! == [11]
}

fn test_user_defined_words_cannot_redefine_non_negative_numbers() {
	// expects: illegal operation
	assert_error(': 1 2 ;')
}

fn test_user_defined_words_cannot_redefine_negative_numbers() {
	// expects: illegal operation
	assert_error(': -1 2 ;')
}

fn test_user_defined_words_errors_if_executing_a_non_existent_word() {
	// expects: undefined operation
	assert_error('foo')
}

fn test_user_defined_words_only_defines_locally() {
	// The words of a definition belong to the machine it was defined on, so a
	// second machine still has the built in `+`.
	assert evaluate(': + - ;', '1 1 +')! == [0]
	assert evaluate('1 1 +')! == [2]
}

fn test_case_insensitivity_dup_is_case_insensitive() {
	assert evaluate('1 DUP Dup dup')! == [1, 1, 1, 1]
}

fn test_case_insensitivity_drop_is_case_insensitive() {
	assert evaluate('1 2 3 4 DROP Drop drop')! == [1]
}

fn test_case_insensitivity_swap_is_case_insensitive() {
	assert evaluate('1 2 SWAP 3 Swap 4 swap')! == [2, 3, 4, 1]
}

fn test_case_insensitivity_over_is_case_insensitive() {
	assert evaluate('1 2 OVER Over over')! == [1, 2, 1, 2, 1]
}

fn test_case_insensitivity_user_defined_words_are_case_insensitive() {
	assert evaluate(': foo dup ;', '1 FOO Foo foo')! == [1, 1, 1, 1]
}

fn test_case_insensitivity_definitions_are_case_insensitive() {
	assert evaluate(': SWAP DUP Dup dup ;', '1 swap')! == [1, 1, 1, 1]
}
