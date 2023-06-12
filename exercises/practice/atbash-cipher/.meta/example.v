module main

import strings

fn replacement(ch u8) ?u8 {
	if `0` <= ch && ch <= `9` {
		return ch
	}
	if `A` <= ch && ch <= `Z` {
		return u8(`a` + `Z` - ch)
	}
	if `a` <= ch && ch <= `z` {
		return u8(`a` + `z` - ch)
	}
	return none
}

fn encode(phrase string) string {
	mut builder := strings.new_builder(phrase.len * 6 / 5)
	for ch in phrase {
		if encoded_ch := replacement(ch) {
			if builder.len % 6 == 5 {
				builder.write_u8(u8(` `))
			}
			builder.write_u8(encoded_ch)
		}
	}
	return builder.str()
}

fn decode(phrase string) string {
	mut builder := strings.new_builder(phrase.len)
	for ch in phrase {
		if decoded_ch := replacement(ch) {
			builder.write_u8(decoded_ch)
		}
	}
	return builder.str()
}
