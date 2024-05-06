module main

fn find_anagrams(subject string, candidates []string) []string {
	mut result := []string{cap: candidates.len}
	mut subject_runes := subject.to_lower().runes()
	subject_runes.sort()
	for candidate in candidates {
		if candidate.to_lower() == subject.to_lower() {
			continue
		}
		mut candidate_runes := candidate.to_lower().runes()
		candidate_runes.sort()
		if candidate_runes == subject_runes {
			result << candidate
		}
	}
	return result
}
