module main

enum State {
	double // Previous two frames were strikes.
	strike // Previous frame was a strike.
	spare // Previous frame was a spare.
	open // Previous frame was not a strike or a spare.
}

struct Game {
mut:
	score  int
	pins   int
	frames int
	state  State = .open
}

// build a new Game
fn Game.new() Game {
	return Game{}
}

pub fn (g Game) is_over() bool {
	return match g.state {
		.double {
			if g.pins == 0 {
				g.frames == 12
			} else {
				g.frames == 11
			}
		}
		.strike {
			g.frames == 11
		}
		.spare {
			if g.pins == 0 {
				g.frames == 11
			} else {
				g.frames == 10
			}
		}
		.open {
			g.frames >= 10
		}
	}
}

pub fn (mut g Game) roll(pins int) ! {
	if g.is_over() {
		return error('Cannot roll after game is over')
	}

	if pins < 0 {
		return error('Negative roll is invalid')
	}

	if pins > 10 || (g.pins > 0 && pins > g.pins) {
		return error('Pin count exceeds pins on the lane')
	}

	if g.frames < 10 {
		g.score += pins
	}

	if g.state != .open && (g.state != .spare || g.pins == 0) {
		g.score += pins
		if g.state == .double && g.pins == 0 && g.frames < 11 {
			g.score += pins
		}
	}

	if g.pins == 0 {
		g.pins = 10 - pins
		if g.pins == 0 {
			if g.state == .double || g.state == .strike {
				g.state = .double
			} else {
				g.state = .strike
			}
		}
	} else {
		if pins == g.pins {
			g.state = .spare
		} else {
			g.state = .open
		}
		g.pins = 0
	}

	if g.pins == 0 {
		g.frames++
	}
}

pub fn (g Game) score() !int {
	if !g.is_over() {
		return error('Score cannot be taken until the end of the game')
	}
	return g.score
}
