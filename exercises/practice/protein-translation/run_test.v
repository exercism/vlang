module main

fn test_empty_rna_sequence_results_in_no_proteins() {
	if res := proteins('') {
		assert res == []
	} else {
		assert false, "proteins('') should not return an error"
	}
}

fn test_methionine_rna_sequence() {
	if res := proteins('AUG') {
		assert res == ['Methionine']
	} else {
		assert false, "proteins('AUG') should not return an error"
	}
}

fn test_phenylalanine_rna_sequence_1() {
	if res := proteins('UUU') {
		assert res == ['Phenylalanine']
	} else {
		assert false, "proteins('UUU') should not return an error"
	}
}

fn test_phenylalanine_rna_sequence_2() {
	if res := proteins('UUC') {
		assert res == ['Phenylalanine']
	} else {
		assert false, "proteins('UUC') should not return an error"
	}
}

fn test_leucine_rna_sequence_1() {
	if res := proteins('UUA') {
		assert res == ['Leucine']
	} else {
		assert false, "proteins('UUA') should not return an error"
	}
}

fn test_leucine_rna_sequence_2() {
	if res := proteins('UUG') {
		assert res == ['Leucine']
	} else {
		assert false, "proteins('UUG') should not return an error"
	}
}

fn test_serine_rna_sequence_1() {
	if res := proteins('UCU') {
		assert res == ['Serine']
	} else {
		assert false, "proteins('UCU') should not return an error"
	}
}

fn test_serine_rna_sequence_2() {
	if res := proteins('UCC') {
		assert res == ['Serine']
	} else {
		assert false, "proteins('UCC') should not return an error"
	}
}

fn test_serine_rna_sequence_3() {
	if res := proteins('UCA') {
		assert res == ['Serine']
	} else {
		assert false, "proteins('UCA') should not return an error"
	}
}

fn test_serine_rna_sequence_4() {
	if res := proteins('UCG') {
		assert res == ['Serine']
	} else {
		assert false, "proteins('UCG') should not return an error"
	}
}

fn test_tyrosine_rna_sequence_1() {
	if res := proteins('UAU') {
		assert res == ['Tyrosine']
	} else {
		assert false, "proteins('UAU') should not return an error"
	}
}

fn test_tyrosine_rna_sequence_2() {
	if res := proteins('UAC') {
		assert res == ['Tyrosine']
	} else {
		assert false, "proteins('UAC') should not return an error"
	}
}

fn test_cysteine_rna_sequence_1() {
	if res := proteins('UGU') {
		assert res == ['Cysteine']
	} else {
		assert false, "proteins('UGU') should not return an error"
	}
}

fn test_cysteine_rna_sequence_2() {
	if res := proteins('UGC') {
		assert res == ['Cysteine']
	} else {
		assert false, "proteins('UGC') should not return an error"
	}
}

fn test_tryptophan_rna_sequence() {
	if res := proteins('UGG') {
		assert res == ['Tryptophan']
	} else {
		assert false, "proteins('UGG') should not return an error"
	}
}

fn test_stop_codon_rna_sequence_1() {
	if res := proteins('UAA') {
		assert res == []
	} else {
		assert false, "proteins('UAA') should not return an error"
	}
}

fn test_stop_codon_rna_sequence_2() {
	if res := proteins('UAG') {
		assert res == []
	} else {
		assert false, "proteins('UAG') should not return an error"
	}
}

fn test_stop_codon_rna_sequence_3() {
	if res := proteins('UGA') {
		assert res == []
	} else {
		assert false, "proteins('UGA') should not return an error"
	}
}

fn test_sequence_of_two_protein_codons_translates_into_proteins() {
	if res := proteins('UUUUUU') {
		assert res == ['Phenylalanine', 'Phenylalanine']
	} else {
		assert false, "proteins('UUUUUU') should not return an error"
	}
}

fn test_sequence_of_two_different_protein_codons_translates_into_proteins() {
	if res := proteins('UUAUUG') {
		assert res == ['Leucine', 'Leucine']
	} else {
		assert false, "proteins('UUAUUG') should not return an error"
	}
}

fn test_translate_rna_strand_into_correct_protein_list() {
	if res := proteins('AUGUUUUGG') {
		assert res == ['Methionine', 'Phenylalanine', 'Tryptophan']
	} else {
		assert false, "proteins('AUGUUUUGG') should not return an error"
	}
}

fn test_translation_stops_if_stop_codon_at_beginning_of_sequence() {
	if res := proteins('UAGUGG') {
		assert res == []
	} else {
		assert false, "proteins('UAGUGG') should not return an error"
	}
}

fn test_translation_stops_if_stop_codon_at_end_of_two_codon_sequence() {
	if res := proteins('UGGUAG') {
		assert res == ['Tryptophan']
	} else {
		assert false, "proteins('UGGUAG') should not return an error"
	}
}

fn test_translation_stops_if_stop_codon_at_end_of_three_codon_sequence() {
	if res := proteins('AUGUUUUAA') {
		assert res == ['Methionine', 'Phenylalanine']
	} else {
		assert false, "proteins('AUGUUUUAA') should not return an error"
	}
}

fn test_translation_stops_if_stop_codon_in_middle_of_three_codon_sequence() {
	if res := proteins('UGGUAGUGG') {
		assert res == ['Tryptophan']
	} else {
		assert false, "proteins('UGGUAGUGG') should not return an error"
	}
}

fn test_translation_stops_if_stop_codon_in_middle_of_six_codon_sequence() {
	if res := proteins('UGGUGUUAUUAAUGGUUU') {
		assert res == ['Tryptophan', 'Cysteine', 'Tyrosine']
	} else {
		assert false, "proteins('UGGUGUUAUUAAUGGUUU') should not return an error"
	}
}

fn test_sequence_of_two_non_stop_codons_does_not_translate_to_a_stop_codon() {
	if res := proteins('AUGAUG') {
		assert res == ['Methionine', 'Methionine']
	} else {
		assert false, "proteins('AUGAUG') should not return an error"
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
	if res := proteins('UUCUUCUAAUGGU') {
		assert res == ['Phenylalanine', 'Phenylalanine']
	} else {
		assert false, "proteins('UUCUUCUAAUGGU') should not return an error"
	}
}
