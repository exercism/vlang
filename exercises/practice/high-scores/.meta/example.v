module main

struct HighScores {
	scores []int
}

// build a new HighScores
pub fn HighScores.new(scores []int) HighScores {
	return HighScores{
		scores: scores
	}
}

pub fn (mut high_scores HighScores) scores() []int {
	return high_scores.scores
}

pub fn (mut high_scores HighScores) latest() int {
	return high_scores.scores.last()
}

pub fn (mut high_scores HighScores) personal_best() int {
	mut sorted := high_scores.scores.clone()
	sorted.sort()
	return sorted.last()
}

pub fn (mut high_scores HighScores) personal_top_three() []int {
	mut sorted := high_scores.scores.clone()
	sorted.sort()
	if sorted.len > 3 {
		sorted.drop(sorted.len - 3)
	}
	return sorted.reverse()
}
