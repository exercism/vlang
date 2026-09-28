module main

// Returns the message of the error that stopped `encoded` from being parsed,
// or a placeholder when it parsed after all.
fn parse_failure(encoded string) string {
	mut message := 'parsing unexpectedly succeeded'
	parse(encoded) or { message = err.msg() }
	return message
}

fn test_empty_input() {
	assert parse_failure('') == 'tree missing'
}

fn test_tree_with_no_nodes() {
	assert parse_failure('()') == 'tree with no nodes'
}

fn test_node_without_tree() {
	assert parse_failure(';') == 'tree missing'
}

fn test_node_without_properties() {
	tree := parse('(;)')!
	assert tree.properties.len == 0
	assert tree.children.len == 0
}

fn test_single_node_tree() {
	tree := parse('(;A[B])')!
	assert tree.properties.len == 1
	assert (tree.value('A') or { '' }) == 'B'
	assert tree.values('A') == ['B']
	assert tree.children.len == 0
}

fn test_multiple_properties() {
	tree := parse('(;A[b]C[d])')!
	assert tree.properties.len == 2
	assert tree.values('A') == ['b']
	assert tree.values('C') == ['d']
	assert tree.children.len == 0
}

fn test_properties_without_delimiter() {
	assert parse_failure('(;A)') == 'properties without delimiter'
}

fn test_all_lowercase_property() {
	assert parse_failure('(;a[b])') == 'property must be in uppercase'
}

fn test_upper_and_lowercase_property() {
	assert parse_failure('(;Aa[b])') == 'property must be in uppercase'
}

fn test_two_nodes() {
	tree := parse('(;A[B];B[C])')!
	assert tree.values('A') == ['B']
	assert tree.children.len == 1
	child := tree.children[0]
	assert child.values('B') == ['C']
	assert child.children.len == 0
}

fn test_two_child_trees() {
	tree := parse('(;A[B](;B[C])(;C[D]))')!
	assert tree.values('A') == ['B']
	assert tree.children.len == 2
	first := tree.children[0]
	assert first.values('B') == ['C']
	assert first.values('C') == []
	assert first.children.len == 0
	second := tree.children[1]
	assert second.values('C') == ['D']
	assert second.values('B') == []
	assert second.children.len == 0
}

fn test_multiple_property_values() {
	tree := parse('(;A[b][c][d])')!
	assert tree.properties.len == 1
	assert tree.values('A') == ['b', 'c', 'd']
}

fn test_within_property_values_whitespace_characters_such_as_tab_are_converted_to_spaces() {
	tree := parse('(;A[hello\t\tworld])')!
	assert tree.values('A') == ['hello  world']
}

fn test_within_property_values_newlines_remain_as_newlines() {
	tree := parse('(;A[hello\n\nworld])')!
	assert tree.values('A') == ['hello\n\nworld']
}

fn test_escaped_closing_bracket_within_property_value_becomes_just_a_closing_bracket() {
	tree := parse('(;A[\\]])')!
	assert tree.values('A') == [']']
}

fn test_escaped_backslash_in_property_value_becomes_just_a_backslash() {
	tree := parse('(;A[\\\\])')!
	assert tree.values('A') == ['\\']
}

fn test_opening_bracket_within_property_value_doesnt_need_to_be_escaped() {
	tree := parse('(;A[x[y\\]z][foo]B[bar];C[baz])')!
	assert tree.properties.len == 2
	assert tree.values('A') == ['x[y]z', 'foo']
	assert tree.values('B') == ['bar']
	assert tree.children.len == 1
	assert tree.children[0].values('C') == ['baz']
}

fn test_semicolon_in_property_value_doesnt_need_to_be_escaped() {
	tree := parse('(;A[a;b][foo]B[bar];C[baz])')!
	assert tree.properties.len == 2
	assert tree.values('A') == ['a;b', 'foo']
	assert tree.values('B') == ['bar']
	assert tree.children.len == 1
	assert tree.children[0].values('C') == ['baz']
}

fn test_parentheses_in_property_value_dont_need_to_be_escaped() {
	tree := parse('(;A[x(y)z][foo]B[bar];C[baz])')!
	assert tree.properties.len == 2
	assert tree.values('A') == ['x(y)z', 'foo']
	assert tree.values('B') == ['bar']
	assert tree.children.len == 1
	assert tree.children[0].values('C') == ['baz']
}

fn test_escaped_tab_in_property_value_is_converted_to_space() {
	tree := parse('(;A[hello\\\tworld])')!
	assert tree.values('A') == ['hello world']
}

fn test_escaped_newline_in_property_value_is_converted_to_nothing_at_all() {
	tree := parse('(;A[hello\\\nworld])')!
	assert tree.values('A') == ['helloworld']
}

fn test_escaped_t_and_n_in_property_value_are_just_letters_not_whitespace() {
	tree := parse('(;A[\\t = t and \\n = n])')!
	assert tree.values('A') == ['t = t and n = n']
}

fn test_mixing_various_kinds_of_whitespace_and_escaped_characters_in_property_value() {
	tree := parse('(;A[\\]b\nc\\\nd\t\te\\\\ \\\n\\]])')!
	assert tree.values('A') == [']b\ncd  e\\ ]']
}
