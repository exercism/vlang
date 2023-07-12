module main

// Grid rows and columns are 1-indexed.
struct Pair {
	column int
	row    int
}

struct WordLocation {
	start Pair
	end   Pair
}

fn search(grid []string, words_to_search_for []string) map[string]?WordLocation {
}
