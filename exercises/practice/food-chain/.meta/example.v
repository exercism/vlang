module main

import strings

const animals = ['', 'fly', 'spider', 'bird', 'cat', 'dog', 'goat', 'cow', 'horse']

const exclamations = [
	'',
	"I don't know why she swallowed the fly. Perhaps she'll die.\n\n",
	'It wriggled and jiggled and tickled inside her.\n',
	'How absurd to swallow a bird!\n',
	'Imagine that, to swallow a cat!\n',
	'What a hog, to swallow a dog!\n',
	'Just opened her throat and swallowed a goat!\n',
	"I don't know how she swallowed a cow!\n",
	"She's dead, of course!\n\n",
]

fn recite(start_verse int, end_verse int) string {
	mut builder := strings.new_builder(4000)
	for verse in start_verse .. (end_verse + 1) {
		builder.write_string('I know an old lady who swallowed a ')
		builder.write_string(animals[verse])
		builder.write_string('.\n')
		builder.write_string(exclamations[verse])

		if verse == 1 || verse == 8 {
			continue
		}

		mut animal := verse
		for animal > 1 {
			builder.write_string('She swallowed the ')
			builder.write_string(animals[animal])
			builder.write_string(' to catch the ')

			animal--
			builder.write_string(animals[animal])

			if animal == 2 {
				builder.write_string(' that wriggled and jiggled and tickled inside her')
			}

			builder.write_string('.\n')
		}
		builder.write_string(exclamations[1])
	}
	builder.go_back(2) // Omit final newlines
	return builder.str()
}
