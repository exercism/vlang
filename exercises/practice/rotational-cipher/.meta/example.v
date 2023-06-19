module main

fn rotate(text string, shift_key int) string {
	assert 0 <= shift_key && shift_key <= 26
	mut buffer := []u8{cap: text.len}
	for ch in text {
		if `A` <= ch && ch <= `Z` {
			buffer << u8(`A` + (ch - `A` + shift_key) % 26)
		} else if `a` <= ch && ch <= `z` {
			buffer << u8(`a` + (ch - `a` + shift_key) % 26)
		} else {
			buffer << ch
		}
	}
	return buffer.bytestr()
}
