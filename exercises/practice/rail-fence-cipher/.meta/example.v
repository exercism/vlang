module main

struct RailIterator {
	rails int
mut:
	count int
	rail  int
	delta int = 1
}

fn (mut iter RailIterator) next() ?int {
	if iter.count == 0 {
		return none
	}
	iter.count--

	defer {
		iter.rail += iter.delta
		if iter.rail == 0 || iter.rail == iter.rails - 1 {
			iter.delta = -iter.delta
		}
	}
	return iter.rail
}

fn row_offsets(msg_length int, rails int) []int {
	assert rails > 1

	period := 2 * (rails - 1)
	cycles := msg_length / period
	mut row_lengths := []int{len: rails, init: 2 * cycles}
	row_lengths[0] = cycles
	row_lengths[rails - 1] = cycles

	iter := RailIterator{
		rails: rails
		count: msg_length % period
	}
	for rail in iter {
		row_lengths[rail]++
	}

	mut offsets := []int{len: rails}
	mut acc := 0
	for rail in 0 .. rails {
		offsets[rail] = acc
		acc += row_lengths[rail]
	}
	assert acc == msg_length
	return offsets
}

fn encode(msg string, rails int) string {
	mut offsets := row_offsets(msg.len, rails)
	mut result := []u8{len: msg.len}

	iter := RailIterator{
		rails: rails
		count: msg.len
	}
	mut index := 0
	for rail in iter {
		result[offsets[rail]] = msg[index]
		offsets[rail]++
		index++
	}
	return result.bytestr()
}

fn decode(msg string, rails int) string {
	mut offsets := row_offsets(msg.len, rails)
	mut result := []u8{len: msg.len}

	iter := RailIterator{
		rails: rails
		count: msg.len
	}
	mut index := 0
	for rail in iter {
		result[index] = msg[offsets[rail]]
		offsets[rail]++
		index++
	}
	return result.bytestr()
}
