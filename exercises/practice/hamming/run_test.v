module main

fn test_empty_strings() {
	assert distance('', '')! == 0
}

fn test_single_identical_characters() {
	assert distance('A', 'A')! == 0
}

fn test_single_different_characters() {
	assert distance('G', 'T')! == 1
}

fn test_long_identical_strings() {
	assert distance('GGACTGAAATCTG', 'GGACTGAAATCTG')! == 0
}

fn test_long_different_strings() {
	assert distance('GGACGGATTCTG', 'AGGACGGATTCT')! == 9
}

fn test_longer_first_string() {
	if res := distance('AATG', 'AAA') {
		assert false, 'mismatched lengths should return an error'
	} else {
		assert err.msg() == 'lengths must match!'
	}
}

fn test_longer_second_string() {
	if res := distance('ATA', 'AGTG') {
		assert false, 'mismatched lengths should return an error'
	} else {
		assert err.msg() == 'lengths must match!'
	}
}

fn test_only_left_string_empty() {
	if res := distance('', 'G') {
		assert false, 'mismatched lengths should return an error'
	} else {
		assert err.msg() == 'lengths must match!'
	}
}

fn test_only_right_string_empty() {
	if res := distance('G', '') {
		assert false, 'mismatched lengths should return an error'
	} else {
		assert err.msg() == 'lengths must match!'
	}
}
