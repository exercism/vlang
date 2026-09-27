module main

// Recorder collects the values a callback was called with, in the order the cell
// reported them.
struct Recorder {
mut:
	values []int
}

fn (mut r Recorder) record(value int) {
	r.values << value
}

// new_callback returns a recorder to read back what a callback was called with,
// together with the callback itself. A closure captures variables by value in V,
// so the recorder is reached through a pointer for the recording to be visible
// to the test that asked for the callback.
fn new_callback() (&Recorder, fn (int)) {
	recorder := &Recorder{
		values: []int{}
	}
	return recorder, fn [recorder] (value int) {
		recorder.record(value)
	}
}

fn test_input_cells_have_a_value() {
	mut reaction := new_reaction()
	reaction.create_input('input', 10)!
	assert reaction.value('input')! == 10
}

fn test_an_input_cells_value_can_be_set() {
	mut reaction := new_reaction()
	reaction.create_input('input', 4)!
	reaction.set_value('input', 20)!
	assert reaction.value('input')! == 20
}

fn test_compute_cells_calculate_initial_value() {
	mut reaction := new_reaction()
	reaction.create_input('input', 1)!
	reaction.create_compute('output', ['input'], fn (inputs []int) int {
		return inputs[0] + 1
	})!
	assert reaction.value('output')! == 2
}

fn test_compute_cells_take_inputs_in_the_right_order() {
	mut reaction := new_reaction()
	reaction.create_input('one', 1)!
	reaction.create_input('two', 2)!
	reaction.create_compute('output', ['one', 'two'], fn (inputs []int) int {
		return inputs[0] + inputs[1] * 10
	})!
	assert reaction.value('output')! == 21
}

fn test_compute_cells_update_value_when_dependencies_are_changed() {
	mut reaction := new_reaction()
	reaction.create_input('input', 1)!
	reaction.create_compute('output', ['input'], fn (inputs []int) int {
		return inputs[0] + 1
	})!
	reaction.set_value('input', 3)!
	assert reaction.value('output')! == 4
}

fn test_compute_cells_can_depend_on_other_compute_cells() {
	mut reaction := new_reaction()
	reaction.create_input('input', 1)!
	reaction.create_compute('times_two', ['input'], fn (inputs []int) int {
		return inputs[0] * 2
	})!
	reaction.create_compute('times_thirty', ['input'], fn (inputs []int) int {
		return inputs[0] * 30
	})!
	sum := fn (inputs []int) int {
		return inputs[0] + inputs[1]
	}
	reaction.create_compute('output', ['times_two', 'times_thirty'], sum)!
	assert reaction.value('output')! == 32
	reaction.set_value('input', 3)!
	assert reaction.value('output')! == 96
}

fn test_compute_cells_fire_callbacks() {
	mut reaction := new_reaction()
	reaction.create_input('input', 1)!
	reaction.create_compute('output', ['input'], fn (inputs []int) int {
		return inputs[0] + 1
	})!
	callback1, notify := new_callback()
	reaction.add_callback('output', 'callback1', notify)!
	reaction.set_value('input', 3)!
	assert callback1.values == [4]
}

fn test_callback_cells_only_fire_on_change() {
	mut reaction := new_reaction()
	reaction.create_input('input', 1)!
	reaction.create_compute('output', ['input'], fn (inputs []int) int {
		return if inputs[0] < 3 { 111 } else { 222 }
	})!
	callback1, notify := new_callback()
	reaction.add_callback('output', 'callback1', notify)!
	reaction.set_value('input', 2)!
	assert callback1.values.len == 0
	reaction.set_value('input', 4)!
	assert callback1.values == [222]
}

fn test_callbacks_do_not_report_already_reported_values() {
	mut reaction := new_reaction()
	reaction.create_input('input', 1)!
	reaction.create_compute('output', ['input'], fn (inputs []int) int {
		return inputs[0] + 1
	})!
	callback1, notify := new_callback()
	reaction.add_callback('output', 'callback1', notify)!
	reaction.set_value('input', 2)!
	assert callback1.values == [3]
	reaction.set_value('input', 3)!
	assert callback1.values == [3, 4]
}

