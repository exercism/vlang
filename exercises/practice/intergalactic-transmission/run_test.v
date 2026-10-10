module main

fn test_transmit_empty_message() {
	assert transmit_sequence([]u8{}) == []u8{}
}

fn test_0x00_is_transmitted_as_0x0000() {
	assert transmit_sequence([u8(0x00)]) == [u8(0x00), u8(0x00)]
}

fn test_0x02_is_transmitted_as_0x0300() {
	assert transmit_sequence([u8(0x02)]) == [u8(0x03), u8(0x00)]
}

fn test_0x06_is_transmitted_as_0x0600() {
	assert transmit_sequence([u8(0x06)]) == [u8(0x06), u8(0x00)]
}

fn test_0x05_is_transmitted_as_0x0581() {
	assert transmit_sequence([u8(0x05)]) == [u8(0x05), u8(0x81)]
}

fn test_0x29_is_transmitted_as_0x2881() {
	assert transmit_sequence([u8(0x29)]) == [u8(0x28), u8(0x81)]
}

fn test_0xc001c0de_is_transmitted_as_0xc000711be1() {
	assert transmit_sequence([u8(0xc0), u8(0x01), u8(0xc0), u8(0xde)]) == [u8(0xc0), u8(0x00),
		u8(0x71), u8(0x1b), u8(0xe1)]
}

fn test_transmit_six_byte_message() {
	assert transmit_sequence([u8(0x47), u8(0x72), u8(0x65), u8(0x61), u8(0x74), u8(0x21)]) == [
		u8(0x47),
		u8(0xb8),
		u8(0x99),
		u8(0xac),
		u8(0x17),
		u8(0xa0),
		u8(0x84),
	]
}

fn test_transmit_seven_byte_message() {
	assert transmit_sequence([u8(0x47), u8(0x72), u8(0x65), u8(0x61), u8(0x74), u8(0x31), u8(0x21)]) == [
		u8(0x47),
		u8(0xb8),
		u8(0x99),
		u8(0xac),
		u8(0x17),
		u8(0xa0),
		u8(0xc5),
		u8(0x42),
	]
}

fn test_transmit_eight_byte_message() {
	assert transmit_sequence([u8(0xc0), u8(0x01), u8(0x13), u8(0x37), u8(0xc0), u8(0xde), u8(0x21),
		u8(0x21)]) == [u8(0xc0), u8(0x00), u8(0x44), u8(0x66), u8(0x7d), u8(0x06), u8(0x78), u8(0x42),
		u8(0x21), u8(0x81)]
}

fn test_transmit_twenty_byte_message() {
	assert transmit_sequence([u8(0x45), u8(0x78), u8(0x65), u8(0x72), u8(0x63), u8(0x69), u8(0x73),
		u8(0x6d), u8(0x20), u8(0x69), u8(0x73), u8(0x20), u8(0x61), u8(0x77), u8(0x65), u8(0x73),
		u8(0x6f), u8(0x6d), u8(0x65), u8(0x21)]) == [u8(0x44), u8(0xbd), u8(0x18), u8(0xaf), u8(0x27),
		u8(0x1b), u8(0xa5), u8(0xe7), u8(0x6c), u8(0x90), u8(0x1b), u8(0x2e), u8(0x33), u8(0x03),
		u8(0x84), u8(0xee), u8(0x65), u8(0xb8), u8(0xdb), u8(0xed), u8(0xd7), u8(0x28), u8(0x84)]
}

fn test_decode_empty_message() {
	if res := decode_message([]u8{}) {
		assert res == []u8{}
	} else {
		assert false, 'empty message should not return an error'
	}
}

fn test_decode_zero_message() {
	if res := decode_message([u8(0x00), u8(0x00)]) {
		assert res == [u8(0x00)]
	} else {
		assert false, 'zero message should not return an error'
	}
}

fn test_0x0300_is_decoded_to_0x02() {
	if res := decode_message([u8(0x03), u8(0x00)]) {
		assert res == [u8(0x02)]
	} else {
		assert false, '0x0300 is decoded to 0x02 should not return an error'
	}
}

fn test_0x0581_is_decoded_to_0x05() {
	if res := decode_message([u8(0x05), u8(0x81)]) {
		assert res == [u8(0x05)]
	} else {
		assert false, '0x0581 is decoded to 0x05 should not return an error'
	}
}

fn test_0x2881_is_decoded_to_0x29() {
	if res := decode_message([u8(0x28), u8(0x81)]) {
		assert res == [u8(0x29)]
	} else {
		assert false, '0x2881 is decoded to 0x29 should not return an error'
	}
}

