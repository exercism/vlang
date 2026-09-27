module main

// assert_forest fails unless the tree that `build_tree` returned has exactly
// the shape of the expected one.
fn assert_forest(actual []Node, expected []Node) {
	assert actual.len == expected.len, 'expected ${expected.len} root(s), got ${actual.len}'
	for index, node in actual {
		assert_node(node, expected[index])
	}
}

fn assert_node(actual Node, expected Node) {
	assert actual.id == expected.id, 'expected node ${expected.id}, got node ${actual.id}'
	assert actual.children.len == expected.children.len, 'node ${expected.id}: expected ${expected.children.len} child(ren), got ${actual.children.len}'
	for index, child in actual.children {
		assert_node(child, expected.children[index])
	}
}

fn test_empty_list() {
	forest := build_tree([])!
	assert_forest(forest, [])
}

fn test_single_record() {
	records := [
		Record{ record_id: 0, parent_id: 0 },
	]
	expected := [
		Node{
			id: 0
		},
	]
	assert_forest(build_tree(records)!, expected)
}

fn test_three_records_in_order() {
	records := [
		Record{ record_id: 0, parent_id: 0 },
		Record{ record_id: 1, parent_id: 0 },
		Record{ record_id: 2, parent_id: 0 },
	]
	expected := [
		Node{
			id:       0
			children: [Node{ id: 1 }, Node{ id: 2 }]
		},
	]
	assert_forest(build_tree(records)!, expected)
}

fn test_three_records_in_reverse_order() {
	records := [
		Record{ record_id: 2, parent_id: 0 },
		Record{ record_id: 1, parent_id: 0 },
		Record{ record_id: 0, parent_id: 0 },
	]
	expected := [
		Node{
			id:       0
			children: [Node{ id: 1 }, Node{ id: 2 }]
		},
	]
	assert_forest(build_tree(records)!, expected)
}

fn test_more_than_two_children() {
	records := [
		Record{ record_id: 0, parent_id: 0 },
		Record{ record_id: 1, parent_id: 0 },
		Record{ record_id: 2, parent_id: 0 },
		Record{ record_id: 3, parent_id: 0 },
	]
	expected := [
		Node{
			id:       0
			children: [Node{ id: 1 }, Node{ id: 2 }, Node{ id: 3 }]
		},
	]
	assert_forest(build_tree(records)!, expected)
}

fn test_binary_tree() {
	records := [
		Record{ record_id: 5, parent_id: 1 },
		Record{ record_id: 3, parent_id: 2 },
		Record{ record_id: 2, parent_id: 0 },
		Record{ record_id: 4, parent_id: 1 },
		Record{ record_id: 1, parent_id: 0 },
		Record{ record_id: 0, parent_id: 0 },
		Record{ record_id: 6, parent_id: 2 },
	]
	expected := [
		Node{
			id:       0
			children: [
				Node{
					id:       1
					children: [Node{ id: 4 }, Node{ id: 5 }]
				},
				Node{
					id:       2
					children: [Node{ id: 3 }, Node{ id: 6 }]
				},
			]
		},
	]
	assert_forest(build_tree(records)!, expected)
}

fn test_unbalanced_tree() {
	records := [
		Record{ record_id: 5, parent_id: 2 },
		Record{ record_id: 3, parent_id: 2 },
		Record{ record_id: 2, parent_id: 0 },
		Record{ record_id: 4, parent_id: 1 },
		Record{ record_id: 1, parent_id: 0 },
		Record{ record_id: 0, parent_id: 0 },
		Record{ record_id: 6, parent_id: 2 },
	]
	expected := [
		Node{
			id:       0
			children: [
				Node{
					id:       1
					children: [Node{ id: 4 }]
				},
				Node{
					id:       2
					children: [Node{ id: 3 }, Node{ id: 5 }, Node{ id: 6 }]
				},
			]
		},
	]
	assert_forest(build_tree(records)!, expected)
}

