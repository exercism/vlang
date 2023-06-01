module main

// Protein synthesized for codon.
const translation = {
	'AUG': 'Methionine'
	'UUU': 'Phenylalanine'
	'UUC': 'Phenylalanine'
	'UUA': 'Leucine'
	'UUG': 'Leucine'
	'UCU': 'Serine'
	'UCC': 'Serine'
	'UCA': 'Serine'
	'UCG': 'Serine'
	'UAU': 'Tyrosine'
	'UAC': 'Tyrosine'
	'UGU': 'Cysteine'
	'UGC': 'Cysteine'
	'UGG': 'Tryptophan'
	'UAA': 'STOP'
	'UAG': 'STOP'
	'UGA': 'STOP'
}

fn proteins(strand string) ![]string {
	mut result := []string{}
	mut iter := ChunkIterator{
		str: strand
		chunk_size: 3
	}
	for codon in iter {
		protein := translation[codon] or { return error('Invalid codon') }

		if protein == 'STOP' {
			break
		}
		result << protein
	}
	return result
}

// Inspired by https://doc.rust-lang.org/std/slice/struct.Chunks.html
struct ChunkIterator {
	str        string
	chunk_size int
mut:
	chunk_start int
}

fn (mut iter ChunkIterator) next() ?string {
	if iter.str.len <= iter.chunk_start {
		return none
	}

	// When the string cannot be evenly divided by the chunk size, the last slice of the iteration will be the remainder.
	chunk_end := iter.chunk_start + iter.chunk_size

	defer {
		iter.chunk_start = chunk_end
	}
	return iter.str.substr_ni(iter.chunk_start, chunk_end)
}
