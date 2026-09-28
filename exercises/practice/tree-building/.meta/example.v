module main

// The errors `build_tree` reports for a set of records that cannot describe a
// tree.
const invalid_order_error = 'record id is invalid or out of order'
const invalid_parent_error = 'node parent_id should be smaller than its record_id'

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
fn build_tree(records []Record) ![]Node {
	if records.len == 0 {
		return []Node{}
	}
	ordered := order_records(records)!
	check_parents(ordered)!
	mut children := map[int][]int{}
	// The record with the id 0 is the root, it is the child of nobody.
	for record in ordered[1..] {
		mut siblings := children[record.parent_id] or { []int{} }
		siblings << record.record_id
		children[record.parent_id] = siblings
	}
	return [node_of(children, ordered[0].record_id)]
}

// order_records returns the records indexed by their `record_id` after making
// sure that the ids are the ones a tree is numbered with: from 0 to
// `records.len - 1`, each of them used by exactly one record.
fn order_records(records []Record) ![]Record {
	mut seen := []bool{len: records.len, init: false}
	mut ordered := []Record{len: records.len, init: Record{}}
	for record in records {
		if record.record_id < 0 || record.record_id >= records.len {
			return error(invalid_order_error)
		}
		if seen[record.record_id] {
			return error(invalid_order_error)
		}
		seen[record.record_id] = true
		ordered[record.record_id] = record
	}
	return ordered
}

// check_parents makes sure that the records can be linked into a tree: the
// record with the id 0 is the root and is its own parent, every other record
// points at a record with a smaller id.
fn check_parents(records []Record) ! {
	for record in records {
		if record.record_id == record.parent_id {
			// A record that is its own parent is a root, and the first record
			// of a tree is the only one that may be a root.
			if record.record_id != 0 {
				return error(invalid_order_error)
			}
		} else if record.parent_id > record.record_id {
			return error(invalid_parent_error)
		}
	}
}

// node_of builds the node with `id` and, recursively, all of its descendants.
fn node_of(children map[int][]int, id int) Node {
	mut node := Node{
		id: id
	}
	for child_id in children[id] or { []int{} } {
		node.children << node_of(children, child_id)
	}
	return node
}
