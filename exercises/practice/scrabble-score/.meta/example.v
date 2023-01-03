module main

fn score(word string) int {
	upper := word.to_upper()
	mut sum := 0

	for letter in upper {
		sum += rune_to_score(letter)
	}

	return sum
}

fn rune_to_score(r rune) int {
	return match r {
		`A`, `E`, `I`, `O`, `U`, `L`, `N`, `R`, `S`, `T` { 1 }
		`D`, `G` { 2 }
		`B`, `C`, `M`, `P` { 3 }
		`F`, `H`, `V`, `W`, `Y` { 4 }
		`K` { 5 }
		`J`, `X` { 8 }
		`Q`, `Z` { 10 }
		else { panic('Invalid rune: ${r}') }
	}
}
