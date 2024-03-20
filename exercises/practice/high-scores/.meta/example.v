module main

import arrays

type HighScores = []int

// build a new HighScores
pub fn HighScores.new(scores []int) HighScores {
	return scores.clone()
}

pub fn (mut high_scores HighScores) scores() []int {
	return high_scores
}

pub fn (mut high_scores HighScores) latest() int {
	return high_scores.last()
}

pub fn (mut high_scores HighScores) personal_best() int {
	return arrays.max(high_scores) or { 0 }
}

pub fn (mut high_scores HighScores) personal_top_three() []int {
	mut result := high_scores.sorted(b < a)
	result.trim(3)
	return result
}
