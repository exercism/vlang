module main

import strings

fn translate(phrase string) string {
	vowel := [
		true, // a
		false,
		false,
		false,
		true, // e
		false,
		false,
		false,
		true, // i
		false,
		false,
		false,
		false,
		false,
		true, // o
		false,
		false,
		false,
		false,
		false,
		true, // u
		false,
		false,
		false,
		true, // y
		false,
	]

	words := phrase.split(' ')
	mut builder := strings.new_builder(phrase.len + 2 * words.len)
	for word in words {
		mut index := 0
		rule1 := word.len > 1 && if vowel[word[0] - `a`] { word[0] != `y`
			|| word[0..2] == 'yt' } else { word[0..2] == 'xr' }

		if !rule1 {
			index++

			// Rules 2 and 4: `y` is treated like a vowel.
			for index < word.len && !vowel[word[index] - `a`] {
				index++
			}

			// Rule 3
			if index < word.len && word[(index - 1)..(index + 1)] == 'qu' {
				index++
			}
		}
		if builder.len != 0 {
			builder.write_string(' ')
		}
		builder.write_string(word[index..])
		builder.write_string(word[..index])
		builder.write_string('ay')
	}

	return builder.str()
}
