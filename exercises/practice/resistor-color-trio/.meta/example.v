module main

fn label(colors []string) string {
	assert colors.len >= 3
	first := all_colors.index(colors[0]) + `0`
	assert first >= `0`
	second := all_colors.index(colors[1]) + `0`
	assert second >= `0`
	third := all_colors.index(colors[2]) + 1
	assert third >= 1

	mut buffer := []u8{}
	match third % 3 {
		0 {
			buffer << first
			if second != `0` {
				buffer << `.`
				buffer << second
			}
		}
		1 {
			if first != `0` {
				buffer << first
			}
			buffer << second
		}
		else {
			buffer << first
			buffer << second
			buffer << `0`
		}
	}

	return buffer.bytestr() + units[third / 3]
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

const units = [
	' ohms',
	' kiloohms',
	' megaohms',
	' gigaohms',
]
