module main

import strings

const gifts = 'twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n'

const ordinals = ['', 'first', 'second', 'third', 'fourth', 'fifth', 'sixth', 'seventh', 'eighth',
	'ninth', 'tenth', 'eleventh', 'twelfth']

const table = [0, 235, 213, 194, 174, 157, 137, 113, 90, 69, 48, 26, 0]

fn recite(start_verse int, end_verse int) string {
	mut builder := strings.new_builder(4000)
	for verse in start_verse .. (end_verse + 1) {
		builder.write_string('On the ')
		builder.write_string(ordinals[verse])
		builder.write_string(' day of Christmas my true love gave to me: ')
		builder.write_string(gifts[table[verse]..])
	}
	builder.go_back(1) // Omit final newline
	return builder.str()
}
