module main

fn test_empty_rna_sequence() {
	assert to_rna('') == ''
}

fn test_rna_complement_of_cytosine_is_guanine() {
	assert to_rna('C') == 'G'
}

fn test_rna_complement_of_guanine_is_cytosine() {
	assert to_rna('G') == 'C'
}

fn test_rna_complement_of_thymine_is_adenine() {
	assert to_rna('T') == 'A'
}

fn test_rna_complement_of_adenine_is_uracil() {
	assert to_rna('A') == 'U'
}

fn test_rna_complement() {
	assert to_rna('ACGTGGTCTTAA') == 'UGCACCAGAAUU'
}
