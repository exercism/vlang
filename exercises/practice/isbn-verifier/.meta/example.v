module main

import arrays { group, sum }
import regex { regex_opt }

const (
	isbn_len = 10

	/*
	Using a regular expression, I now have two problems:

	https://blog.codinghorror.com/regular-expressions-now-you-have-two-problems/

	however, it solves two problems:
	- length check
	- character validation
	*/
	isbn_re  = regex_opt(r'^\d{9}(\d|X)$') or { panic('Invalid ISBN-10 regular expression') }
	weights  = []int{len: isbn_len, init: isbn_len - index} // [10, 9, 8, ..., 1]
	zero     = int(`0`)
)

// convert single digit (`0`...`9`) to its integer equivalent.
fn digit_to_int(d u8) int {
	assert d.is_digit(), '<${d}> is not a valid digit'
	return int(d) - zero
}

// is 'isbn_10' a valid ISBN-10 code?
pub fn is_valid(isbn_10 string) bool {
	norm_isbn := isbn_10.replace('-', '').trim_space()

	if !isbn_re.matches_string(norm_isbn) {
		return false
	}

	check_idx := isbn_len - 1
	mut numbers := norm_isbn[..check_idx].bytes().map(digit_to_int(it))
	check_num := norm_isbn[check_idx]

	numbers << match check_num {
		`X` { 10 }
		else { digit_to_int(check_num) }
	}

	if total := sum(group[int](numbers, weights).map(fn (pair []int) int {
		return pair[0] * pair[1]
	}))
	{
		return total % 11 == 0
	}

	return false
}
