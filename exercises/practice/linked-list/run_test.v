module main

fn test_pop_gets_element_from_the_list() {
	mut ll := LinkedList{}
	ll.push(7)
	assert ll.pop() == 7
}

fn test_push_pop_respectively_add_remove_at_the_end_of_the_list() {
	mut ll := LinkedList{}
	ll.push(11)
	ll.push(13)
	assert ll.pop() == 13
	assert ll.pop() == 11
}

fn test_shift_gets_an_element_from_the_list() {
	mut ll := LinkedList{}
	ll.push(17)
	assert ll.shift() == 17
}

fn test_shift_gets_first_element_from_the_list() {
	mut ll := LinkedList{}
	ll.push(23)
	ll.push(5)
	assert ll.shift() == 23
	assert ll.shift() == 5
}

fn test_unshift_adds_element_at_start_of_the_list() {
	mut ll := LinkedList{}
	ll.unshift(23)
	ll.unshift(5)
	assert ll.shift() == 5
	assert ll.shift() == 23
}

fn test_pop_push_shift_and_unshift_can_be_used_in_any_order() {
	mut ll := LinkedList{}
	ll.push(1)
	ll.push(2)
	assert ll.pop() == 2
	ll.push(3)
	assert ll.shift() == 1
	ll.unshift(4)
	ll.push(5)
	assert ll.shift() == 4
	assert ll.pop() == 5
	assert ll.shift() == 3
}

fn test_count_an_empty_list() {
	ll := LinkedList{}
	assert ll.count() == 0
}

fn test_count_a_list_with_items() {
	mut ll := LinkedList{}
	ll.push(37)
	ll.push(1)
	assert ll.count() == 2
}

fn test_count_is_correct_after_mutation() {
	mut ll := LinkedList{}
	ll.push(31)
	assert ll.count() == 1
	ll.unshift(43)
	assert ll.count() == 2
	ll.shift()
	assert ll.count() == 1
	ll.pop()
	assert ll.count() == 0
}

fn test_popping_to_empty_does_not_break_the_list() {
	mut ll := LinkedList{}
	ll.push(41)
	ll.push(59)
	ll.pop()
	ll.pop()
	ll.push(47)
	assert ll.count() == 1
	assert ll.pop() == 47
}

fn test_shifting_to_empty_does_not_break_the_list() {
	mut ll := LinkedList{}
	ll.push(41)
	ll.push(59)
	ll.shift()
	ll.shift()
	ll.push(47)
	assert ll.count() == 1
	assert ll.pop() == 47
}

fn test_deletes_the_only_element() {
	mut ll := LinkedList{}
	ll.push(61)
	ll.delete(61)
	assert ll.count() == 0
}

fn test_deletes_the_element_with_the_specified_value_from_the_list() {
	mut ll := LinkedList{}
	ll.push(71)
	ll.push(83)
	ll.push(79)
	ll.delete(83)
	assert ll.count() == 2
	assert ll.pop() == 79
	assert ll.shift() == 71
}

fn test_deletes_the_element_with_the_specified_value_from_the_list_reassigns_tail() {
	mut ll := LinkedList{}
	ll.push(71)
	ll.push(83)
	ll.push(79)
	ll.delete(83)
	assert ll.count() == 2
	assert ll.pop() == 79
	assert ll.pop() == 71
}

fn test_deletes_the_element_with_the_specified_value_from_the_list_reassigns_head() {
	mut ll := LinkedList{}
	ll.push(71)
	ll.push(83)
	ll.push(79)
	ll.delete(83)
	assert ll.count() == 2
	assert ll.shift() == 71
	assert ll.shift() == 79
}

fn test_deletes_the_first_of_two_elements() {
	mut ll := LinkedList{}
	ll.push(97)
	ll.push(101)
	ll.delete(97)
	assert ll.count() == 1
	assert ll.pop() == 101
}

fn test_deletes_the_second_of_two_elements() {
	mut ll := LinkedList{}
	ll.push(97)
	ll.push(101)
	ll.delete(101)
	assert ll.count() == 1
	assert ll.pop() == 97
}

fn test_delete_does_not_modify_the_list_if_the_element_is_not_found() {
	mut ll := LinkedList{}
	ll.push(89)
	ll.delete(103)
	assert ll.count() == 1
}

fn test_deletes_only_the_first_occurrence() {
	mut ll := LinkedList{}
	ll.push(73)
	ll.push(9)
	ll.push(9)
	ll.push(107)
	ll.delete(9)
	assert ll.count() == 3
	assert ll.pop() == 107
	assert ll.pop() == 9
	assert ll.pop() == 73
}
