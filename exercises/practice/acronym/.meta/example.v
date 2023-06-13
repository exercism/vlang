module main

import strings

fn abbreviate(phrase string) string {
	mut builder := strings.new_builder(10)
	mut in_word := false
	for ch in phrase.to_upper() {
		if `A` <= ch && ch <= `Z` {
			if !in_word {
				builder.write_u8(ch)
				in_word = true
			}
		} else if ch == `-` || ch.is_space() {
			in_word = false
		}
	}
	return builder.str()
}
