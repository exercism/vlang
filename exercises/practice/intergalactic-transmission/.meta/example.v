module main

import math.bits

const initial_mask = u8(0xFE)

fn transmit_sequence(data []u8) []u8 {
	mut sequence := []u8{}
	mut carry := u8(0)
	mut upper_mask := initial_mask

	for i in 0 .. data.len {
		if upper_mask == 0 {
			// The carry now contains 7 bits. Flush the carry out.
			sequence << add_parity(carry)
			carry = u8(0)
			upper_mask = initial_mask
		}

		shift_places := bits.trailing_zeros_8(upper_mask)
		current := (carry << (8 - shift_places)) | (data[i] >>> shift_places)
		sequence << add_parity(current)

		carry = data[i] & (~upper_mask)
		upper_mask = upper_mask << 1
	}

	if upper_mask != initial_mask {
		last_group := carry << bits.ones_count_8(upper_mask)
		sequence << add_parity(last_group)
	}

	return sequence
}

fn add_parity(data u8) u8 {
	if bits.ones_count_8(data) % 2 == 0 {
		return data << 1
	}
	return (data << 1) | u8(1)
}

fn decode_message(received []u8) ![]u8 {
	if received.len == 0 {
		return []u8{}
	}

	mut decoded := []u8{}
	mut to_add := u8(0x00)
	mut upper_mask := u8(0xFF)

	for i in 0 .. received.len {
		if upper_mask == 0xFF {
			to_add = get_byte_data(received[i])!
			upper_mask = 0x80
		} else {
			current_byte := get_byte_data(received[i])!
			contribution := current_byte >>> bits.trailing_zeros_8(upper_mask)
			decoded << to_add | contribution

			to_add = (current_byte & (~(upper_mask | 0x01))) << bits.ones_count_8(upper_mask)
			upper_mask = (upper_mask >> 1) | u8(0x80)
		}
	}

	return decoded
}

fn get_byte_data(data u8) !u8 {
	if bits.ones_count_8(data) % 2 != 0 {
		return error('wrong parity')
	}
	return data & u8(0xFE)
}
