module main

import math { log10, powi }

pub fn is_armstrong_number(number i64) bool {
	num_of_digits := i64(log10(f64(number))) + 1

	mut sum := i64(0)

	for div := number; div > 0; div /= 10 {
		sum += powi(div % 10, num_of_digits)
	}

	return sum == number
}
