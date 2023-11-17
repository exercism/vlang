module main

fn test_empty_rna() {
	assert to_rna('') == ''
}

fn test_cytosine_to_guanine() {
	assert to_rna('C') == 'G'
}

fn test_guanine_to_cytosine() {
	assert to_rna('G') == 'C'
}

fn test_thymine_to_adenine() {
	assert to_rna('T') == 'A'
}

fn test_adenine_to_uracial() {
	assert to_rna('A') == 'U'
}

fn test_rna_complement() {
	assert to_rna('ACGTGGTCTTAA') == 'UGCACCAGAAUU'
}
