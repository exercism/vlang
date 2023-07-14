module main

// Search for combinations, appending them to solutions.
// current is used for the combination we are currently considering, possibly
// with some numbers already chosen. The remaining size numbers will have the
// required sum, and each be greater than or equal to the starting value.
fn search(sum int, size int, starting int, exclude []int, mut current []int, mut solutions [][]int) {
	if starting * size + size * (size - 1) / 2 > sum || 9 * size - size * (size - 1) / 2 < sum {
		// It is not possible to achieve the desired sum.
		return
	}

	if size == 0 {
		solutions << current.clone()
		return
	}

	for number in starting .. 10 {
		if exclude.contains(number) {
			continue
		}
		current << number
		search(sum - number, size - 1, number + 1, exclude, mut &current, mut &solutions)
		current.delete_last()
	}
}

fn combinations(sum int, size int, exclude []int) [][]int {
	mut solutions := [][]int{}
	mut current := []int{cap: size}
	search(sum, size, 1, exclude, mut &current, mut &solutions)
	return solutions
}
