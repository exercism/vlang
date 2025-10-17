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
mut:
	position  Position
	direction Direction
}

fn Robot.new(x int, y int, direction Direction) Robot {
	return Robot{Position{x, y}, direction}
}

fn (mut robot Robot) move(instructions string) {
	for instruction in instructions {
		match instruction {
			`R` {
				match robot.direction {
					.north {
						robot.direction = .east
					}
					.east {
						robot.direction = .south
					}
					.south {
						robot.direction = .west
					}
					.west {
						robot.direction = .north
					}
				}
			}
			`L` {
				match robot.direction {
					.north {
						robot.direction = .west
					}
					.east {
						robot.direction = .north
					}
					.south {
						robot.direction = .east
					}
					.west {
						robot.direction = .south
					}
				}
			}
			`A` {
				match robot.direction {
					.north {
						robot.position = Position{robot.position.x, robot.position.y + 1}
					}
					.east {
						robot.position = Position{robot.position.x + 1, robot.position.y}
					}
					.south {
						robot.position = Position{robot.position.x, robot.position.y - 1}
					}
					.west {
						robot.position = Position{robot.position.x - 1, robot.position.y}
					}
				}
			}
			else {}
		}
	}
}