fn test_callbacks_can_fire_from_multiple_cells() {
	mut reaction := new_reaction()
	reaction.create_input('input', 1)!
	reaction.create_compute('plus_one', ['input'], fn (inputs []int) int {
		return inputs[0] + 1
	})!
	reaction.create_compute('minus_one', ['input'], fn (inputs []int) int {
		return inputs[0] - 1
	})!
	callback1, notify1 := new_callback()
	callback2, notify2 := new_callback()
	reaction.add_callback('plus_one', 'callback1', notify1)!
	reaction.add_callback('minus_one', 'callback2', notify2)!
	reaction.set_value('input', 10)!
	assert callback1.values == [11]
	assert callback2.values == [9]
}

fn test_callbacks_can_be_added_and_removed() {
	mut reaction := new_reaction()
	reaction.create_input('input', 11)!
	reaction.create_compute('output', ['input'], fn (inputs []int) int {
		return inputs[0] + 1
	})!
	callback1, notify1 := new_callback()
	callback2, notify2 := new_callback()
	callback3, notify3 := new_callback()
	reaction.add_callback('output', 'callback1', notify1)!
	reaction.add_callback('output', 'callback2', notify2)!
	reaction.set_value('input', 31)!
	assert callback1.values == [32]
	assert callback2.values == [32]
	reaction.remove_callback('output', 'callback1')!
	reaction.add_callback('output', 'callback3', notify3)!
	reaction.set_value('input', 41)!
	assert callback1.values == [32]
	assert callback2.values == [32, 42]
	assert callback3.values == [42]
}

fn test_removing_a_callback_multiple_times_doesnt_interfere_with_other_callbacks() {
	mut reaction := new_reaction()
	reaction.create_input('input', 1)!
	reaction.create_compute('output', ['input'], fn (inputs []int) int {
		return inputs[0] + 1
	})!
	callback1, notify1 := new_callback()
	callback2, notify2 := new_callback()
	reaction.add_callback('output', 'callback1', notify1)!
	reaction.add_callback('output', 'callback2', notify2)!
	reaction.remove_callback('output', 'callback1')!
	reaction.remove_callback('output', 'callback1')!
	reaction.remove_callback('output', 'callback1')!
	reaction.set_value('input', 2)!
	assert callback1.values.len == 0
	assert callback2.values == [3]
}

fn test_callbacks_should_only_be_called_once_even_if_multiple_dependencies_change() {
	mut reaction := new_reaction()
	reaction.create_input('input', 1)!
	reaction.create_compute('plus_one', ['input'], fn (inputs []int) int {
		return inputs[0] + 1
	})!
	reaction.create_compute('minus_one1', ['input'], fn (inputs []int) int {
		return inputs[0] - 1
	})!
	reaction.create_compute('minus_one2', ['minus_one1'], fn (inputs []int) int {
		return inputs[0] - 1
	})!
	reaction.create_compute('output', ['plus_one', 'minus_one2'], fn (inputs []int) int {
		return inputs[0] * inputs[1]
	})!
	callback1, notify := new_callback()
	reaction.add_callback('output', 'callback1', notify)!
	reaction.set_value('input', 4)!
	assert callback1.values == [10]
}

fn test_callbacks_should_not_be_called_if_dependencies_change_but_output_value_doesnt_change() {
	mut reaction := new_reaction()
	reaction.create_input('input', 1)!
	reaction.create_compute('plus_one', ['input'], fn (inputs []int) int {
		return inputs[0] + 1
	})!
	reaction.create_compute('minus_one', ['input'], fn (inputs []int) int {
		return inputs[0] - 1
	})!
	reaction.create_compute('always_two', ['plus_one', 'minus_one'], fn (inputs []int) int {
		return inputs[0] - inputs[1]
	})!
	callback1, notify := new_callback()
	reaction.add_callback('always_two', 'callback1', notify)!
	for value in [2, 3, 4, 5] {
		reaction.set_value('input', value)!
		assert callback1.values.len == 0
	}
	assert reaction.value('always_two')! == 2
}
