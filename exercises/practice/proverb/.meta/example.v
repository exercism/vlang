module main

import strings

fn recite(inputs []string) string {
	if inputs.len == 0 {
		return ''
	}

	mut builder := strings.new_builder(4000)
	for i in 1 .. inputs.len {
		builder.write_string('For want of a ')
		builder.write_string(inputs[i - 1])
		builder.write_string(' the ')
		builder.write_string(inputs[i])
		builder.write_string(' was lost.\n')
	}
	builder.write_string('And all for the want of a ')
	builder.write_string(inputs[0])
	builder.write_string('.')
	return builder.str()
}
