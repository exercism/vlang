module main

fn test_empty_string() {
	lines := []string{}
	expect := []string{}
	assert transpose(lines) == expect
}

fn test_two_characters_in_a_row() {
	lines := [
		'A1',
	]
	expect := [
		'A',
		'1',
	]
	assert transpose(lines) == expect
}

fn test_two_characters_in_a_column() {
	lines := [
		'A',
		'1',
	]
	expect := [
		'A1',
	]
	assert transpose(lines) == expect
}

fn test_simple() {
	lines := [
		'ABC',
		'123',
	]
	expect := [
		'A1',
		'B2',
		'C3',
	]
	assert transpose(lines) == expect
}

fn test_single_line() {
	lines := [
		'Single line.',
	]
	expect := [
		'S',
		'i',
		'n',
		'g',
		'l',
		'e',
		' ',
		'l',
		'i',
		'n',
		'e',
		'.',
	]
	assert transpose(lines) == expect
}

fn test_first_line_longer_than_second_line() {
	lines := [
		'The fourth line.',
		'The fifth line.',
	]
	expect := [
		'TT',
		'hh',
		'ee',
		'  ',
		'ff',
		'oi',
		'uf',
		'rt',
		'th',
		'h ',
		' l',
		'li',
		'in',
		'ne',
		'e.',
		'.',
	]
	assert transpose(lines) == expect
}

fn test_second_line_longer_than_first_line() {
	lines := [
		'The first line.',
		'The second line.',
	]
	expect := [
		'TT',
		'hh',
		'ee',
		'  ',
		'fs',
		'ie',
		'rc',
		'so',
		'tn',
		' d',
		'l ',
		'il',
		'ni',
		'en',
		'.e',
		' .',
	]
	assert transpose(lines) == expect
}

fn test_mixed_line_length() {
	lines := [
		'The longest line.',
		'A long line.',
		'A longer line.',
		'A line.',
	]
	expect := [
		'TAAA',
		'h   ',
		'elll',
		' ooi',
		'lnnn',
		'ogge',
		'n e.',
		'glr',
		'ei ',
		'snl',
		'tei',
		' .n',
		'l e',
		'i .',
		'n',
		'e',
		'.',
	]
	assert transpose(lines) == expect
}

fn test_square() {
	lines := [
		'HEART',
		'EMBER',
		'ABUSE',
		'RESIN',
		'TREND',
	]
	expect := [
		'HEART',
		'EMBER',
		'ABUSE',
		'RESIN',
		'TREND',
	]
	assert transpose(lines) == expect
}

fn test_rectangle() {
	lines := [
		'FRACTURE',
		'OUTLINED',
		'BLOOMING',
		'SEPTETTE',
	]
	expect := [
		'FOBS',
		'RULE',
		'ATOP',
		'CLOT',
		'TIME',
		'UNIT',
		'RENT',
		'EDGE',
	]
	assert transpose(lines) == expect
}

fn test_triangle() {
	lines := [
		'T',
		'EE',
		'AAA',
		'SSSS',
		'EEEEE',
		'RRRRRR',
	]
	expect := [
		'TEASER',
		' EASER',
		'  ASER',
		'   SER',
		'    ER',
		'     R',
	]
	assert transpose(lines) == expect
}

fn test_jagged_triangle() {
	lines := [
		'11',
		'2',
		'3333',
		'444',
		'555555',
		'66666',
	]
	expect := [
		'123456',
		'1 3456',
		'  3456',
		'  3 56',
		'    56',
		'    5',
	]
	assert transpose(lines) == expect
}
