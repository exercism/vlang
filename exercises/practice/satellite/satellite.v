module main

type Tree = Empty | Node

struct Empty {}

struct Node {
	left  &Tree = &Tree(Empty{})
	right &Tree = &Tree(Empty{})
	value rune
}

fn tree_from_traversals(preorder string, inorder string) !Tree {
}
