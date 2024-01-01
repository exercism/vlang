module main

fn test_just_a_number() {
	question := 'What is 5?'
	assert answer(question)! == 5
}

fn test_addition() {
	question := 'What is 1 plus 1?'
	assert answer(question)! == 2
}

fn test_more_addition() {
	question := 'What is 53 plus 2?'
	assert answer(question)! == 55
}

fn test_addition_with_negative_numbers() {
	question := 'What is -1 plus -10?'
	assert answer(question)! == -11
}

fn test_large_addition() {
	question := 'What is 123 plus 45678?'
	assert answer(question)! == 45801
}

fn test_subtraction() {
	question := 'What is 4 minus -12?'
	assert answer(question)! == 16
}

fn test_multiplication() {
	question := 'What is -3 multiplied by 25?'
	assert answer(question)! == -75
}

fn test_division() {
	question := 'What is 33 divided by -3?'
	assert answer(question)! == -11
}

fn test_multiple_additions() {
	question := 'What is 1 plus 1 plus 1?'
	assert answer(question)! == 3
}

fn test_addition_and_subtraction() {
	question := 'What is 1 plus 5 minus -2?'
	assert answer(question)! == 8
}

fn test_multiple_subtraction() {
	question := 'What is 20 minus 4 minus 13?'
	assert answer(question)! == 3
}

fn test_subtraction_then_addition() {
	question := 'What is 17 minus 6 plus 3?'
	assert answer(question)! == 14
}

fn test_multiple_multiplication() {
	question := 'What is 2 multiplied by -2 multiplied by 3?'
	assert answer(question)! == -12
}

fn test_addition_and_multiplication() {
	question := 'What is -3 plus 7 multiplied by -2?'
	assert answer(question)! == -8
}

fn test_multiple_division() {
	question := 'What is -12 divided by 2 divided by -3?'
	assert answer(question)! == 2
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
