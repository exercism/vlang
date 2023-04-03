module main

struct LinkedList {
	// define your data structure here
mut:
	len int // maintain the number of elements in the list in this field
}

fn new() LinkedList {

}

fn from_array(array []int) LinkedList {

}

fn (list LinkedList) is_empty() bool {

}

fn (mut list LinkedList) push(data int) {

}

fn (mut list LinkedList) pop() ?int {

}

fn (list LinkedList) peek() ?int {

}

fn (list LinkedList) to_array() []int {

}

fn (list LinkedList) reverse() LinkedList {

}
