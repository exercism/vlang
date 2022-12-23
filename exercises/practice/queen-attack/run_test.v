module main

fn test_valid_no_attack_1() {
	assert !can_queen_attack('b3', 'd7')!
}

fn test_valid_no_attack_2() {
	assert !can_queen_attack('a1', 'f8')!
}

fn test_same_file() {
	assert can_queen_attack('b4', 'b7')!
}

fn test_same_rank() {
	assert can_queen_attack('e4', 'b4')!
}

fn test_common_diagonal_a_f() {
	assert can_queen_attack('a1', 'f6')!
}

fn test_common_diagonal_a_b() {
	assert can_queen_attack('a6', 'b7')!
}

fn test_common_diagonal_d_f() {
	assert can_queen_attack('d1', 'f3')!
}

fn test_common_diagonal_f_a() {
	assert can_queen_attack('f1', 'a6')!
}

fn test_common_diagonal_a_h() {
	assert can_queen_attack('a1', 'h8')!
}

fn test_common_diagonal_a_h8() {
	assert can_queen_attack('a8', 'h1')!
}

fn test_same_square() {
	if res := can_queen_attack('b4', 'b4') {
		assert false, 'queens on same square'
	} else {
		assert err.msg() == 'queens on same square'
	}
}

fn test_off_board_b9() {
	if res := can_queen_attack('a8', 'b9') {
		assert false, 'b9 is not a valid square'
	} else {
		assert err.msg() == 'b9 is not a valid square'
	}
}

fn test_off_board_a0() {
	if res := can_queen_attack('a0', 'b1') {
		assert false, 'a0 is not a valid square'
	} else {
		assert err.msg() == 'a0 is not a valid square'
	}
}

fn test_off_board_i5() {
	if res := can_queen_attack('g3', 'i5') {
		assert false, 'i5 is not a valid square'
	} else {
		assert err.msg() == 'i5 is not a valid square'
	}
}

fn test_off_board_here() {
	if res := can_queen_attack('here', 'there') {
		assert false, 'here is not a valid square'
	} else {
		assert err.msg() == 'here is not a valid square'
	}
}

fn test_off_board_empty() {
	if res := can_queen_attack('', '') {
		assert false, ' is not a valid square'
	} else {
		assert err.msg() == ' is not a valid square'
	}
}