fn test_one_root_node_and_has_parent() {
	records := [
		Record{ record_id: 0, parent_id: 1 },
	]
	if forest := build_tree(records) {
		assert false, 'a root with a parent should return an error, got ${forest.len} root(s)'
	} else {
		assert err.msg() == 'node parent_id should be smaller than its record_id'
	}
}

fn test_root_node_has_parent() {
	records := [
		Record{ record_id: 0, parent_id: 1 },
		Record{ record_id: 1, parent_id: 0 },
	]
	if forest := build_tree(records) {
		assert false, 'a root with a parent should return an error, got ${forest.len} root(s)'
	} else {
		assert err.msg() == 'node parent_id should be smaller than its record_id'
	}
}

fn test_no_root_node() {
	records := [
		Record{ record_id: 1, parent_id: 0 },
		Record{ record_id: 2, parent_id: 0 },
	]
	if forest := build_tree(records) {
		assert false, 'records without a root should return an error, got ${forest.len} root(s)'
	} else {
		assert err.msg() == 'record id is invalid or out of order'
	}
}

fn test_duplicate_node() {
	records := [
		Record{ record_id: 0, parent_id: 0 },
		Record{ record_id: 1, parent_id: 0 },
		Record{ record_id: 1, parent_id: 0 },
	]
	if forest := build_tree(records) {
		assert false, 'a duplicated id should return an error, got ${forest.len} root(s)'
	} else {
		assert err.msg() == 'record id is invalid or out of order'
	}
}

fn test_duplicate_root() {
	records := [
		Record{ record_id: 0, parent_id: 0 },
		Record{ record_id: 0, parent_id: 0 },
	]
	if forest := build_tree(records) {
		assert false, 'a duplicated root should return an error, got ${forest.len} root(s)'
	} else {
		assert err.msg() == 'record id is invalid or out of order'
	}
}

fn test_non_continuous() {
	records := [
		Record{ record_id: 2, parent_id: 0 },
		Record{ record_id: 4, parent_id: 2 },
		Record{ record_id: 1, parent_id: 0 },
		Record{ record_id: 0, parent_id: 0 },
	]
	if forest := build_tree(records) {
		assert false, 'a gap in the ids should return an error, got ${forest.len} root(s)'
	} else {
		assert err.msg() == 'record id is invalid or out of order'
	}
}

fn test_cycle_directly() {
	records := [
		Record{ record_id: 5, parent_id: 2 },
		Record{ record_id: 3, parent_id: 2 },
		Record{ record_id: 2, parent_id: 2 },
		Record{ record_id: 4, parent_id: 1 },
		Record{ record_id: 1, parent_id: 0 },
		Record{ record_id: 0, parent_id: 0 },
		Record{ record_id: 6, parent_id: 3 },
	]
	if forest := build_tree(records) {
		assert false, 'a second root should return an error, got ${forest.len} root(s)'
	} else {
		assert err.msg() == 'record id is invalid or out of order'
	}
}

fn test_cycle_indirectly() {
	records := [
		Record{ record_id: 5, parent_id: 2 },
		Record{ record_id: 3, parent_id: 2 },
		Record{ record_id: 2, parent_id: 6 },
		Record{ record_id: 4, parent_id: 1 },
		Record{ record_id: 1, parent_id: 0 },
		Record{ record_id: 0, parent_id: 0 },
		Record{ record_id: 6, parent_id: 3 },
	]
	if forest := build_tree(records) {
		assert false, 'a parent with a higher id should return an error, got ${forest.len} root(s)'
	} else {
		assert err.msg() == 'node parent_id should be smaller than its record_id'
	}
}

fn test_higher_id_parent_of_lower_id() {
	records := [
		Record{ record_id: 0, parent_id: 0 },
		Record{ record_id: 2, parent_id: 0 },
		Record{ record_id: 1, parent_id: 2 },
	]
	if forest := build_tree(records) {
		assert false, 'a parent with a higher id should return an error, got ${forest.len} root(s)'
	} else {
		assert err.msg() == 'node parent_id should be smaller than its record_id'
	}
}
