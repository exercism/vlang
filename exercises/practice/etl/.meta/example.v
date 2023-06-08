module main

fn transform(legacy map[int][]rune) map[rune]int {
	mut result := map[rune]int{}
	for score, letters in legacy {
		for letter in letters {
			lower_letter := letter.str().to_lower()[0]
			result[lower_letter] = score
		}
	}
	return result
}
