module main

enum State {
	ongoing
	lose
	win
}

struct Game {
mut:
	word      string
	guessed   []u8
	remaining int
	state     State
}

fn new_game(word string) Game {
	return Game{
		word:      word
		guessed:   []
		remaining: 9
		state:     State.ongoing
	}
}

fn (g &Game) masked_word() string {
	mut masked := []u8{cap: g.word.len}
	for letter in g.word {
		if letter in g.guessed {
			masked << letter
		} else {
			masked << `_`
		}
	}
	return masked.bytestr()
}

fn (mut g Game) guess(letter u8) !State {
	if g.state == State.win {
		return error('cannot guess after the game is won')
	}
	if g.state == State.lose {
		return error('cannot guess after the game is lost')
	}
	if g.word.bytes().contains(letter) && letter !in g.guessed {
		g.guessed << letter
	} else {
		if g.remaining > 0 {
			g.remaining--
		} else {
			g.state = State.lose
		}
	}
	if g.masked_word() == g.word {
		g.state = State.win
	}
	return g.state
}
