module main

fn test_create_robot__at_origin_facing_north() {
	robot := Robot.new(0, 0, .north)
	assert robot.position.x == 0
	assert robot.position.y == 0
	assert robot.direction == .north
}

fn test_create_robot__at_negative_position_facing_south() {
	robot := Robot.new(-1, -1, .south)
	assert robot.position.x == -1
	assert robot.position.y == -1
	assert robot.direction == .south
}

fn test_rotating_clockwise__changes_north_to_east() {
	mut robot := Robot.new(0, 0, .north)
	robot.move('R')
	assert robot.position.x == 0
	assert robot.position.y == 0
	assert robot.direction == .east
}

fn test_rotating_clockwise__changes_east_to_south() {
	mut robot := Robot.new(0, 0, .east)
	robot.move('R')
	assert robot.position.x == 0
	assert robot.position.y == 0
	assert robot.direction == .south
}

fn test_rotating_clockwise__changes_south_to_west() {
	mut robot := Robot.new(0, 0, .south)
	robot.move('R')
	assert robot.position.x == 0
	assert robot.position.y == 0
	assert robot.direction == .west
}

fn test_rotating_clockwise__changes_west_to_north() {
	mut robot := Robot.new(0, 0, .west)
	robot.move('R')
	assert robot.position.x == 0
	assert robot.position.y == 0
	assert robot.direction == .north
}

fn test_rotating_counter_clockwise__changes_north_to_west() {
	mut robot := Robot.new(0, 0, .north)
	robot.move('L')
	assert robot.position.x == 0
	assert robot.position.y == 0
	assert robot.direction == .west
}

fn test_rotating_counter_clockwise__changes_west_to_south() {
	mut robot := Robot.new(0, 0, .west)
	robot.move('L')
	assert robot.position.x == 0
	assert robot.position.y == 0
	assert robot.direction == .south
}

fn test_rotating_counter_clockwise__changes_south_to_east() {
	mut robot := Robot.new(0, 0, .south)
	robot.move('L')
	assert robot.position.x == 0
	assert robot.position.y == 0
	assert robot.direction == .east
}

fn test_rotating_counter_clockwise__changes_east_to_north() {
	mut robot := Robot.new(0, 0, .east)
	robot.move('L')
	assert robot.position.x == 0
	assert robot.position.y == 0
	assert robot.direction == .north
}

fn test_moving_forward_one__facing_north_increments_y() {
	mut robot := Robot.new(0, 0, .north)
	robot.move('A')
	assert robot.position.x == 0
	assert robot.position.y == 1
	assert robot.direction == .north
}

fn test_moving_forward_one__facing_south_decrements_y() {
	mut robot := Robot.new(0, 0, .south)
	robot.move('A')
	assert robot.position.x == 0
	assert robot.position.y == -1
	assert robot.direction == .south
}

fn test_moving_forward_one__facing_east_increments_x() {
	mut robot := Robot.new(0, 0, .east)
	robot.move('A')
	assert robot.position.x == 1
	assert robot.position.y == 0
	assert robot.direction == .east
}

fn test_moving_forward_one__facing_west_decrements_x() {
	mut robot := Robot.new(0, 0, .west)
	robot.move('A')
	assert robot.position.x == -1
	assert robot.position.y == 0
	assert robot.direction == .west
}

fn test_follow_series_of_instructions__moving_east_and_north_from_readme() {
	mut robot := Robot.new(7, 3, .north)
	robot.move('RAALAL')
	assert robot.position.x == 9
	assert robot.position.y == 4
	assert robot.direction == .west
}

fn test_follow_series_of_instructions__moving_west_and_north() {
	mut robot := Robot.new(0, 0, .north)
	robot.move('LAAARALA')
	assert robot.position.x == -4
	assert robot.position.y == 1
	assert robot.direction == .west
}

fn test_follow_series_of_instructions__moving_west_and_south() {
	mut robot := Robot.new(2, -7, .east)
	robot.move('RRAAAAALA')
	assert robot.position.x == -3
	assert robot.position.y == -8
	assert robot.direction == .south
}

fn test_follow_series_of_instructions__moving_east_and_north() {
	mut robot := Robot.new(8, 4, .south)
	robot.move('LAAARRRALLLL')
	assert robot.position.x == 11
	assert robot.position.y == 5
	assert robot.direction == .north
}
