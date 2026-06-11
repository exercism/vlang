module main

fn test_new() {
	list := new()
	assert list.len == 0
}

fn test_count_empty_list_has_length_of_zero() {
	list := new()
	assert list.len == 0
}

fn test_count_singleton_list_has_length_of_one() {
	list := from_array([1])

	assert list.len == 1
}

fn test_non_empty_list_has_correct_length() {
	list := from_array([1, 2, 3])

	assert list.len == 3
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

fn test_pop_from_singleton_list() {
	mut list := from_array([1])
	list.push(1)

	if res := list.pop() {
		assert res == 1
	} else {
		assert false, 'should return 1'
	}
}

fn test_pop_from_non_empty_list() {
	mut list := from_array([1, 2])

	if res := list.pop() {
		assert res == 2
	} else {
		assert false, 'should return 2'
	}
}

fn test_pop_can_pop_multiple_items() {
	mut list := from_array([1, 2])

	if res := list.pop() {
		assert res == 2
	} else {
		assert false, 'should return 2'
	}

	if res := list.pop() {
		assert res == 1
	} else {
		assert false, 'should return 1'
	}

	assert list.is_empty()
}

fn test_pop_updates_the_count() {
	mut list := from_array([1, 2])

	assert list.len == 2

	if res := list.pop() {
		assert res == 2
	} else {
		assert false, 'should return 2'
	}

	assert list.len == 1

	if res := list.pop() {
		assert res == 1
	} else {
		assert false, 'should return 1'
	}
	assert list.len == 0
}

fn test_push_to_an_empty_list() {
	mut list := new()
	list.push(1)

	assert list.len == 1

	if res := list.pop() {
		assert res == 1
	} else {
		assert false, 'should return 1'
	}
}

fn test_push_to_non_empty_list() {
	mut list := from_array([1, 2])
	list.push(3)

	if res := list.pop() {
		assert res == 3
	} else {
		assert false, 'should return 3'
	}
}

fn test_push_updates_count() {
	mut list := from_array([1, 2])

	list.push(3)
	assert list.len == 3
}

fn test_push_and_pop() {
	mut list := new()

	list.push(1)
	list.push(2)

	if res := list.pop() {
		assert res == 2
	} else {
		assert false, 'should return 2'
	}

	list.push(3)

	assert list.len == 2

	if res := list.pop() {
		assert res == 3
	} else {
		assert false, 'should return 3'
	}

	if res := list.pop() {
		assert res == 1
	} else {
		assert false, 'should return 1'
	}

	assert list.len == 0
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

fn test_peek_on_singleton_list() {
	mut list := from_array([1])

	if data := list.peek() {
		assert data == 1
	} else {
		assert false, 'should return 1'
	}
}

fn test_peek_returns_the_head_element_without_removing_it() {
	mut list := from_array([1])

	if res := list.peek() {
		assert res == 1
	} else {
		assert false, 'should return 1'
	}

	if res := list.peek() {
		assert res == 1
	} else {
		assert false, 'should return 1'
	}

	assert list.len == 1
}

fn test_peek_on_non_empty_list() {
	mut list := from_array([1, 2])

	if res := list.peek() {
		assert res == 2
	} else {
		assert false, 'should return 2'
	}
}

fn test_peek_does_not_change_the_count() {
	mut list := from_array([1, 2])

	if res := list.peek() {
		assert res == 2
	} else {
		assert false, 'should return 2'
	}

	assert list.len == 2
}

fn test_peek_after_pop_and_push() {
	mut list := new()

	list.push(1)
	list.push(2)

	if res := list.peek() {
		assert res == 2
	} else {
		assert false, 'should return 2'
	}

	if res := list.pop() {
		assert res == 2
	} else {
		assert false, 'should return 2'
	}

	if res := list.peek() {
		assert res == 1
	} else {
		assert false, 'should return 1'
	}

	list.push(3)

	if res := list.peek() {
		assert res == 3
	} else {
		assert false, 'should return 3'
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

	if res := list.pop() {
		assert res == 2
	} else {
		assert false, 'should return 2'
	}

	if res := list.pop() {
		assert res == 1
	} else {
		assert false, 'should return 1'
	}
}

fn test_empty_list_to_array() {
	list := new()
	assert list.to_array() == []
}

fn test_non_empty_list_to_array() {
	list := from_array([1, 2, 3])
	assert list.to_array() == [1, 2, 3]
}

fn test_to_array_after_a_pop() {
	mut list := new()

	list.push(1)
	list.push(2)
	list.push(3)

	if res := list.pop() {
		assert res == 3
	} else {
		assert false, 'should return 3'
	}

	list.push(4)

	assert list.to_array() == [1, 2, 4]
}

fn test_empty_list_to_array_is_empty() {
	list := new()
	assert list.to_array() == []
}

fn test_to_array_with_multiple_values() {
	list := from_array([1, 2, 3])
	assert list.to_array() == [1, 2, 3]
}

fn test_to_array_does_not_mutate_the_list() {
	list := from_array([1, 2, 3])
	list.to_array()
	assert list.len == 3
}

fn test_reverse_empty_list() {
	mut list := new()
	mut reversed_list := list.reverse()

	assert reversed_list.to_array() == []
}

fn test_reverse_singleton_empty_list() {
	mut list := from_array([1])
	mut reversed_list := list.reverse()

	assert reversed_list.to_array() == [1]
}

fn test_reverse_non_empty_list() {
	mut list := from_array([1, 2, 3])
	mut reversed_list := list.reverse()

	assert reversed_list.to_array() == [3, 2, 1]
}

fn test_double_reverse() {
	mut list := from_array([1, 2, 3])
	mut reverserd_list_1 := list.reverse()
	mut reverserd_list_2 := reverserd_list_1.reverse()

	assert reverserd_list_2.to_array() == [1, 2, 3]
}

fn test_reverse_does_not_mutate_the_list() {
	list := from_array([1, 2, 3])
	list.reverse()
	assert list.len == 3
}
