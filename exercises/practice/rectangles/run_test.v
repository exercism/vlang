module main

fn test_no_rows() {
	strings := []string{}
	assert rectangles(strings) == 0
}

fn test_no_columns() {
	strings := [
		'',
	]
	assert rectangles(strings) == 0
}

fn test_no_rectangles() {
	strings := [
		' ',
	]
	assert rectangles(strings) == 0
}

fn test_one_rectangle() {
	strings := [
		'+-+',
		'| |',
		'+-+',
	]
	assert rectangles(strings) == 1
}

fn test_two_rectangles_without_shared_parts() {
	strings := [
		'  +-+',
		'  | |',
		'+-+-+',
		'| |  ',
		'+-+  ',
	]
	assert rectangles(strings) == 2
}

fn test_five_rectangles_with_shared_parts() {
	strings := [
		'  +-+',
		'  | |',
		'+-+-+',
		'| | |',
		'+-+-+',
	]
	assert rectangles(strings) == 5
}

fn test_rectangle_of_height_1_is_counted() {
	strings := [
		'+--+',
		'+--+',
	]
	assert rectangles(strings) == 1
}

fn test_rectangle_of_width_1_is_counted() {
	strings := [
		'++',
		'||',
		'++',
	]
	assert rectangles(strings) == 1
}

fn test_1x1_square_is_counted() {
	strings := [
		'++',
		'++',
	]
	assert rectangles(strings) == 1
}

fn test_only_complete_rectangles_are_counted() {
	strings := [
		'  +-+',
		'    |',
		'+-+-+',
		'| | -',
		'+-+-+',
	]
	assert rectangles(strings) == 1
}

fn test_rectangles_can_be_of_different_sizes() {
	strings := [
		'+------+----+',
		'|      |    |',
		'+---+--+    |',
		'|   |       |',
		'+---+-------+',
	]
	assert rectangles(strings) == 3
}

fn test_corner_is_required_for_a_rectangle_to_be_complete() {
	strings := [
		'+------+----+',
		'|      |    |',
		'+------+    |',
		'|   |       |',
		'+---+-------+',
	]
	assert rectangles(strings) == 2
}

fn test_large_input_with_many_rectangles() {
	strings := [
		'+---+--+----+',
		'|   +--+----+',
		'+---+--+    |',
		'|   +--+----+',
		'+---+--+--+-+',
		'+---+--+--+-+',
		'+------+  | |',
		'          +-+',
	]
	assert rectangles(strings) == 60
}

fn test_rectangles_must_have_four_sides() {
	strings := [
		'+-+ +-+',
		'| | | |',
		'+-+-+-+',
		'  | |  ',
		'+-+-+-+',
		'| | | |',
		'+-+ +-+',
	]
	assert rectangles(strings) == 5
}
