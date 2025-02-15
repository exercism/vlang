module main

import strings

const numbers = ['No', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine',
	'Ten']

fn append_line(mut builder strings.Builder, bottles int, lower bool) {
	if lower {
		builder.write_rune(numbers[bottles][0] | 32)
		builder.write_string(numbers[bottles][1..])
	} else {
		builder.write_string(numbers[bottles])
	}
	builder.write_string(' green bottle')
	if bottles != 1 {
		builder.write_rune(`s`)
	}
	builder.write_string(' hanging on the wall')
}

fn recite(start_bottles int, take_down int) string {
	mut builder := strings.new_builder(4000)
	mut bottles := start_bottles
	for bottles > start_bottles - take_down {
		append_line(mut &builder, bottles, false)
		builder.write_string(',\n')

		append_line(mut &builder, bottles, false)
		builder.write_string(',\n')

		builder.write_string("And if one green bottle should accidentally fall,\nThere'll be ")
		bottles--

		append_line(mut &builder, bottles, true)
		builder.write_string('.\n\n')
	}
	builder.go_back(2)
	return builder.str()
}
