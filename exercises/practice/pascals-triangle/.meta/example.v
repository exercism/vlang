module main

import arrays { sum, window }

/*
The 'magic' is performed in the `next_row` function. Say the input is
row 3: [1, 2, 1]

	- Add '0' to either end: -> [0, 1, 2, 1, 0]
	- arrays.window([0, 1, 2, 1, 0]) -> [[0, 1], [1, 2], [2, 1], [1, 0]]
	- apply `sum` to each sub-list, which yields: [1, 3, 3, 1] i.e. row 4
*/

// derive the next row from the current row
fn next_row(current []int) []int {
	mut next := current.clone()
	next.prepend(0)
	next << 0

	return window(next, size: 2).map(sum(it) or { 0 })
}

pub fn rows(height int) [][]int {
	assert height >= 0
	mut triangle := [][]int{cap: height}

	if height == 0 {
		return triangle
	}

	mut first_row := [1]
	triangle << first_row

	for _ in 1 .. height {
		triangle << next_row(triangle.last())
	}

	return triangle
}
