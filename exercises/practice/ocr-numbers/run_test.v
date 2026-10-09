module main

fn test_recognizes_0() {
	rows := [
		' _ ',
		'| |',
		'|_|',
		'   ',
	]
	if res := convert(rows) {
		assert res == '0'
	} else {
		assert false, 'convert(rows) should not return an error'
	}
}

fn test_recognizes_1() {
	rows := [
		'   ',
		'  |',
		'  |',
		'   ',
	]
	if res := convert(rows) {
		assert res == '1'
	} else {
		assert false, 'convert(rows) should not return an error'
	}
}

fn test_unreadable_but_correctly_sized_inputs_return_question_mark() {
	rows := [
		'   ',
		'  _',
		'  |',
		'   ',
	]
	if res := convert(rows) {
		assert res == '?'
	} else {
		assert false, 'convert(rows) should not return an error'
	}
}

fn test_input_with_a_number_of_lines_that_is_not_a_multiple_of_four_raises_an_error() {
	rows := [
		' _ ',
		'| |',
		'   ',
	]
	if res := convert(rows) {
		assert false, 'convert(rows) should return an error'
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
		assert false, 'convert(rows) should return an error'
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
	if res := convert(rows) {
		assert res == '110101100'
	} else {
		assert false, 'convert(rows) should not return an error'
	}
}

fn test_garbled_numbers_in_a_string_are_replaced_with_question_mark() {
	rows := [
		'       _     _           _ ',
		'  |  || |  || |     || || |',
		'  |  | _|  ||_|  |  ||_||_|',
		'                           ',
	]
	if res := convert(rows) {
		assert res == '11?10?1?0'
	} else {
		assert false, 'convert(rows) should not return an error'
	}
}

fn test_recognizes_2() {
	rows := [
		' _ ',
		' _|',
		'|_ ',
		'   ',
	]
	if res := convert(rows) {
		assert res == '2'
	} else {
		assert false, 'convert(rows) should not return an error'
	}
}

fn test_recognizes_3() {
	rows := [
		' _ ',
		' _|',
		' _|',
		'   ',
	]
	if res := convert(rows) {
		assert res == '3'
	} else {
		assert false, 'convert(rows) should not return an error'
	}
}

fn test_recognizes_4() {
	rows := [
		'   ',
		'|_|',
		'  |',
		'   ',
	]
	if res := convert(rows) {
		assert res == '4'
	} else {
		assert false, 'convert(rows) should not return an error'
	}
}

fn test_recognizes_5() {
	rows := [
		' _ ',
		'|_ ',
		' _|',
		'   ',
	]
	if res := convert(rows) {
		assert res == '5'
	} else {
		assert false, 'convert(rows) should not return an error'
	}
}

fn test_recognizes_6() {
	rows := [
		' _ ',
		'|_ ',
		'|_|',
		'   ',
	]
	if res := convert(rows) {
		assert res == '6'
	} else {
		assert false, 'convert(rows) should not return an error'
	}
}

fn test_recognizes_7() {
	rows := [
		' _ ',
		'  |',
		'  |',
		'   ',
	]
	if res := convert(rows) {
		assert res == '7'
	} else {
		assert false, 'convert(rows) should not return an error'
	}
}

fn test_recognizes_8() {
	rows := [
		' _ ',
		'|_|',
		'|_|',
		'   ',
	]
	if res := convert(rows) {
		assert res == '8'
	} else {
		assert false, 'convert(rows) should not return an error'
	}
}

fn test_recognizes_9() {
	rows := [
		' _ ',
		'|_|',
		' _|',
		'   ',
	]
	if res := convert(rows) {
		assert res == '9'
	} else {
		assert false, 'convert(rows) should not return an error'
	}
}

fn test_recognizes_string_of_decimal_numbers() {
	rows := [
		'    _  _     _  _  _  _  _  _ ',
		'  | _| _||_||_ |_   ||_||_|| |',
		'  ||_  _|  | _||_|  ||_| _||_|',
		'                              ',
	]
	if res := convert(rows) {
		assert res == '1234567890'
	} else {
		assert false, 'convert(rows) should not return an error'
	}
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
	if res := convert(rows) {
		assert res == '123,456,789'
	} else {
		assert false, 'convert(rows) should not return an error'
	}
}
