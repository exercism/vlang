module main

fn test_black() {
	assert color_code('black') == 0
}

fn test_white() {
	assert color_code('white') == 9
}

fn test_orange() {
	assert color_code('orange') == 3
}

fn test_colors() {
	assert colors == [
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
}
