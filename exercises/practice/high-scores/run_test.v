module main

fn test_list_of_scores() {
	mut high_scores := HighScores.new([30, 50, 20, 70])
	expect := [30, 50, 20, 70]
	assert high_scores.scores() == expect
}

fn test_latest_score() {
	mut high_scores := HighScores.new([100, 0, 90, 30])
	assert high_scores.latest() == 30
}

fn test_personal_best() {
	mut high_scores := HighScores.new([40, 100, 70])
	assert high_scores.personal_best() == 100
}

fn test_top_3_scores__personal_top_three_from_a_list_of_scores() {
	mut high_scores := HighScores.new([10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70])
	expect := [100, 90, 70]
	assert high_scores.personal_top_three() == expect
}

fn test_top_3_scores__personal_top_highest_to_lowest() {
	mut high_scores := HighScores.new([20, 10, 30])
	expect := [30, 20, 10]
	assert high_scores.personal_top_three() == expect
}

fn test_top_3_scores__personal_top_when_there_is_a_tie() {
	mut high_scores := HighScores.new([40, 20, 40, 30])
	expect := [40, 40, 30]
	assert high_scores.personal_top_three() == expect
}

fn test_top_3_scores__personal_top_when_there_are_less_than_3() {
	mut high_scores := HighScores.new([30, 70])
	expect := [70, 30]
	assert high_scores.personal_top_three() == expect
}

fn test_top_3_scores__personal_top_when_there_is_only_one() {
	mut high_scores := HighScores.new([40])
	expect := [40]
	assert high_scores.personal_top_three() == expect
}

fn test_top_3_scores__latest_score_after_personal_top_scores() {
	mut high_scores := HighScores.new([70, 50, 20, 30])
	high_scores.personal_top_three()
	assert high_scores.latest() == 30
}

fn test_top_3_scores__scores_after_personal_top_scores() {
	mut high_scores := HighScores.new([30, 50, 20, 70])
	high_scores.personal_top_three()
	expect := [30, 50, 20, 70]
	assert high_scores.scores() == expect
}

fn test_top_3_scores__latest_score_after_personal_best() {
	mut high_scores := HighScores.new([20, 70, 15, 25, 30])
	high_scores.personal_best()
	assert high_scores.latest() == 30
}

fn test_top_3_scores__scores_after_personal_best() {
	mut high_scores := HighScores.new([20, 70, 15, 25, 30])
	high_scores.personal_best()
	expect := [20, 70, 15, 25, 30]
	assert high_scores.scores() == expect
}
