module main

import arrays { sum }

pub enum Number {
	perfect
	abundant
	deficient
}

// all the factors of 'n' _not_ including 'n'
// Example: factors(4) == [1, 2]
// Example: factors(1) == []
fn factors(n int) []int {
	candidates := []int{len: n / 2, init: index + 1}
	return candidates.filter(n % it == 0)
}

pub fn classify(candidate int) !Number {
	if candidate < 1 {
		return error('Classification is only possible for positive integers.')
	}

	aliquot := sum(factors(candidate)) or { 0 }

	if aliquot > candidate {
		return .abundant
	} else if aliquot < candidate {
		return .deficient
	}

	return .perfect
}
