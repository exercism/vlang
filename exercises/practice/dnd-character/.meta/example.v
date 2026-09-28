module main

import rand

// A six sided die.
const die_sides = 6

// The number of dice rolled for a single ability.
const dice_per_ability = 4

// A character: the six ability scores it rolled and its starting hitpoints.
struct Character {
	strength     int
	dexterity    int
	constitution int
	intelligence int
	wisdom       int
	charisma     int
	hitpoints    int
}

// modifier is the ability modifier of an ability score: the score minus ten,
// halved and rounded down.
fn modifier(score int) int {
	offset := score - 10
	// V halves an integer division towards zero, so an odd negative offset
	// has to be rounded one step further down.
	if offset < 0 && offset % 2 != 0 {
		return (offset - 1) / 2
	}
	return offset / 2
}

// ability rolls four six sided dice and returns the sum of the largest three.
fn ability() int {
	mut dice := []int{len: dice_per_ability, init: 1}
	for i in 0 .. dice_per_ability {
		dice[i] = roll_die()
	}
	// The lowest of the four dice is dropped, so once the dice are sorted
	// the largest three are the last three.
	dice.sort()
	return dice[1] + dice[2] + dice[3]
}

// character rolls a fresh set of six ability scores and derives the starting
// hitpoints from the constitution score.
fn character() Character {
	constitution := ability()
	return Character{
		strength:     ability()
		dexterity:    ability()
		constitution: constitution
		intelligence: ability()
		wisdom:       ability()
		charisma:     ability()
		hitpoints:    10 + modifier(constitution)
	}
}

// roll_die returns a single die roll between 1 and die_sides.
fn roll_die() int {
	return (rand.intn(die_sides) or { 0 }) + 1
}
