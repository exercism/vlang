module main

// branch builds a tree node with `value` and the given subtrees.
fn branch(value int, left Tree, right Tree) Tree {
	return Branch{
		value: value
		left:  left
		right: right
	}
}

// leaf builds a node without subtrees.
fn leaf(value int) Tree {
	return branch(value, Empty{}, Empty{})
}

// initial_tree is the tree that every test starts from:
//
//            1
//          /   \
//         2     4
//          \
//           3
//
// It is a whole `Tree` so that it can be compared with `to_tree`.
fn initial_tree() Tree {
	return branch(1, branch(2, Empty{}, leaf(3)), leaf(4))
}

// initial_root is the root node of initial_tree, which is what a zipper is
// built from.
fn initial_root() Branch {
	return Branch{
		value: 1
		left:  Branch{
			value: 2
			left:  Empty{}
			right: leaf(3)
		}
		right: leaf(4)
	}
}

// has_left_child reports whether the focus of `z` can be moved to a left child.
fn has_left_child(z Zipper) bool {
	z.left() or { return false }
	return true
}

// has_parent reports whether the focus of `z` can be moved to its parent.
fn has_parent(z Zipper) bool {
	z.up() or { return false }
	return true
}

fn test_data_is_retained() {
	assert from_tree(initial_root()).to_tree() == initial_tree()
}

fn test_left_right_and_value() {
	focus := from_tree(initial_root())
	assert focus.left()!.right()!.value() == 3
}

fn test_dead_end() {
	// Node 2 is a leaf on its left, so there is nothing left to focus on.
	focus := from_tree(initial_root()).left()!
	assert !has_left_child(focus)
}

fn test_tree_from_deep_focus() {
	assert from_tree(initial_root()).left()!.right()!.to_tree() == initial_tree()
}

fn test_traversing_up_from_top() {
	assert !has_parent(from_tree(initial_root()))
}

fn test_left_right_and_up() {
	focus := from_tree(initial_root())
	assert focus.left()!.up()!.right()!.up()!.left()!.right()!.value() == 3
}

fn test_descend_multiple_levels_and_return() {
	focus := from_tree(initial_root()).left()!.right()!
	assert focus.up()!.up()!.value() == 1
}

fn test_set_value() {
	changed := from_tree(initial_root()).left()!.set_value(5)
	assert changed.to_tree() == branch(1, branch(5, Empty{}, leaf(3)), leaf(4))
}

fn test_set_value_after_traversing_up() {
	parent := from_tree(initial_root()).left()!.right()!.up()!
	expected := branch(1, branch(5, Empty{}, leaf(3)), leaf(4))
	assert parent.set_value(5).to_tree() == expected
}

fn test_set_left_with_leaf() {
	changed := from_tree(initial_root()).left()!.set_left(leaf(5))
	expected := branch(1, branch(2, leaf(5), leaf(3)), leaf(4))
	assert changed.to_tree() == expected
}

fn test_set_right_with_null() {
	changed := from_tree(initial_root()).left()!.set_right(Empty{})
	expected := branch(1, branch(2, Empty{}, Empty{}), leaf(4))
	assert changed.to_tree() == expected
}

fn test_set_right_with_subtree() {
	subtree := branch(6, leaf(7), leaf(8))
	changed := from_tree(initial_root()).set_right(subtree)
	expected := branch(1, branch(2, Empty{}, leaf(3)), subtree)
	assert changed.to_tree() == expected
}

fn test_set_value_on_deep_focus() {
	changed := from_tree(initial_root()).left()!.right()!.set_value(5)
	expected := branch(1, branch(2, Empty{}, leaf(5)), leaf(4))
	assert changed.to_tree() == expected
}

fn test_different_paths_to_same_zipper() {
	root := initial_root()
	// Taking the long way round must rebuild the path exactly, so that both
	// zippers focus node 4 of the same tree.
	detoured := from_tree(root).left()!.up()!.right()!
	direct := from_tree(root).right()!
	assert detoured == direct
}
