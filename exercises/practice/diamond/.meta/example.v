module main

import strings

fn generate_row(index int, n int) string {
	if index > n {
		return generate_row(2 * n - index, n)
	}
	len := 2 * n + 1
	mut builder := strings.new_builder(len)
	builder.write_string(strings.repeat(u8(` `), n - index))
	builder.write_rune(`A` + index)
	if index > 0 {
		builder.write_string(strings.repeat(u8(` `), 2 * index - 1))
		builder.write_rune(`A` + index)
	}
	builder.write_string(strings.repeat(u8(` `), n - index))
	assert builder.len == len
	return builder.str()
}

fn rows(letter rune) []string {
	assert `A` <= letter && letter <= `Z`
	n := int(letter - `A`)
	len := 2 * n + 1
	mut result := []string{cap: len}
	for i in 0 .. len {
		result << generate_row(i, n)
	}
	return result
}
