module main

fn test_empty_strand() {
	assert count_nucleotides('')! == {
		'A': 0
		'C': 0
		'G': 0
		'T': 0
	}
}

fn test_one_character_strand() {
	assert count_nucleotides('G')! == {
		'A': 0
		'C': 0
		'G': 1
		'T': 0
	}
}

fn test_repeated_character_strand() {
	assert count_nucleotides('GGGGGGG')! == {
		'A': 0
		'C': 0
		'G': 7
		'T': 0
	}
}

fn test_multiple_character_strand() {
	assert count_nucleotides('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC')! == {
		'A': 20
		'C': 12
		'G': 17
		'T': 21
	}
}

fn test_invalid_character_strand() {
	if res := count_nucleotides('AGXXACT') {
		assert false, 'invalid characters should return an error'
	} else {
		assert err.msg() == 'X is not a valid nucleotide!'
	}
}
