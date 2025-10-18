module main

fn test_recognizes_0() {
	rows := [
		' _ ',
		'| |',
		'|_|',
		'   ',
	]
	assert convert(rows)! == '0'
}

fn test_recognizes_1() {
	rows := [
		'   ',
		'  |',
		'  |',
		'   ',
	]
	assert convert(rows)! == '1'
}

fn test_unreadable_but_correctly_sized_inputs_return_question_mark() {
	rows := [
		'   ',
		'  _',
		'  |',
		'   ',
	]
	assert convert(rows)! == '?'
}

fn test_input_with_a_number_of_lines_that_is_not_a_multiple_of_four_raises_an_error() {
	rows := [
		' _ ',
		'| |',
		'   ',
	]
	if res := convert(rows) {
		assert false, 'Input with a number of lines that not a multiple of four raises an error should return an error'
	} else {
		assert err.msg() == 'Number of input lines is not a multiple of four'
	}
}

fn test_input_with_a_number_of_columns_that_is_not_a_multiple_of_three_raises_an_error() {
	rows := [
		'    ',
		'   |',
		'   |',
		'    ',
	]
	if res := convert(rows) {
		assert false, 'Input with a number of columns that not a multiple of three raises an error should return an error'
	} else {
		assert err.msg() == 'Number of input columns is not a multiple of three'
	}
}

fn test_recognizes_110101100() {
	rows := [
		'       _     _        _  _ ',
		'  |  || |  || |  |  || || |',
		'  |  ||_|  ||_|  |  ||_||_|',
		'                           ',
	]
	assert convert(rows)! == '110101100'
}

fn test_garbled_numbers_in_a_string_are_replaced_with_question_mark() {
	rows := [
		'       _     _           _ ',
		'  |  || |  || |     || || |',
		'  |  | _|  ||_|  |  ||_||_|',
		'                           ',
	]
	assert convert(rows)! == '11?10?1?0'
}

fn test_recognizes_2() {
	rows := [
		' _ ',
		' _|',
		'|_ ',
		'   ',
	]
	assert convert(rows)! == '2'
}

fn test_recognizes_3() {
	rows := [
		' _ ',
		' _|',
		' _|',
		'   ',
	]
	assert convert(rows)! == '3'
}

fn test_recognizes_4() {
	rows := [
		'   ',
		'|_|',
		'  |',
		'   ',
	]
	assert convert(rows)! == '4'
}

fn test_recognizes_5() {
	rows := [
		' _ ',
		'|_ ',
		' _|',
		'   ',
	]
	assert convert(rows)! == '5'
}

fn test_recognizes_6() {
	rows := [
		' _ ',
		'|_ ',
		'|_|',
		'   ',
	]
	assert convert(rows)! == '6'
}

fn test_recognizes_7() {
	rows := [
		' _ ',
		'  |',
		'  |',
		'   ',
	]
	assert convert(rows)! == '7'
}

fn test_recognizes_8() {
	rows := [
		' _ ',
		'|_|',
		'|_|',
		'   ',
	]
	assert convert(rows)! == '8'
}

fn test_recognizes_9() {
	rows := [
		' _ ',
		'|_|',
		' _|',
		'   ',
	]
	assert convert(rows)! == '9'
}

fn test_recognizes_string_of_decimal_numbers() {
	rows := [
		'    _  _     _  _  _  _  _  _ ',
		'  | _| _||_||_ |_   ||_||_|| |',
		'  ||_  _|  | _||_|  ||_| _||_|',
		'                              ',
	]
	assert convert(rows)! == '1234567890'
}

fn test_numbers_separated_by_empty_lines_are_recognized_lines_are_joined_by_commas() {
	rows := [
		'    _  _ ',
		'  | _| _|',
		'  ||_  _|',
		'         ',
		'    _  _ ',
		'|_||_ |_ ',
		'  | _||_|',
		'         ',
		' _  _  _ ',
		'  ||_||_|',
		'  ||_| _|',
		'         ',
	]
	assert convert(rows)! == '123,456,789'
}
