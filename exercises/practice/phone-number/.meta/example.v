module main

import strings

fn clean(phrase string) !string {
	mut builder := strings.new_builder(phrase.len)
	for ch in phrase {
		if ch.is_letter() {
			return error('letters not permitted')
		}

		if ch.is_digit() {
			builder << ch
		} else if !' ()+-.'.contains_u8(ch) {
			return error('punctuations not permitted')
		}
	}

	num_digits := builder.len

	if num_digits < 10 {
		return error('must not be fewer than 10 digits')
	}

	if num_digits > 11 {
		return error('must not be greater than 11 digits')
	}

	if num_digits == 11 && builder[0] != `1` {
		return error('11 digits must start with 1')
	}

	mut result := builder.str()
	if num_digits == 11 {
		result = result.substr(1, 11)
	}

	if result[0] == `0` {
		return error('area code cannot start with zero')
	}

	if result[0] == `1` {
		return error('area code cannot start with one')
	}

	if result[3] == `0` {
		return error('exchange code cannot start with zero')
	}

	if result[3] == `1` {
		return error('exchange code cannot start with one')
	}

	return result
}
