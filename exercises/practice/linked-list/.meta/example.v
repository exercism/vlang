module main

struct Node {
	value int
mut:
	// Warning: see the following for discussion on nil pointer usage:
	// https://github.com/vlang/v/blob/master/doc/docs.md#structs-with-reference-fields
	// Ideally these would all be replaced with Option types, but this is not currently possible:
	// https://github.com/vlang/v/issues/17616
	prev &Node = unsafe { nil }
	next &Node = unsafe { nil }
}

struct LinkedList {
mut:
	head &Node = unsafe { nil }
	tail &Node = unsafe { nil }
}

pub fn (mut l LinkedList) push(value int) {
	node := &Node{
		value: value
		prev: l.tail
	}
	if l.head == unsafe { nil } {
		l.head = node
	} else {
		mut tail := l.tail
		tail.next = node
	}
	l.tail = node
}

pub fn (mut l LinkedList) pop() int {
	tail := l.tail
	if tail.prev == unsafe { nil } { // single element
		l.head = unsafe { nil }
		l.tail = unsafe { nil }
	} else { // multiple elements
		mut prev := tail.prev
		prev.next = unsafe { nil }
		l.tail = prev
	}
	return tail.value // tail can now be auto-freed
}

pub fn (mut l LinkedList) unshift(value int) {
	node := &Node{
		value: value
		next: l.head
	}
	if l.tail == unsafe { nil } {
		l.tail = node
	} else {
		mut head := l.head
		head.prev = node
	}
	l.head = node
}

pub fn (mut l LinkedList) shift() int {
	head := l.head
	if head.next == unsafe { nil } { // single element
		l.head = unsafe { nil }
		l.tail = unsafe { nil }
	} else { // multiple elements
		mut next := head.next
		next.prev = unsafe { nil }
		l.head = next
	}
	return head.value // head can now be auto-freed
}

pub fn (l LinkedList) count() int {
	mut count := 0
	for node := l.head; node != unsafe { nil }; node = node.next {
		count++
	}
	return count
}

pub fn (mut l LinkedList) delete(value int) {
	for node := l.head; node != unsafe { nil }; node = node.next {
		if node.value == value {
			if node == l.head {
				l.head = node.next
			} else {
				node.prev.next = node.next
			}
			if node == l.tail {
				l.tail = node.prev
			} else {
				node.next.prev = node.prev
			}
			// node can now be auto-freed
			// and now we've done a delete, we're done
			return
		}
	}
}
