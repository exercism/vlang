module main

struct Empty {}

struct Node {
	data int
mut:
	left  Tree
	right Tree
}

type Tree = Empty | Node

pub fn Node.new(data int) Node {
}

pub fn (mut n Node) insert(data int) {
}

pub fn sorted_data(t Tree) []int {
}
