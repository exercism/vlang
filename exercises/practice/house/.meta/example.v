module main

import strings

const lyrics = 'This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n'

const table = [0, 389, 368, 351, 331, 310, 267, 232, 190, 145, 99, 62, 8]

fn recite(start_verse int, end_verse int) string {
	mut builder := strings.new_builder(4000)
	for verse in start_verse .. (end_verse + 1) {
		builder.write_string(lyrics[0..8])
		builder.write_string(lyrics[table[verse]..])
	}
	builder.go_back(1) // Omit final newline
	return builder.str()
}
