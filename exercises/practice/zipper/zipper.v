module main

// An absent node of a binary tree, spelled `null` in the exercise data.
struct Empty {}

// A node of a binary tree: a value plus its two subtrees.
struct Branch {
	value int
	left  Tree
	right Tree
}

// A binary tree: either an absent node (`Empty`) or a real node (`Branch`).
type Tree = Empty | Branch

// The child of a parent node that a zipper step descended into.
enum Side {
	left
	right
}

// One remembered parent on a zipper path: the value of the parent, the side
// the focus was reached through, and the sibling subtree that was skipped.
struct Step {
	side    Side
	value   int
	sibling Tree
}

// A zipper is a focus node together with the path from the root of the tree
// to that node.
struct Zipper {
	focus Branch
	path  []Step
}

// Put a zipper around `tree` with the focus on its root node. A zipper always
// focuses on a real node, so the tree given here must have a root.
fn from_tree(tree Branch) Zipper {
}

// Rebuild the whole tree around the focus, closing the zipper.
fn (z Zipper) to_tree() Tree {
}

// The value of the focus node.
fn (z Zipper) value() int {
}

// Move the focus to the left child of the focus node, or fail when the focus
// has no left child.
fn (z Zipper) left() !Zipper {
}

// Move the focus to the right child of the focus node, or fail when the focus
// has no right child.
fn (z Zipper) right() !Zipper {
}

// Move the focus to the parent of the focus node, or fail when the focus
// already is the root.
fn (z Zipper) up() !Zipper {
}

// A new zipper whose focus carries `value` as its value.
fn (z Zipper) set_value(value int) Zipper {
}

// A new zipper whose focus carries `tree` as its left subtree. Use `Empty{}`
// to make the left subtree absent.
fn (z Zipper) set_left(tree Tree) Zipper {
}

// A new zipper whose focus carries `tree` as its right subtree. Use `Empty{}`
// to make the right subtree absent.
fn (z Zipper) set_right(tree Tree) Zipper {
}
