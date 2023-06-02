module main

fn test_no_rows() {
	minefield := []string{}
	expected := []string{}
	assert annotate(minefield) == expected
}

fn test_no_columns() {
	minefield := [
		'',
	]
	expected := [
		'',
	]
	assert annotate(minefield) == expected
}

fn test_no_mines() {
	minefield := [
		'   ',
		'   ',
		'   ',
	]
	expected := [
		'   ',
		'   ',
		'   ',
	]
	assert annotate(minefield) == expected
}

fn test_minefield_with_only_mines() {
	minefield := [
		'***',
		'***',
		'***',
	]
	expected := [
		'***',
		'***',
		'***',
	]
	assert annotate(minefield) == expected
}

fn test_mine_surrounded_by_spaces() {
	minefield := [
		'   ',
		' * ',
		'   ',
	]
	expected := [
		'111',
		'1*1',
		'111',
	]
	assert annotate(minefield) == expected
}

fn test_space_surrounded_by_mines() {
	minefield := [
		'***',
		'* *',
		'***',
	]
	expected := [
		'***',
		'*8*',
		'***',
	]
	assert annotate(minefield) == expected
}

fn test_horizontal_line() {
	minefield := [
		' * * ',
	]
	expected := [
		'1*2*1',
	]
	assert annotate(minefield) == expected
}

fn test_horizontal_line_mines_at_edges() {
	minefield := [
		'*   *',
	]
	expected := [
		'*1 1*',
	]
	assert annotate(minefield) == expected
}

fn test_vertical_line() {
	minefield := [
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
	assert annotate(minefield) == expected
}

fn test_vertical_line_mines_at_edges() {
	minefield := [
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
	assert annotate(minefield) == expected
}

fn test_cross() {
	minefield := [
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
	assert annotate(minefield) == expected
}

fn test_large_minefield() {
	minefield := [
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
	assert annotate(minefield) == expected
}
