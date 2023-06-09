module main

fn encode(integers []u32) []u8 {
	mut result := []u8{}
	for integer in integers {
		mut encoding := []u8{}
		mut current := integer
		encoding << u8(current & 0x7f)
		current >>>= 7
		for current != 0 {
			encoding << u8(0x80 | current)
			current >>>= 7
		}

		encoding.reverse_in_place()
		result << encoding
	}
	return result
}

fn decode(integers []u8) ![]u32 {
	mut result := []u32{}
	mut current := u32(0)
	mut complete := true
	for integer in integers {
		current |= integer & 0x7f
		if (integer & 0x80) != 0 {
			current <<= 7
			complete = false
		} else {
			result << current
			current = 0
			complete = true
		}
	}
	if !complete {
		return error('incomplete sequence')
	}
	return result
}
