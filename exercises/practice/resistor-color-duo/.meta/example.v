module main

fn value(colors []string) int {
	assert colors.len >= 2
	first := all_colors.index(colors[0])
	assert first >= 0
	second := all_colors.index(colors[1])
	assert second >= 0
	return first * 10 + second
}

const all_colors = [
	'black',
	'brown',
	'red',
	'orange',
	'yellow',
	'green',
	'blue',
	'violet',
	'grey',
	'white',
]
