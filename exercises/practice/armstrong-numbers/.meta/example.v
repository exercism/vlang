module main

import math { count_digits, powi }

pub fn is_armstrong_number(number i64) bool {
	assert number >= 0, 'Armstrong numbers cannot be negative'

	num_of_digits := count_digits(number)
	mut sum := i64(0)

	for div := number; div > 0; div /= 10 {
		sum += powi(div % 10, num_of_digits)
	}

	return sum == number
}
