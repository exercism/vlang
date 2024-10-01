module main

import arrays

enum Category as u8 {
	yacht
	ones
	twos
	threes
	fours
	fives
	sixes
	full_house
	four_of_a_kind
	little_straight
	big_straight
	choice
}

fn score(category Category, rolls []u8) int {
	return match category {
		.yacht { score_yacht(rolls) }
		.ones { score_num(rolls, 1) }
		.twos { score_num(rolls, 2) }
		.threes { score_num(rolls, 3) }
		.fours { score_num(rolls, 4) }
		.fives { score_num(rolls, 5) }
		.sixes { score_num(rolls, 6) }
		.full_house { score_full_house(rolls) }
		.four_of_a_kind { score_four_of_a_kind(rolls) }
		.little_straight { score_ordered_matches(rolls, [u8(1), 2, 3, 4, 5]) }
		.big_straight { score_ordered_matches(rolls, [u8(2), 3, 4, 5, 6]) }
		.choice { sum(rolls) }
	}
}

fn score_yacht(rolls []u8) int {
	unique := arrays.uniq(rolls)
	if unique.len > 1 {
		return 0
	}
	return 50
}

fn score_num(rolls []u8, req u8) int {
	mut score := 0
	for r in rolls {
		if r == req {
			score += r
		}
	}
	return score
}

fn score_full_house(rolls []u8) int {
	roll_counts := counts(rolls).values()
	if roll_counts != [u8(2), 3] && roll_counts != [u8(3), 2] {
		return 0
	}

	return sum(rolls)
}

fn score_four_of_a_kind(rolls []u8) int {
	mut score := 0
	roll_counts := counts(rolls)
	for n, count in roll_counts {
		if count >= 4 {
			score += 4 * n
		}
	}
	return score
}

fn score_ordered_matches(rolls []u8, req []u8) int {
	if rolls.sorted() != req {
		return 0
	}
	return 30
}

fn sum(nums []u8) int {
	mut sum := 0
	for n in nums {
		sum += n
	}
	return sum
}

fn counts(rolls []u8) map[u8]u8 {
	mut counts := map[u8]u8{}
	for r in rolls {
		counts[r] += 1
	}
	return counts
}
