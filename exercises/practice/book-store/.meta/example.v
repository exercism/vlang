module main

import math

fn total(basket []int) int {
	mut tally := [0, 0, 0, 0, 0]
	for book in basket {
		tally[book - 1]++
	}
	tally.sort()

	mut five := tally[0]
	mut four := tally[1] - tally[0]
	mut three := tally[2] - tally[1]
	two := tally[3] - tally[2]
	one := tally[4] - tally[3]

	// Two groups of four are cheaper than a group of five plus a group of three.
	adjustment := math.min(three, five)
	five -= adjustment
	three -= adjustment
	four += 2 * adjustment

	return 5 * five * 600 + 4 * four * 640 + 3 * three * 720 + 2 * two * 760 + 1 * one * 800
}
