module main

// Record is one entry of the unsorted set of records a tree is rebuilt from.
struct Record {
	record_id int
	parent_id int
}

// Node is one node of a rebuilt tree.
struct Node {
	id int
mut:
	children []Node
}

// build_tree rebuilds the tree that `records` describe.
//
// The records are an unsorted set. `record_id` numbers them from 0 to
// `records.len - 1` and every one of those numbers has to be used exactly once.
// The record that is its own parent is the root of a tree, every other record
// is a child of the record with the id of its `parent_id`. The children of a
// record are ordered by their `record_id`.
//
// An empty set of records describes no tree at all, so an empty list of roots
// is returned for it.
//
// TODO: the whole job is done in this one function and in two passes over the
// TODO: records: the first pass numbers the nodes and the second one checks
// TODO: the parents and hangs the records below them. Then the finished tree
// TODO: is copied out of the linked nodes by `grow` afterwards. Give every step
// TODO: a function of its own with a name that says what the step does.
fn build_tree(records []Record) ![]Node {
	if records.len == 0 {
		return []Node{}
	}
	// TODO: `nodes`, `used` and `parents` are three arrays that are all
	// TODO: indexed by `record_id` and all have the same length. One array of
	// TODO: records indexed by `record_id` holds all three in a single place.
	mut nodes := []Node{len: records.len, init: Node{}}
	mut used := []bool{len: records.len, init: false}
	mut parents := []int{len: records.len, init: 0}
	// TODO: the records are counted out by hand with `i`. A `for record in
	// TODO: records` loop says what is being walked over.
	mut i := 0
	for i < records.len {
		record := records[i]
		// TODO: the same error message is written out three times in this
		// TODO: function and once more in the loop below. Give it a name next
		// TODO: to the top of the file.
		if record.record_id < 0 || record.record_id >= records.len {
			return error('record id is invalid or out of order')
		}
		if used[record.record_id] {
			return error('record id is invalid or out of order')
		}
		used[record.record_id] = true
		parents[record.record_id] = record.parent_id
		nodes[record.record_id] = Node{
			id: record.record_id
		}
		i++
	}
	// TODO: this pass walks the ids by hand again, this time in order, so
	// TODO: that the children of a record end up in the order of their ids.
	// TODO: Sorting or indexing the records once would carry that order into
	// TODO: this pass as well.
	mut id := 0
	for id < records.len {
		parent_id := parents[id]
		if id == parent_id {
			// A record that is its own parent is a root, and the first record
			// of a tree is the only one that may be a root.
			if id != 0 {
				return error('record id is invalid or out of order')
			}
		} else {
			if parent_id > id {
				return error('node parent_id should be smaller than its record_id')
			}
			nodes[parent_id].children << nodes[id]
		}
		id++
	}
	// TODO: the tree is not the linked `nodes` but a copy of it, so the node
	// TODO: with the id 0 is put back together by hand. Build the tree while
	// TODO: the records are linked and return the root directly.
	return [grow(nodes, 0)]
}

// grow copies the node with `id` out of the linked `nodes`, children and all.
fn grow(nodes []Node, id int) Node {
	mut node := Node{
		id: id
	}
	for child in nodes[id].children {
		node.children << grow(nodes, child.id)
	}
	return node
}
