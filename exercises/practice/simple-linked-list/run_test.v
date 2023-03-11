module main

fn test_new() {
	list := new()
	assert list.len == 0
}

fn test_push_adds_element_to_the_list() {
	mut list := new()
	list.push(1)
	list.push(2)
	assert list.pop()! == 2
	assert list.pop()! == 1
}

fn test_push_increments_the_length() {
	mut list := new()

	list.push(1)
	assert list.len == 1

	list.push(2)
	assert list.len == 2
}

fn test_pop_returns_the_head_element_and_removes_it() {
	mut list := new()
	list.push(1)
	list.push(2)
	assert list.pop()! == 2
	assert list.pop()! == 1
	assert list.is_empty()
}

fn test_pop_decrements_the_length() {
	mut list := new()
	list.push(1)
	list.push(2)

	list.pop()
	assert list.len == 1

	list.pop()
	assert list.len == 0
}

fn test_pop_returns_nothing_if_the_list_is_empty() {
	mut list := new()

	if data := list.pop() {
		assert list.len == 0
		assert false, 'should return nothing'
	} else {
		assert true
	}
}

fn test_peek_returns_the_head_element_without_removing_it() {
	mut list := new()
	list.push(1)
	assert list.peek()! == 1
	assert list.peek()! == 1
	assert list.len == 1
}

fn test_peek_returns_nothing_if_list_is_empty() {
	mut list := new()

	if data := list.peek() {
		assert list.len == 0
		assert false, 'should return nothing'
	} else {
		assert true
	}
}

fn test_is_empty() {
	mut list := new()
	assert list.is_empty()

	list.push(1)
	assert !list.is_empty()

	list.pop()
	assert list.is_empty()
}

fn test_from_array() {
	mut list := from_array([])
	assert list.is_empty()

	list = from_array([1, 2])
	assert list.pop()! == 2
	assert list.pop()! == 1
}

fn test_to_array() {
	mut list := new()
	assert list.to_array() == []

	list = from_array([1, 2])
	assert list.to_array() == [1, 2]
}

fn test_to_array_does_not_mutate_the_list() {
	list := from_array([1, 2, 3])
	list.to_array()
	assert list.len == 3
}

fn test_reverse() {
	mut list := from_array([1, 2, 3])
	mut reversed_list := list.reverse()

	assert reversed_list.to_array() == [3, 2, 1]
}

fn test_reverse_does_not_mutate_the_list() {
	list := from_array([1, 2, 3])
	list.reverse()
	assert list.len == 3
}
