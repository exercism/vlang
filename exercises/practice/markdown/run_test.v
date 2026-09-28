module main

fn test_parses_normal_text_as_a_paragraph() {
	md := 'This will be a paragraph'
	expected := [
		'p',
		'This will be a paragraph',
	]
	assert parse(md) == expected
}

fn test_parsing_italics() {
	md := '_This will be italic_'
	expected := [
		'p',
		'em',
		'This will be italic',
	]
	assert parse(md) == expected
}

fn test_parsing_bold_text() {
	md := '__This will be bold__'
	expected := [
		'p',
		'strong',
		'This will be bold',
	]
	assert parse(md) == expected
}

fn test_mixed_normal_italics_and_bold_text() {
	md := 'This will _be_ __mixed__'
	expected := [
		'p',
		'text',
		'This will ',
		'em',
		'be',
		'text',
		' ',
		'strong',
		'mixed',
	]
	assert parse(md) == expected
}

fn test_with_h1_header_level() {
	md := '# This will be an h1'
	expected := [
		'h1',
		'This will be an h1',
	]
	assert parse(md) == expected
}

fn test_with_h2_header_level() {
	md := '## This will be an h2'
	expected := [
		'h2',
		'This will be an h2',
	]
	assert parse(md) == expected
}

fn test_with_h3_header_level() {
	md := '### This will be an h3'
	expected := [
		'h3',
		'This will be an h3',
	]
	assert parse(md) == expected
}

fn test_with_h4_header_level() {
	md := '#### This will be an h4'
	expected := [
		'h4',
		'This will be an h4',
	]
	assert parse(md) == expected
}

fn test_with_h5_header_level() {
	md := '##### This will be an h5'
	expected := [
		'h5',
		'This will be an h5',
	]
	assert parse(md) == expected
}

fn test_with_h6_header_level() {
	md := '###### This will be an h6'
	expected := [
		'h6',
		'This will be an h6',
	]
	assert parse(md) == expected
}

fn test_h7_header_level_is_a_paragraph() {
	md := '####### This will not be an h7'
	expected := [
		'p',
		'####### This will not be an h7',
	]
	assert parse(md) == expected
}

fn test_unordered_lists() {
	md := '* Item 1\n* Item 2'
	expected := [
		'ul',
		'li',
		'Item 1',
		'li',
		'Item 2',
	]
	assert parse(md) == expected
}

fn test_with_a_little_bit_of_everything() {
	md := '# Header!\n* __Bold Item__\n* _Italic Item_'
	expected := [
		'h1',
		'Header!',
		'ul',
		'li',
		'strong',
		'Bold Item',
		'li',
		'em',
		'Italic Item',
	]
	assert parse(md) == expected
}

fn test_markdown_symbols_in_the_header_text_are_not_interpreted() {
	md := '# This is a header with # and * in the text'
	expected := [
		'h1',
		'This is a header with # and * in the text',
	]
	assert parse(md) == expected
}

fn test_markdown_symbols_in_the_list_item_text_are_not_interpreted() {
	md := '* Item 1 with a # in the text\n* Item 2 with * in the text'
	expected := [
		'ul',
		'li',
		'Item 1 with a # in the text',
		'li',
		'Item 2 with * in the text',
	]
	assert parse(md) == expected
}

fn test_markdown_symbols_in_the_paragraph_text_are_not_interpreted() {
	md := 'This is a paragraph with # and * in the text'
	expected := [
		'p',
		'This is a paragraph with # and * in the text',
	]
	assert parse(md) == expected
}

fn test_unordered_lists_close_properly_with_preceding_and_following_lines() {
	md := '# Start a list\n* Item 1\n* Item 2\nEnd a list'
	expected := [
		'h1',
		'Start a list',
		'ul',
		'li',
		'Item 1',
		'li',
		'Item 2',
		'p',
		'End a list',
	]
	assert parse(md) == expected
}
