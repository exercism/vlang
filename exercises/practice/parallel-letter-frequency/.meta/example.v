module main

import encoding.utf8

fn count_letters(word string) map[rune]int {
	mut result := map[rune]int{}
	lower := utf8.to_lower(word)
	for r in 0 .. utf8.len(lower) {
		c := utf8.get_rune(lower, r)
		if utf8.is_letter(rune(c)) {
			result[c]++
		}
	}
	return result
}

fn calculate_frequencies(texts []string) map[rune]int {
	mut tasks := []thread map[rune]int{}
	mut frequencies := map[rune]int{}
	for word in texts {
		tasks << spawn count_letters(word)
	}

	counts := tasks.wait()
	for _, entry in counts {
		for letter, c in entry {
			frequencies[letter] = frequencies[letter] + c
		}
	}
	return frequencies
}
