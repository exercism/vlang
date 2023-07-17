module main

import math { count_digits, powi }

pub fn is_armstrong_number(number u32) bool {
	signed_num := i64(number)
	num_of_digits := count_digits(signed_num)
	mut sum := i64(0)

	for div := signed_num; div > 0; div /= 10 {
		sum += powi(div % 10, num_of_digits)
	}

	return sum == signed_num
}
