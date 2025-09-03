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
	return Node{
		data:  data
		left:  Empty{}
		right: Empty{}
	}
}

pub fn (mut n Node) insert(data int) {
	if data <= n.data {
		mut l := n.left
		if mut l is Node {
			l.insert(data)
		} else {
			n.left = Node.new(data)
		}
	} else {
		mut r := n.right
		if mut r is Node {
			r.insert(data)
		} else {
			n.right = Node.new(data)
		}
	}
}

fn populate(mut buffer []int, tree Tree) {
	match tree {
		Empty {}
		Node {
			populate(mut buffer, tree.left)
			buffer << tree.data
			populate(mut buffer, tree.right)
		}
	}
}

pub fn sorted_data(t Tree) []int {
	mut result := []int{}
	populate(mut result, t)
	return result
}
