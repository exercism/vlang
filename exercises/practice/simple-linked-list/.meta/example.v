module main

struct LinkedList {
mut:
	head &Node
	len  int
}

struct Node {
	data int
	next &Node
}

fn new() LinkedList {
	return LinkedList{head: unsafe { nil }, len: 0}
}

fn from_array(array []int) LinkedList {
	mut list := new()

	for element in array {
		list.push(element)
	}

	return list
}

fn (list LinkedList) is_empty() bool {
	return list.len == 0
}

fn (mut list LinkedList) push(data int) {
	node := &Node{data, list.head}
	list.head = node
	list.len += 1
}

fn (mut list LinkedList) pop() ?int {
	if list.len == 0 {
		return none
	}

	head_data := list.head.data

	list.head = list.head.next
	list.len -= 1

	return head_data
}

fn (list LinkedList) peek() ?int {
	if list.len == 0 {
		return none
	}

	return list.head.data
}

fn (list LinkedList) to_array() []int {
	mut array := []int{}
	mut aux_list := list

	for aux_list.len > 0 {
		if data := aux_list.pop() {
			array << data
		}
	}

	return array.reverse()
}

fn (list LinkedList) reverse() LinkedList {
	return from_array(list.to_array().reverse())
}
