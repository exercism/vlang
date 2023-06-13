module main

fn largest_product(digits string, span int) !int {
	if span < 0 {
		return error('span must not be negative')
	}
	if span > digits.len {
		return error('span must be smaller than string length')
	}
	for digit in digits {
		if digit < `0` || `9` < digit {
			return error('digits input must only contain digits')
		}
	}

	mut result := 0
	for start in 0 .. (digits.len + 1 - span) {
		mut product := 1
		for index in start .. (start + span) {
			product *= int(digits[index] - `0`)
		}
		if result < product {
			result = product
		}
	}
	return result
}
