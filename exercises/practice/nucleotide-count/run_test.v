module main

fn test_empty_strand() {
	if res := count_nucleotides('') {
		assert res == {
			'A': 0
			'C': 0
			'G': 0
			'T': 0
		}
	} else {
		assert false, "count_nucleotides('') should not return an error"
	}
}

fn test_can_count_one_nucleotide_in_single_character_input() {
	if res := count_nucleotides('G') {
		assert res == {
			'A': 0
			'C': 0
			'G': 1
			'T': 0
		}
	} else {
		assert false, "count_nucleotides('G') should not return an error"
	}
}

fn test_strand_with_repeated_nucleotide() {
	if res := count_nucleotides('GGGGGGG') {
		assert res == {
			'A': 0
			'C': 0
			'G': 7
			'T': 0
		}
	} else {
		assert false, "count_nucleotides('GGGGGGG') should not return an error"
	}
}

fn test_strand_with_multiple_nucleotides() {
	if res := count_nucleotides('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC') {
		assert res == {
			'A': 20
			'C': 12
			'G': 17
			'T': 21
		}
	} else {
		assert false, "count_nucleotides('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC') should not return an error"
	}
}

fn test_strand_with_invalid_nucleotides() {
	if res := count_nucleotides('AGXXACT') {
		assert false, 'strand with invalid nucleotides should return an error'
	} else {
		assert true
	}
}
