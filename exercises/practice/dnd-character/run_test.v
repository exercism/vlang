module main

// The lowest ability score four six sided dice can add up to.
const min_ability = 3

// The highest ability score four six sided dice can add up to.
const max_ability = 18

// rolls is how often a random case is exercised, because a single roll does
// not prove much.
const rolls = 1000

// ability_in_range reports whether `score` is a score that four six sided dice
// could have produced.
fn ability_in_range(score int) bool {
	return score >= min_ability && score <= max_ability
}

// score_of returns the `index`th ability score of `c`, counting from zero.
fn score_of(c Character, index int) int {
	scores := [
		c.strength,
		c.dexterity,
		c.constitution,
		c.intelligence,
		c.wisdom,
		c.charisma,
	]
	return scores[index]
}

fn test_ability_modifier_for_score_3_is_negative_4() {
	assert modifier(3) == -4
}

fn test_ability_modifier_for_score_4_is_negative_3() {
	assert modifier(4) == -3
}

fn test_ability_modifier_for_score_5_is_negative_3() {
	assert modifier(5) == -3
}

fn test_ability_modifier_for_score_6_is_negative_2() {
	assert modifier(6) == -2
}

fn test_ability_modifier_for_score_7_is_negative_2() {
	assert modifier(7) == -2
}

fn test_ability_modifier_for_score_8_is_negative_1() {
	assert modifier(8) == -1
}

fn test_ability_modifier_for_score_9_is_negative_1() {
	assert modifier(9) == -1
}

fn test_ability_modifier_for_score_10_is_0() {
	assert modifier(10) == 0
}

fn test_ability_modifier_for_score_11_is_0() {
	assert modifier(11) == 0
}

fn test_ability_modifier_for_score_12_is_1() {
	assert modifier(12) == 1
}

fn test_ability_modifier_for_score_13_is_1() {
	assert modifier(13) == 1
}

fn test_ability_modifier_for_score_14_is_2() {
	assert modifier(14) == 2
}

fn test_ability_modifier_for_score_15_is_2() {
	assert modifier(15) == 2
}

fn test_ability_modifier_for_score_16_is_3() {
	assert modifier(16) == 3
}

fn test_ability_modifier_for_score_17_is_3() {
	assert modifier(17) == 3
}

fn test_ability_modifier_for_score_18_is_4() {
	assert modifier(18) == 4
}

fn test_random_ability_is_within_range() {
	for _ in 0 .. rolls {
		score := ability()
		assert ability_in_range(score)
	}
}

fn test_random_character_is_valid() {
	for _ in 0 .. rolls {
		c := character()
		assert ability_in_range(c.strength)
		assert ability_in_range(c.dexterity)
		assert ability_in_range(c.constitution)
		assert ability_in_range(c.intelligence)
		assert ability_in_range(c.wisdom)
		assert ability_in_range(c.charisma)
		assert c.hitpoints == 10 + modifier(c.constitution)
	}
}

fn test_each_ability_is_only_calculated_once() {
	// Every ability is rolled in its own right, so across a batch of
	// characters no two abilities may be stuck together on one roll: each
	// pair of abilities has to differ in at least one of the characters.
	mut batch := []Character{cap: rolls}
	for _ in 0 .. rolls {
		batch << character()
	}
	for first in 0 .. 6 {
		for second in first + 1 .. 6 {
			mut differs_somewhere := false
			for c in batch {
				if score_of(c, first) != score_of(c, second) {
					differs_somewhere = true
				}
			}
			assert differs_somewhere
		}
	}
}
