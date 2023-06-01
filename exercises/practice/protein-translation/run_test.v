module main

fn test_empty_rna_sequence_results_in_no_proteins() {
	assert proteins('')! == []
}

fn test_methionine_rna_sequence() {
	assert proteins('AUG')! == ['Methionine']
}

fn test_phenylalanine_rna_sequence_1() {
	assert proteins('UUU')! == ['Phenylalanine']
}

fn test_phenylalanine_rna_sequence_2() {
	assert proteins('UUC')! == ['Phenylalanine']
}

fn test_leucine_rna_sequence_1() {
	assert proteins('UUA')! == ['Leucine']
}

fn test_leucine_rna_sequence_2() {
	assert proteins('UUG')! == ['Leucine']
}

fn test_serine_rna_sequence_1() {
	assert proteins('UCU')! == ['Serine']
}

fn test_serine_rna_sequence_2() {
	assert proteins('UCC')! == ['Serine']
}

fn test_serine_rna_sequence_3() {
	assert proteins('UCA')! == ['Serine']
}

fn test_serine_rna_sequence_4() {
	assert proteins('UCG')! == ['Serine']
}

fn test_tyrosine_rna_sequence_1() {
	assert proteins('UAU')! == ['Tyrosine']
}

fn test_tyrosine_rna_sequence_2() {
	assert proteins('UAC')! == ['Tyrosine']
}

fn test_cysteine_rna_sequence_1() {
	assert proteins('UGU')! == ['Cysteine']
}

fn test_cysteine_rna_sequence_2() {
	assert proteins('UGC')! == ['Cysteine']
}

fn test_tryptophan_rna_sequence() {
	assert proteins('UGG')! == ['Tryptophan']
}

fn test_stop_codon_rna_sequence_1() {
	assert proteins('UAA')! == []
}

fn test_stop_codon_rna_sequence_2() {
	assert proteins('UAG')! == []
}

fn test_stop_codon_rna_sequence_3() {
	assert proteins('UGA')! == []
}

fn test_sequence_of_two_protein_codons_translates_into_proteins() {
	assert proteins('UUUUUU')! == ['Phenylalanine', 'Phenylalanine']
}

fn test_sequence_of_two_different_protein_codons_translates_into_proteins() {
	assert proteins('UUAUUG')! == ['Leucine', 'Leucine']
}

fn test_translate_rna_strand_into_correct_protein_list() {
	assert proteins('AUGUUUUGG')! == ['Methionine', 'Phenylalanine', 'Tryptophan']
}

fn test_translation_stops_if_stop_codon_at_beginning_of_sequence() {
	assert proteins('UAGUGG')! == []
}

fn test_translation_stops_if_stop_codon_at_end_of_two_codon_sequence() {
	assert proteins('UGGUAG')! == ['Tryptophan']
}

fn test_translation_stops_if_stop_codon_at_end_of_three_codon_sequence() {
	assert proteins('AUGUUUUAA')! == ['Methionine', 'Phenylalanine']
}

fn test_translation_stops_if_stop_codon_in_middle_of_three_codon_sequence() {
	assert proteins('UGGUAGUGG')! == ['Tryptophan']
}

fn test_translation_stops_if_stop_codon_in_middle_of_six_codon_sequence() {
	assert proteins('UGGUGUUAUUAAUGGUUU')! == ['Tryptophan', 'Cysteine', 'Tyrosine']
}

fn test_non_existing_codon_cant_translate() {
	if res := proteins('AAA') {
		assert false, "Non-existing codon can't translate should return an error"
	} else {
		assert err.msg() == 'Invalid codon'
	}
}

fn test_unknown_amino_acids_not_part_of_a_codon_cant_translate() {
	if res := proteins('XYZ') {
		assert false, "Unknown amino acids, not part of a codon, can't translate should return an error"
	} else {
		assert err.msg() == 'Invalid codon'
	}
}

fn test_incomplete_rna_sequence_cant_translate() {
	if res := proteins('AUGU') {
		assert false, "Incomplete RNA sequence can't translate should return an error"
	} else {
		assert err.msg() == 'Invalid codon'
	}
}

fn test_incomplete_rna_sequence_can_translate_if_valid_until_a_stop_codon() {
	assert proteins('UUCUUCUAAUGGU')! == ['Phenylalanine', 'Phenylalanine']
}
