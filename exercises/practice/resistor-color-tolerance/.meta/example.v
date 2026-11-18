module main

fn label(colors []string) string {
	if colors.len == 1 {
		return '0 ohms'
	}

	tolerance := tolerances[tolerance_colors.index(colors[colors.len - 1])]
	mut multiplier := all_colors.index(colors[colors.len - 2]) + 1
	first := digit(colors[0])
	second := digit(colors[1])
	mut third := `0`
	if colors.len == 5 {
		third = digit(colors[2])
		multiplier++
	}

	mut buffer := []u8{}
	match multiplier % 3 {
		0 {
			buffer << first
			if second != `0` || third != `0` {
				buffer << `.`
				buffer << second
			}
			if third != `0` {
				buffer << third
			}
		}
		1 {
			if first != `0` {
				buffer << first
			}
			buffer << second
			if third != `0` {
				buffer << `.`
				buffer << third
			}
		}
		else {
			if first != `0` {
				buffer << first
			}
			if first != `0` || second != `0` {
				buffer << second
			}
			buffer << third
		}
	}

	return '${buffer.bytestr()} ${prefixes[multiplier / 3]}ohms ${tolerance}'
}

fn digit(color string) u8 {
	return u8(all_colors.index(color)) + `0`
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

const tolerance_colors = [
	'grey',
	'violet',
	'blue',
	'green',
	'brown',
	'red',
	'gold',
	'silver',
]

const tolerances = [
	'±0.05%',
	'±0.1%',
	'±0.25%',
	'±0.5%',
	'±1%',
	'±2%',
	'±5%',
	'±10%',
]

const prefixes = ['', 'kilo', 'mega', 'giga']
