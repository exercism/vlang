module main

fn can_queen_attack(white string, black string) !bool {
	if !is_valid_square(white) {
		return error('${white} is not a valid square')
	}
	if !is_valid_square(black) {
		return error('${black} is not a valid square')
	}

	if white == black {
		return error('queens on same square')
	}
	if white[0] == black[0] {
		return true
	}
	if white[1] == black[1] {
		return true
	}
	file_difference := int(white[0]) - int(black[0])
	rank_difference := int(white[1]) - int(black[1])
	if file_difference == rank_difference {
		return true
	}
	if file_difference + rank_difference == 0 {
		return true
	}

	return false
}

fn is_valid_square(square string) bool {
	if square.len != 2 || square[0] < `a` || square[0] > `h` || square[1] < `1` || square[1] > `8` {
		return false
	}
	return true
}
