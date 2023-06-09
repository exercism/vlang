module main

fn test_zero() {
	integers := [u32(0x0)]
	expected := [u8(0x0)]
	assert encode(integers) == expected
}

fn test_arbitrary_single_byte() {
	integers := [u32(0x40)]
	expected := [u8(0x40)]
	assert encode(integers) == expected
}

fn test_largest_single_byte() {
	integers := [u32(0x7f)]
	expected := [u8(0x7f)]
	assert encode(integers) == expected
}

fn test_smallest_double_byte() {
	integers := [u32(0x80)]
	expected := [u8(0x81), 0x0]
	assert encode(integers) == expected
}

fn test_arbitrary_double_byte() {
	integers := [u32(0x2000)]
	expected := [u8(0xc0), 0x0]
	assert encode(integers) == expected
}

fn test_largest_double_byte() {
	integers := [u32(0x3fff)]
	expected := [u8(0xff), 0x7f]
	assert encode(integers) == expected
}

fn test_smallest_triple_byte() {
	integers := [u32(0x4000)]
	expected := [u8(0x81), 0x80, 0x0]
	assert encode(integers) == expected
}

fn test_arbitrary_triple_byte() {
	integers := [u32(0x100000)]
	expected := [u8(0xc0), 0x80, 0x0]
	assert encode(integers) == expected
}

fn test_largest_triple_byte() {
	integers := [u32(0x1fffff)]
	expected := [u8(0xff), 0xff, 0x7f]
	assert encode(integers) == expected
}

fn test_smallest_quadruple_byte() {
	integers := [u32(0x200000)]
	expected := [u8(0x81), 0x80, 0x80, 0x0]
	assert encode(integers) == expected
}

fn test_arbitrary_quadruple_byte() {
	integers := [u32(0x8000000)]
	expected := [u8(0xc0), 0x80, 0x80, 0x0]
	assert encode(integers) == expected
}

fn test_largest_quadruple_byte() {
	integers := [u32(0xfffffff)]
	expected := [u8(0xff), 0xff, 0xff, 0x7f]
	assert encode(integers) == expected
}

fn test_smallest_quintuple_byte() {
	integers := [u32(0x10000000)]
	expected := [u8(0x81), 0x80, 0x80, 0x80, 0x0]
	assert encode(integers) == expected
}

fn test_arbitrary_quintuple_byte() {
	integers := [u32(0xff000000)]
	expected := [u8(0x8f), 0xf8, 0x80, 0x80, 0x0]
	assert encode(integers) == expected
}

fn test_maximum_32_bit_integer_input() {
	integers := [u32(0xffffffff)]
	expected := [u8(0x8f), 0xff, 0xff, 0xff, 0x7f]
	assert encode(integers) == expected
}

fn test_two_single_byte_values() {
	integers := [u32(0x40), 0x7f]
	expected := [u8(0x40), 0x7f]
	assert encode(integers) == expected
}

fn test_two_multi_byte_values() {
	integers := [u32(0x4000), 0x123456]
	expected := [u8(0x81), 0x80, 0x0, 0xc8, 0xe8, 0x56]
	assert encode(integers) == expected
}

fn test_many_multi_byte_values() {
	integers := [u32(0x2000), 0x123456, 0xfffffff, 0x0, 0x3fff, 0x4000]
	expected := [u8(0xc0), 0x0, 0xc8, 0xe8, 0x56, 0xff, 0xff, 0xff, 0x7f, 0x0, 0xff, 0x7f, 0x81,
		0x80, 0x0]
	assert encode(integers) == expected
}

fn test_one_byte() {
	integers := [u8(0x7f)]
	expected := [u32(0x7f)]
	assert decode(integers)! == expected
}

fn test_two_bytes() {
	integers := [u8(0xc0), 0x0]
	expected := [u32(0x2000)]
	assert decode(integers)! == expected
}

fn test_three_bytes() {
	integers := [u8(0xff), 0xff, 0x7f]
	expected := [u32(0x1fffff)]
	assert decode(integers)! == expected
}

fn test_four_bytes() {
	integers := [u8(0x81), 0x80, 0x80, 0x0]
	expected := [u32(0x200000)]
	assert decode(integers)! == expected
}

fn test_maximum_32_bit_integer() {
	integers := [u8(0x8f), 0xff, 0xff, 0xff, 0x7f]
	expected := [u32(0xffffffff)]
	assert decode(integers)! == expected
}

fn test_incomplete_sequence_causes_error() {
	integers := [u8(0xff)]
	if res := decode(integers) {
		assert false, 'incomplete sequence should return an error'
	} else {
		assert err.msg() == 'incomplete sequence'
	}
}

fn test_incomplete_sequence_causes_error_even_if_value_is_zero() {
	integers := [u8(0x80)]
	if res := decode(integers) {
		assert false, 'incomplete sequence, even if value zero, should return an error'
	} else {
		assert err.msg() == 'incomplete sequence'
	}
}

fn test_multiple_values() {
	integers := [u8(0xc0), 0x0, 0xc8, 0xe8, 0x56, 0xff, 0xff, 0xff, 0x7f, 0x0, 0xff, 0x7f, 0x81,
		0x80, 0x0]
	expected := [u32(0x2000), 0x123456, 0xfffffff, 0x0, 0x3fff, 0x4000]
	assert decode(integers)! == expected
}
