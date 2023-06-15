module main

struct Palindrome {
	value   ?int
	factors [][]int
}

fn is_palindrome(product int) bool {
	s := product.str()
	return s == s.reverse()
}

fn smallest(min int, max int) !Palindrome {
	if min > max {
		return error('min must be <= max')
	}
	mut value := max * max + 1
	mut factors := [][]int{}

	for first in min .. (max + 1) {
		for second in first .. (max + 1) {
			product := first * second
			if product > value {
				break
			}
			if !is_palindrome(product) {
				continue
			}
			if product < value {
				value = product
				factors = [][]int{}
			}
			factors << [first, second]
		}
	}

	if factors.len == 0 {
		return Palindrome{}
	}
	return Palindrome{
		value: value
		factors: factors
	}
}

fn largest(min int, max int) !Palindrome {
	if min > max {
		return error('min must be <= max')
	}
	mut value := -1
	mut factors := [][]int{}

	for i in 0 .. (max - min + 1) {
		first := max - i
		for j in 0 .. (max - first + 1) {
			second := max - j
			product := first * second
			if product < value {
				break
			}
			if !is_palindrome(product) {
				continue
			}
			if product > value {
				value = product
				factors = [][]int{}
			}
			factors << [first, second]
		}
	}

	if factors.len == 0 {
		return Palindrome{}
	}
	return Palindrome{
		value: value
		factors: factors.reverse()
	}
}
