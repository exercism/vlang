module main

fn to_rna(dna string) string {
	replace_vals := ['G', 'C', 'C', 'G', 'T', 'A', 'A', 'U']
	return dna.replace_each(replace_vals)
}
