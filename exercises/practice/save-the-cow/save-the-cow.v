module main

// A game of save the cow, in which a word is hidden behind underscores
// and the player has nine failures to spare before losing.
//
// Call `guess` once per guessed letter and read `state`, `remaining` and
// `masked_word()` to find out how the game is going. Guessing after the
// game has been won or lost is an error.
enum State {
	ongoing
	lose
	win
}

struct Game {
mut:
	// The word that has to be guessed.
	word string
	// Every letter that has been guessed so far.
	guessed []u8
	// How many wrong guesses are left before the game is lost.
	remaining int
	// Whether the game is still going, won or lost.
	state State
}

fn new_game(word string) Game {
}

fn (g Game) masked_word() string {
}

fn (mut g Game) guess(letter u8) !State {
}
