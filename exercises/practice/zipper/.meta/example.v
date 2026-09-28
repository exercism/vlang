module main

// `Empty` is an absent node of a binary tree: it is how the exercise data
// spells `null`.
struct Empty {}

// `Branch` is a node of a binary tree: a value plus its two subtrees.
struct Branch {
	value int
	left  Tree
	right Tree
}

// `Tree` is a binary tree, either an `Empty` or a `Branch`.
type Tree = Empty | Branch

// `Side` names the child of a parent node that a zipper step descended into.
enum Side {
	left
	right
}

// `Step` is one remembered parent on a zipper path: the value of the parent,
// the side the focus was reached through, and the sibling subtree that was
// not descended into.
struct Step {
	side    Side
	value   int
	sibling Tree
}

// `Zipper` is a focus node together with the path that leads to it from the
// root of the tree it belongs to.
struct Zipper {
	focus Branch
	path  []Step
}

// from_tree puts a zipper around `tree` with the focus on its root node.
fn from_tree(tree Branch) Zipper {
	return Zipper{
		focus: tree
		path:  []Step{}
	}
}

// to_tree rebuilds the whole tree around the focus, closing the zipper.
fn (z Zipper) to_tree() Tree {
	mut result := Tree(z.focus)
	for i := z.path.len - 1; i >= 0; i-- {
		result = rejoin(result, z.path[i])
	}
	return result
}

// value is the value of the focus node.
fn (z Zipper) value() int {
	return z.focus.value
}

// left moves the focus to the left child of the focus node, or fails when the
// focus has no left child.
fn (z Zipper) left() !Zipper {
	return descend(z, .left)
}

// right moves the focus to the right child of the focus node, or fails when
// the focus has no right child.
fn (z Zipper) right() !Zipper {
	return descend(z, .right)
}

// up moves the focus to the parent of the focus node, or fails when the focus
// already is the root.
fn (z Zipper) up() !Zipper {
	if z.path.len == 0 {
		return error('the focus is already the root')
	}
	parent := z.path.len - 1
	mut path := z.path[..parent].clone()
	return Zipper{
		focus: rejoin(Tree(z.focus), z.path[parent])
		path:  path
	}
}

// set_value returns a zipper whose focus carries `value` as its value.
fn (z Zipper) set_value(value int) Zipper {
	mut path := z.path.clone()
	return Zipper{
		focus: Branch{
			value: value
			left:  z.focus.left
			right: z.focus.right
		}
		path:  path
	}
}

// set_left returns a zipper whose focus carries `tree` as its left subtree.
// Pass `Empty{}` to make the left subtree absent.
fn (z Zipper) set_left(tree Tree) Zipper {
	mut path := z.path.clone()
	return Zipper{
		focus: Branch{
			value: z.focus.value
			left:  tree
			right: z.focus.right
		}
		path:  path
	}
}

// set_right returns a zipper whose focus carries `tree` as its right subtree.
// Pass `Empty{}` to make the right subtree absent.
fn (z Zipper) set_right(tree Tree) Zipper {
	mut path := z.path.clone()
	return Zipper{
		focus: Branch{
			value: z.focus.value
			left:  z.focus.left
			right: tree
		}
		path:  path
	}
}

// descend moves the focus into the `side` child of the focus node, recording
// the node it left behind. It fails for an absent child.
fn descend(z Zipper, side Side) !Zipper {
	focus := z.focus
	child := if side == .left { focus.left } else { focus.right }
	match child {
		Empty { return error('the focus node has no such child') }
		Branch {
			sibling := if side == .left { focus.right } else { focus.left }
			mut path := z.path.clone()
			path << Step{
				side:    side
				value:   focus.value
				sibling: sibling
			}
			return Zipper{
				focus: child
				path:  path
			}
		}
	}
}

// rejoin puts the subtree `sub` back where `step` came from, returning the
// parent node with its value and both of its children restored.
fn rejoin(sub Tree, step Step) Branch {
	if step.side == .left {
		return Branch{
			value: step.value
			left:  sub
			right: step.sibling
		}
	}
	return Branch{
		value: step.value
		left:  step.sibling
		right: sub
	}
}