fn test_first_byte_has_wrong_parity() {
	if res := decode_message([u8(0x07), u8(0x00)]) {
		assert false, 'first byte has wrong parity should return an error'
	} else {
		assert err.msg() == 'wrong parity'
	}
}

fn test_second_byte_has_wrong_parity() {
	if res := decode_message([u8(0x03), u8(0x68)]) {
		assert false, 'second byte has wrong parity should return an error'
	} else {
		assert err.msg() == 'wrong parity'
	}
}

fn test_0xcf4b00_is_decoded_to_0xce94() {
	if res := decode_message([u8(0xcf), u8(0x4b), u8(0x00)]) {
		assert res == [u8(0xce), u8(0x94)]
	} else {
		assert false, '0xcf4b00 is decoded to 0xce94 should not return an error'
	}
}

fn test_0xe2566500_is_decoded_to_0xe2ad90() {
	if res := decode_message([u8(0xe2), u8(0x56), u8(0x65), u8(0x00)]) {
		assert res == [u8(0xe2), u8(0xad), u8(0x90)]
	} else {
		assert false, '0xe2566500 is decoded to 0xe2ad90 should not return an error'
	}
}

fn test_decode_six_byte_message() {
	if res := decode_message([u8(0x47), u8(0xb8), u8(0x99), u8(0xac), u8(0x17), u8(0xa0), u8(0x84)]) {
		assert res == [u8(0x47), u8(0x72), u8(0x65), u8(0x61), u8(0x74), u8(0x21)]
	} else {
		assert false, 'six byte message should not return an error'
	}
}

fn test_decode_seven_byte_message() {
	if res := decode_message([u8(0x47), u8(0xb8), u8(0x99), u8(0xac), u8(0x17), u8(0xa0), u8(0xc5),
		u8(0x42)])
	{
		assert res == [u8(0x47), u8(0x72), u8(0x65), u8(0x61), u8(0x74), u8(0x31), u8(0x21)]
	} else {
		assert false, 'seven byte message should not return an error'
	}
}

fn test_last_byte_has_wrong_parity() {
	if res := decode_message([u8(0x47), u8(0xb8), u8(0x99), u8(0xac), u8(0x17), u8(0xa0), u8(0xc5),
		u8(0x43)])
	{
		assert false, 'last byte has wrong parity should return an error'
	} else {
		assert err.msg() == 'wrong parity'
	}
}

fn test_decode_eight_byte_message() {
	if res := decode_message([u8(0xc0), u8(0x00), u8(0x44), u8(0x66), u8(0x7d), u8(0x06), u8(0x78),
		u8(0x42), u8(0x21), u8(0x81)])
	{
		assert res == [u8(0xc0), u8(0x01), u8(0x13), u8(0x37), u8(0xc0), u8(0xde), u8(0x21), u8(0x21)]
	} else {
		assert false, 'eight byte message should not return an error'
	}
}

fn test_decode_twenty_byte_message() {
	if res := decode_message([u8(0x44), u8(0xbd), u8(0x18), u8(0xaf), u8(0x27), u8(0x1b), u8(0xa5),
		u8(0xe7), u8(0x6c), u8(0x90), u8(0x1b), u8(0x2e), u8(0x33), u8(0x03), u8(0x84), u8(0xee),
		u8(0x65), u8(0xb8), u8(0xdb), u8(0xed), u8(0xd7), u8(0x28), u8(0x84)])
	{
		assert res == [u8(0x45), u8(0x78), u8(0x65), u8(0x72), u8(0x63), u8(0x69), u8(0x73), u8(0x6d),
			u8(0x20), u8(0x69), u8(0x73), u8(0x20), u8(0x61), u8(0x77), u8(0x65), u8(0x73), u8(0x6f),
			u8(0x6d), u8(0x65), u8(0x21)]
	} else {
		assert false, 'twenty byte message should not return an error'
	}
}

fn test_wrong_parity_on_16th_byte() {
	if res := decode_message([u8(0x44), u8(0xbd), u8(0x18), u8(0xaf), u8(0x27), u8(0x1b), u8(0xa5),
		u8(0xe7), u8(0x6c), u8(0x90), u8(0x1b), u8(0x2e), u8(0x33), u8(0x03), u8(0x84), u8(0xef),
		u8(0x65), u8(0xb8), u8(0xdb), u8(0xed), u8(0xd7), u8(0x28), u8(0x84)])
	{
		assert false, 'wrong parity on 16th byte should return an error'
	} else {
		assert err.msg() == 'wrong parity'
	}
}
