module main

fn count_nucleotides(strand string) !map[string]int {
	mut total_counts := {
		'A': 0
		'C': 0
		'G': 0
		'T': 0
	}
	for letter in strand {
		letter_str := letter.ascii_str()
		if letter_str in total_counts {
			total_counts[letter_str] += 1
		} else {
			return error('${letter_str} is not a valid nucleotide!')
		}
	}
	return total_counts
}
