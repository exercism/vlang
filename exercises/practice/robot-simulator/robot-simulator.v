module main

struct Position {
	x int
	y int
}

enum Direction {
	north
	east
	south
	west
}

struct Robot {
	// Please define the `Robot` struct
}

fn Robot.new(x int, y int, direction Direction) Robot {
	// Please implement the `Robot.new` function
}

fn (mut robot Robot) move(instructions string) {
	// Please implement the `move` function
}
