module main

fn test_just_a_number() {
	question := 'What is 5?'
	if res := answer(question) {
		assert res == 5
	} else {
		assert false, 'should return 5, not an error'
	}
}

fn test_just_a_zero() {
	question := 'What is 0?'
	if res := answer(question) {
		assert res == 0
	} else {
		assert false, 'should return 0, not an error'
	}
}

fn test_just_a_negative_number() {
	question := 'What is -123?'
	if res := answer(question) {
		assert res == -123
	} else {
		assert false, 'should return -123, not an error'
	}
}

fn test_addition() {
	question := 'What is 1 plus 1?'
	if res := answer(question) {
		assert res == 2
	} else {
		assert false, 'should return 2, not an error'
	}
}

fn test_addition_with_a_left_hand_zero() {
	question := 'What is 0 plus 2?'
	if res := answer(question) {
		assert res == 2
	} else {
		assert false, 'should return 2, not an error'
	}
}

fn test_addition_with_a_right_hand_zero() {
	question := 'What is 3 plus 0?'
	if res := answer(question) {
		assert res == 3
	} else {
		assert false, 'should return 3, not an error'
	}
}

fn test_more_addition() {
	question := 'What is 53 plus 2?'
	if res := answer(question) {
		assert res == 55
	} else {
		assert false, 'should return 55, not an error'
	}
}

fn test_addition_with_negative_numbers() {
	question := 'What is -1 plus -10?'
	if res := answer(question) {
		assert res == -11
	} else {
		assert false, 'should return -11, not an error'
	}
}

fn test_large_addition() {
	question := 'What is 123 plus 45678?'
	if res := answer(question) {
		assert res == 45801
	} else {
		assert false, 'should return 45801, not an error'
	}
}

fn test_subtraction() {
	question := 'What is 4 minus -12?'
	if res := answer(question) {
		assert res == 16
	} else {
		assert false, 'should return 16, not an error'
	}
}

fn test_multiplication() {
	question := 'What is -3 multiplied by 25?'
	if res := answer(question) {
		assert res == -75
	} else {
		assert false, 'should return -75, not an error'
	}
}

fn test_division() {
	question := 'What is 33 divided by -3?'
	if res := answer(question) {
		assert res == -11
	} else {
		assert false, 'should return -11, not an error'
	}
}

fn test_multiple_additions() {
	question := 'What is 1 plus 1 plus 1?'
	if res := answer(question) {
		assert res == 3
	} else {
		assert false, 'should return 3, not an error'
	}
}

fn test_addition_and_subtraction() {
	question := 'What is 1 plus 5 minus -2?'
	if res := answer(question) {
		assert res == 8
	} else {
		assert false, 'should return 8, not an error'
	}
}

fn test_multiple_subtraction() {
	question := 'What is 20 minus 4 minus 13?'
	if res := answer(question) {
		assert res == 3
	} else {
		assert false, 'should return 3, not an error'
	}
}

fn test_subtraction_then_addition() {
	question := 'What is 17 minus 6 plus 3?'
	if res := answer(question) {
		assert res == 14
	} else {
		assert false, 'should return 14, not an error'
	}
}

fn test_multiple_multiplication() {
	question := 'What is 2 multiplied by -2 multiplied by 3?'
	if res := answer(question) {
		assert res == -12
	} else {
		assert false, 'should return -12, not an error'
	}
}

fn test_addition_and_multiplication() {
	question := 'What is -3 plus 7 multiplied by -2?'
	if res := answer(question) {
		assert res == -8
	} else {
		assert false, 'should return -8, not an error'
	}
}

fn test_multiple_division() {
	question := 'What is -12 divided by 2 divided by -3?'
	if res := answer(question) {
		assert res == 2
	} else {
		assert false, 'should return 2, not an error'
	}
}

fn test_unknown_operation() {
	question := 'What is 52 cubed?'
	if res := answer(question) {
		assert false, 'unknown operation should be rejected'
	} else {
		assert true
	}
}

fn test_non_math_question() {
	question := 'Who is the President of the United States?'
	if res := answer(question) {
		assert false, 'Non math question should be rejected'
	} else {
		assert true
	}
}

fn test_reject_problem_missing_an_operand() {
	question := 'What is 1 plus?'
	if res := answer(question) {
		assert false, 'problem missing an operand should be rejected'
	} else {
		assert true
	}
}

fn test_reject_problem_with_no_operands_or_operators() {
	question := 'What is?'
	if res := answer(question) {
		assert false, 'problem with no operands or operators should be rejected'
	} else {
		assert true
	}
}

fn test_reject_two_operations_in_a_row() {
	question := 'What is 1 plus plus 2?'
	if res := answer(question) {
		assert false, 'two operations in a row should be rejected'
	} else {
		assert true
	}
}

fn test_reject_two_numbers_in_a_row() {
	question := 'What is 1 plus 2 1?'
	if res := answer(question) {
		assert false, 'two numbers in a row should be rejected'
	} else {
		assert true
	}
}

fn test_reject_postfix_notation() {
	question := 'What is 1 2 plus?'
	if res := answer(question) {
		assert false, 'postfix notation should be rejected'
	} else {
		assert true
	}
}

fn test_reject_prefix_notation() {
	question := 'What is plus 1 2?'
	if res := answer(question) {
		assert false, 'prefix notation should be rejected'
	} else {
		assert true
	}
}
