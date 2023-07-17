module main

fn test_zero_is_an_armstrong_number() {
	assert is_armstrong_number(0)
}

fn test_single_digit_numbers_are_armstrong_mumbers() {
	assert is_armstrong_number(5)
}

fn test_there_are_no_2_digit_armstrong_numbers() {
	assert !is_armstrong_number(10)
}

fn test_three_digit_number_that_is_an_armstrong_number() {
	assert is_armstrong_number(153)
}

fn test_three_digit_number_that_is_not_an_armstrong_number() {
	assert !is_armstrong_number(100)
}

fn test_four_digit_number_that_is_an_armstrong_number() {
	assert is_armstrong_number(9474)
}

fn test_four_digit_number_that_is_not_an_armstrong_number() {
	assert !is_armstrong_number(9475)
}

fn test_seven_digit_number_that_is_an_armstrong_number() {
	assert is_armstrong_number(9926315)
}

fn test_seven_digit_number_that_is_not_an_armstrong_number() {
	assert !is_armstrong_number(9926314)
}
