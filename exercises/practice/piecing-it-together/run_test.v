module main

fn test_1000_pieces_puzzle_with_1_6_aspect_ratio() {
	puzzle := PartialInformation{
		pieces:       1000
		aspect_ratio: 1.6
	}
	expect := FullInformation{
		pieces:       1000
		border:       126
		inside:       874
		rows:         25
		columns:      40
		aspect_ratio: 1.6
		format:       'landscape'
	}
	assert jigsaw_data(puzzle)! == expect
}

fn test_square_puzzle_with_32_rows() {
	puzzle := PartialInformation{
		rows:   32
		format: 'square'
	}
	expect := FullInformation{
		pieces:       1024
		border:       124
		inside:       900
		rows:         32
		columns:      32
		aspect_ratio: 1.0
		format:       'square'
	}
	assert jigsaw_data(puzzle)! == expect
}

fn test_400_pieces_square_puzzle_with_only_inside_pieces_and_aspect_ratio() {
	puzzle := PartialInformation{
		inside:       324
		aspect_ratio: 1.0
	}
	expect := FullInformation{
		pieces:       400
		border:       76
		inside:       324
		rows:         20
		columns:      20
		aspect_ratio: 1.0
		format:       'square'
	}
	assert jigsaw_data(puzzle)! == expect
}

fn test_1500_pieces_landscape_puzzle_with_30_rows_and_1_6_aspect_ratio() {
	puzzle := PartialInformation{
		rows:         30
		aspect_ratio: 1.6666666666666667
	}
	expect := FullInformation{
		pieces:       1500
		border:       156
		inside:       1344
		rows:         30
		columns:      50
		aspect_ratio: 1.6666666666666667
		format:       'landscape'
	}
	assert jigsaw_data(puzzle)! == expect
}

fn test_300_pieces_portrait_puzzle_with_70_border_pieces() {
	puzzle := PartialInformation{
		pieces: 300
		border: 70
		format: 'portrait'
	}
	expect := FullInformation{
		pieces:       300
		border:       70
		inside:       230
		rows:         25
		columns:      12
		aspect_ratio: 0.48
		format:       'portrait'
	}
	assert jigsaw_data(puzzle)! == expect
}

fn test_puzzle_with_insufficient_data() {
	puzzle := PartialInformation{
		pieces: 1500
		format: 'landscape'
	}
	if res := jigsaw_data(puzzle) {
		assert false, 'puzzle with insufficient data should return an error'
	} else {
		assert err.msg() == 'Insufficient data'
	}
}

fn test_puzzle_with_contradictory_data() {
	puzzle := PartialInformation{
		rows:    100
		columns: 1000
		format:  'square'
	}
	if res := jigsaw_data(puzzle) {
		assert false, 'puzzle with contradictory data should return an error'
	} else {
		assert err.msg() == 'Contradictory data'
	}
}
