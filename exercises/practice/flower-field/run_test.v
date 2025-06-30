module main

fn test_no_rows() {
	garden := []string{}
	expected := []string{}
	assert annotate(garden) == expected
}

fn test_no_columns() {
	garden := [
		'',
	]
	expected := [
		'',
	]
	assert annotate(garden) == expected
}

fn test_no_flowers() {
	garden := [
		'   ',
		'   ',
		'   ',
	]
	expected := [
		'   ',
		'   ',
		'   ',
	]
	assert annotate(garden) == expected
}

fn test_garden_full_of_flowers() {
	garden := [
		'***',
		'***',
		'***',
	]
	expected := [
		'***',
		'***',
		'***',
	]
	assert annotate(garden) == expected
}

fn test_flower_surrounded_by_spaces() {
	garden := [
		'   ',
		' * ',
		'   ',
	]
	expected := [
		'111',
		'1*1',
		'111',
	]
	assert annotate(garden) == expected
}

fn test_space_surrounded_by_flowers() {
	garden := [
		'***',
		'* *',
		'***',
	]
	expected := [
		'***',
		'*8*',
		'***',
	]
	assert annotate(garden) == expected
}

fn test_horizontal_line() {
	garden := [
		' * * ',
	]
	expected := [
		'1*2*1',
	]
	assert annotate(garden) == expected
}

fn test_horizontal_line_flowers_at_edges() {
	garden := [
		'*   *',
	]
	expected := [
		'*1 1*',
	]
	assert annotate(garden) == expected
}

fn test_vertical_line() {
	garden := [
		' ',
		'*',
		' ',
		'*',
		' ',
	]
	expected := [
		'1',
		'*',
		'2',
		'*',
		'1',
	]
	assert annotate(garden) == expected
}

fn test_vertical_line_flowers_at_edges() {
	garden := [
		'*',
		' ',
		' ',
		' ',
		'*',
	]
	expected := [
		'*',
		'1',
		' ',
		'1',
		'*',
	]
	assert annotate(garden) == expected
}

fn test_cross() {
	garden := [
		'  *  ',
		'  *  ',
		'*****',
		'  *  ',
		'  *  ',
	]
	expected := [
		' 2*2 ',
		'25*52',
		'*****',
		'25*52',
		' 2*2 ',
	]
	assert annotate(garden) == expected
}

fn test_large_garden() {
	garden := [
		' *  * ',
		'  *   ',
		'    * ',
		'   * *',
		' *  * ',
		'      ',
	]
	expected := [
		'1*22*1',
		'12*322',
		' 123*2',
		'112*4*',
		'1*22*2',
		'111111',
	]
	assert annotate(garden) == expected
}
