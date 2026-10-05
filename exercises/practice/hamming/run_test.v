module main

fn test_empty_strands() {
	if res := distance('', '') {
		assert res == 0
	} else {
		assert false, "distance('', '') should not return an error"
	}
}

fn test_single_letter_identical_strands() {
	if res := distance('A', 'A') {
		assert res == 0
	} else {
		assert false, "distance('A', 'A') should not return an error"
	}
}

fn test_single_letter_different_strands() {
	if res := distance('G', 'T') {
		assert res == 1
	} else {
		assert false, "distance('G', 'T') should not return an error"
	}
}

fn test_long_identical_strands() {
	if res := distance('GGACTGAAATCTG', 'GGACTGAAATCTG') {
		assert res == 0
	} else {
		assert false, "distance('GGACTGAAATCTG', 'GGACTGAAATCTG') should not return an error"
	}
}

fn test_long_different_strands() {
	if res := distance('GGACGGATTCTG', 'AGGACGGATTCT') {
		assert res == 9
	} else {
		assert false, "distance('GGACGGATTCTG', 'AGGACGGATTCT') should not return an error"
	}
}

fn test_disallow_first_strand_longer() {
	if res := distance('AATG', 'AAA') {
		assert false, 'disallow first strand longer should return an error'
	} else {
		assert err.msg() == 'lengths must match!'
	}
}

fn test_disallow_second_strand_longer() {
	if res := distance('ATA', 'AGTG') {
		assert false, 'disallow second strand longer should return an error'
	} else {
		assert err.msg() == 'lengths must match!'
	}
}

fn test_disallow_empty_first_strand() {
	if res := distance('', 'G') {
		assert false, 'disallow empty first strand should return an error'
	} else {
		assert err.msg() == 'lengths must match!'
	}
}

fn test_disallow_empty_second_strand() {
	if res := distance('G', '') {
		assert false, 'disallow empty second strand should return an error'
	} else {
		assert err.msg() == 'lengths must match!'
	}
}
