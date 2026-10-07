module main

fn test_empty_strand() {
	assert count_nucleotides('')! == {
		'A': 0
		'C': 0
		'G': 0
		'T': 0
	}
}

fn test_can_count_one_nucleotide_in_single_character_input() {
	assert count_nucleotides('G')! == {
		'A': 0
		'C': 0
		'G': 1
		'T': 0
	}
}

fn test_strand_with_repeated_nucleotide() {
	assert count_nucleotides('GGGGGGG')! == {
		'A': 0
		'C': 0
		'G': 7
		'T': 0
	}
}

fn test_strand_with_multiple_nucleotides() {
	assert count_nucleotides('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC')! == {
		'A': 20
		'C': 12
		'G': 17
		'T': 21
	}
}

fn test_strand_with_invalid_nucleotides() {
	if res := count_nucleotides('AGXXACT') {
		assert false, 'strand with invalid nucleotides should return an error'
	} else {
		assert true
	}
}
