module main

fn raindrops(number int) string {
	mut s := ''
	if number % 3 == 0 {
		s += 'Pling'
	}
	if number % 5 == 0 {
		s += 'Plang'
	}
	if number % 7 == 0 {
		s += 'Plong'
	}
	if s == '' {
		s += '${number}'
	}
	return s
}
