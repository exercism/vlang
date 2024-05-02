module main

fn test_slices_of_one_from_one() {
	expected := ['1']
	assert slices('1', 1)! == expected
}

fn test_slices_of_one_from_two() {
	expected := ['1', '2']
	assert slices('12', 1)! == expected
}

fn test_slices_of_two() {
	expected := ['35']
	assert slices('35', 2)! == expected
}

fn test_slices_of_two_overlap() {
	expected := ['91', '14', '42']
	assert slices('9142', 2)! == expected
}

fn test_slices_can_include_duplicates() {
	expected := ['777', '777', '777', '777']
	assert slices('777777', 3)! == expected
}

fn test_slices_of_a_long_series() {
	expected := ['91849', '18493', '84939', '49390', '93904', '39042', '90424', '04243']
	assert slices('918493904243', 5)! == expected
}

fn test_slice_length_is_too_large() {
	if res := slices('12345', 6) {
		assert false, 'slice length too large should return an error'
	} else {
		assert err.msg() == 'slice length cannot be greater than series length'
	}
}

fn test_slice_length_is_way_too_large() {
	if res := slices('12345', 42) {
		assert false, 'slice length way too large should return an error'
	} else {
		assert err.msg() == 'slice length cannot be greater than series length'
	}
}

fn test_slice_length_cannot_be_zero() {
	if res := slices('12345', 0) {
		assert false, 'slice length cannot be zero should return an error'
	} else {
		assert err.msg() == 'slice length cannot be zero'
	}
}

fn test_slice_length_cannot_be_negative() {
	if res := slices('123', -1) {
		assert false, 'slice length cannot be negative should return an error'
	} else {
		assert err.msg() == 'slice length cannot be negative'
	}
}

fn test_empty_series_is_invalid() {
	if res := slices('', 1) {
		assert false, 'empty series invalid should return an error'
	} else {
		assert err.msg() == 'series cannot be empty'
	}
}
