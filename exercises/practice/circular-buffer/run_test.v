module main

fn test_reading_empty_buffer_should_fail() {
	mut buffer := create_buffer[int](1)
	if res := buffer.read() {
		assert false, 'Expecting an error, not ${res}'
	} else {
		assert err.msg() == 'Buffer is empty'
	}
}

fn test_can_read_an_item_just_written() {
	mut buffer := create_buffer[int](1)
	buffer.write(1) or { assert false, 'buffer.write(1) should succeed, not fail with an error' }
	if res := buffer.read() {
		assert res == 1
	} else {
		assert false, 'buffer.read() should return 1, not an error'
	}
}

fn test_each_item_may_only_be_read_once() {
	mut buffer := create_buffer[int](1)
	buffer.write(1) or { assert false, 'buffer.write(1) should succeed, not fail with an error' }

	if res := buffer.read() {
		assert res == 1
	} else {
		assert false, 'buffer.read() should return 1, not an error'
	}

	if res := buffer.read() {
		assert false, 'buffer.read() should return an error, not ${res}'
	} else {
		assert err.msg() == 'Buffer is empty'
	}
}

fn test_items_are_read_in_the_order_they_are_written() {
	mut buffer := create_buffer[int](2)
	buffer.write(1) or { assert false, 'buffer.write(1) should succeed, not fail with an error' }
	buffer.write(2) or { assert false, 'buffer.write(2) should succeed, not fail with an error' }

	if res := buffer.read() {
		assert res == 1
	} else {
		assert false, 'buffer.read() should return 1, not an error'
	}

	if res := buffer.read() {
		assert res == 2
	} else {
		assert false, 'buffer.read() should return 2, not an error'
	}
}

fn test_full_buffer_cant_be_written_to() {
	mut buffer := create_buffer[int](1)
	buffer.write(1) or { assert false, 'buffer.write(1) should succeed, not fail with an error' }

	buffer.write(2) or {
		assert err.msg() == 'Buffer is full'
		return
	}

	assert false, 'buffer.write(2) should fail, not succeed'
}

fn test_a_read_frees_up_capacity_for_another_write() {
	mut buffer := create_buffer[int](1)
	buffer.write(1) or { assert false, 'buffer.write(1) should succeed, not fail with an error' }

	if res := buffer.read() {
		assert res == 1
	} else {
		assert false, 'buffer.read() should return 1, not an error'
	}

	buffer.write(2) or { assert false, 'buffer.write(2) should succeed, not fail with an error' }

	if res := buffer.read() {
		assert res == 2
	} else {
		assert false, 'buffer.read() should return 2, not an error'
	}
}

fn test_read_position_is_maintained_even_across_multiple_writes() {
	mut buffer := create_buffer[int](3)
	buffer.write(1) or { assert false, 'buffer.write(1) should succeed, not fail with an error' }
	buffer.write(2) or { assert false, 'buffer.write(2) should succeed, not fail with an error' }

	if res := buffer.read() {
		assert res == 1
	} else {
		assert false, 'buffer.read() should return 1, not an error'
	}

	buffer.write(3) or { assert false, 'buffer.write(3) should succeed, not fail with an error' }
	if res := buffer.read() {
		assert res == 2
	} else {
		assert false, 'buffer.read() should return 2, not an error'
	}

	if res := buffer.read() {
		assert res == 3
	} else {
		assert false, 'buffer.read() should return 3, not an error'
	}
}

fn test_items_cleared_out_of_buffer_cant_be_read() {
	mut buffer := create_buffer[int](1)
	buffer.write(1) or { assert false, 'buffer.write(1) should succeed, not fail with an error' }
	buffer.clear()

	if res := buffer.read() {
		assert false, 'buffer.read() should return an error, not ${res}'
	} else {
		assert err.msg() == 'Buffer is empty'
	}
}

fn test_clear_frees_up_capacity_for_another_write() {
	mut buffer := create_buffer[int](1)
	buffer.write(1) or { assert false, 'buffer.write(1) should succeed, not fail with an error' }
	buffer.clear()
	buffer.write(2) or { assert false, 'buffer.write(2) should succeed, not fail with an error' }

	if res := buffer.read() {
		assert res == 2
	} else {
		assert false, 'buffer.read() should return 2, not an error'
	}
}

fn test_clear_does_nothing_on_empty_buffer() {
	mut buffer := create_buffer[int](1)
	buffer.clear()
	buffer.write(1) or { assert false, 'buffer.write(1) should succeed, not fail with an error' }

	if res := buffer.read() {
		assert res == 1
	} else {
		assert false, 'buffer.read() should return 1, not an error'
	}
}

fn test_overwrite_acts_like_write_on_nonfull_buffer() {
	mut buffer := create_buffer[int](2)
	buffer.write(1) or { assert false, 'buffer.write(1) should succeed, not fail with an error' }
	buffer.overwrite(2)

	if res := buffer.read() {
		assert res == 1
	} else {
		assert false, 'buffer.read() should return 1, not an error'
	}

	if res := buffer.read() {
		assert res == 2
	} else {
		assert false, 'buffer.read() should return 2, not an error'
	}
}

fn test_overwrite_replaces_the_oldest_item_on_full_buffer() {
	mut buffer := create_buffer[int](2)
	buffer.write(1) or { assert false, 'buffer.write(1) should succeed, not fail with an error' }
	buffer.write(2) or { assert false, 'buffer.write(2) should succeed, not fail with an error' }
	buffer.overwrite(3)

	if res := buffer.read() {
		assert res == 2
	} else {
		assert false, 'buffer.read() should return 2, not an error'
	}

	if res := buffer.read() {
		assert res == 3
	} else {
		assert false, 'buffer.read() should return 3, not an error'
	}
}

fn test_overwrite_replaces_the_oldest_item_remaining_in_buffer_following_a_read() {
	mut buffer := create_buffer[int](3)
	buffer.write(1) or { assert false, 'buffer.write(1) should succeed, not fail with an error' }
	buffer.write(2) or { assert false, 'buffer.write(2) should succeed, not fail with an error' }
	buffer.write(3) or { assert false, 'buffer.write(3) should succeed, not fail with an error' }

	if res := buffer.read() {
		assert res == 1
	} else {
		assert false, 'buffer.read() should return 1, not an error'
	}

	buffer.write(4) or { assert false, 'buffer.write(3) should succeed, not fail with an error' }
	buffer.overwrite(5)

	if res := buffer.read() {
		assert res == 3
	} else {
		assert false, 'buffer.read() should return 3, not an error'
	}

	if res := buffer.read() {
		assert res == 4
	} else {
		assert false, 'buffer.read() should return 4, not an error'
	}

	if res := buffer.read() {
		assert res == 5
	} else {
		assert false, 'buffer.read() should return 5, not an error'
	}
}

fn test_initial_clear_does_not_affect_wrapping_around() {
	mut buffer := create_buffer[int](2)
	buffer.clear()
	buffer.write(1) or { assert false, 'buffer.write(1) should succeed, not fail with an error' }
	buffer.write(2) or { assert false, 'buffer.write(2) should succeed, not fail with an error' }
	buffer.overwrite(3)
	buffer.overwrite(4)

	if res := buffer.read() {
		assert res == 3
	} else {
		assert false, 'buffer.read() should return 3, not an error'
	}

	if res := buffer.read() {
		assert res == 4
	} else {
		assert false, 'buffer.read() should return 4, not an error'
	}

	if res := buffer.read() {
		assert false, 'buffer.read() should return an error, not ${res}'
	} else {
		assert err.msg() == 'Buffer is empty'
	}
}
