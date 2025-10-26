module main

type Tree = Empty | Node

struct Empty {}

struct Node {
	left  Tree = Empty{}
	right Tree = Empty{}
	value rune
}

fn tree_from_traversals(preorder string, inorder string) !Tree {
	mut p := preorder.runes()
	mut i := inorder.runes()
	if p.len != i.len {
		return error('traversals must have the same length')
	}

	if p.len == 0 {
		return Empty{}
	}

	if repeats(p) || repeats(i) {
		return error('traversals must contain unique items')
	}

	return traverse(none, mut p, mut i)
}

fn repeats(r []rune) bool {
	for i in 1 .. (r.len) {
		for j in 0 .. i {
			if r[j] == r[i] {
				return true
			}
		}
	}
	return false
}

fn traverse(successor ?rune, mut preorder []rune, mut inorder []rune) !Tree {
	if s := successor {
		if inorder.len > 0 && inorder[0] == s {
			return Empty{}
		}
	}

	if preorder.len == 0 {
		return Empty{}
	}

	value := preorder[0]
	preorder = preorder[1..(preorder.len)].clone()

	left := traverse(value, mut preorder, mut inorder)!

	if inorder.len == 0 || inorder[0] != value {
		return error('traversals must have the same elements')
	}

	inorder = inorder[1..(inorder.len)].clone()

	right := traverse(successor, mut preorder, mut inorder)!

	return Node{left, right, value}
}
