module main

// solve solves an alphametics puzzle such as `SEND + MORE == MONEY` and returns
// the digit of every letter, or none when the puzzle has no solution.
fn solve(puzzle string) ?map[string]int {
	halves := puzzle.replace(' ', '').split('==')
	if halves.len != 2 {
		return none
	}
	mut words := halves[0].split('+').map(it.bytes())
	words << halves[1].bytes()
	mut solver := Solver{
		addends: words[..words.len - 1].clone()
		sum:     words[words.len - 1]
		values:  map[u8]int{}
	}
	for word in words {
		if word.len == 0 {
			return none
		}
		if word.len > solver.width {
			solver.width = word.len
		}
		// Only the first letter of a word may not stand for a zero.
		if !solver.leading.contains(word[0]) {
			solver.leading << word[0]
		}
	}
	if !solver.solve_column(0, 0) {
		return none
	}
	return solver.answer()
}

// An alphametics puzzle, together with the digits that have been handed out
// while it is being solved.
struct Solver {
mut:
	// The words that are added up, and the word they add up to.
	addends [][]u8
	sum     []u8
	// The length of the longest word.
	width int
	// The letters that start a word, which may not stand for a zero.
	leading []u8
	// The digit of every letter that has been given one.
	values map[u8]int
	// The digits that are taken already.
	used [10]bool
}

// digit returns the digit of `letter`, or -1 when it has none yet.
fn (s &Solver) digit(letter u8) int {
	return s.values[letter] or { -1 }
}

// answer returns the solution keyed by the letters of the puzzle.
fn (s &Solver) answer() map[string]int {
	mut answer := map[string]int{}
	for letter, digit in s.values {
		answer[letter.ascii_str()] = digit
	}
	return answer
}

// solve_column hands out the digits of the column `column`, counted from the
// right, and moves on to the next column once the column adds up.
//
// > returns true when every column adds up, which means the puzzle is solved
fn (mut s Solver) solve_column(column int, carry int) bool {
	if column >= s.width {
		return carry == 0
	}
	mut letters := []u8{}
	for word in s.addends {
		if column < word.len {
			letter := word[word.len - 1 - column]
			if !letters.contains(letter) {
				letters << letter
			}
		}
	}
	// A letter is never 0, so 0 stands for "this column has no digit in the
	// sum", which happens when the sum is shorter than the addends.
	mut sum_letter := u8(0)
	if column < s.sum.len {
		sum_letter = s.sum[s.sum.len - 1 - column]
	}
	return s.solve_letters(letters, 0, carry, sum_letter, column)
}

// solve_letters gives every letter of one column a free digit, one letter per
// step, and checks the digit of the sum once they all have one. Letters that
// already have a digit from an earlier column are skipped.
//
// > returns true when this column and every column after it add up
fn (mut s Solver) solve_letters(letters []u8, index int, carry int, sum_letter u8, column int) bool {
	if index < letters.len {
		letter := letters[index]
		if s.digit(letter) != -1 {
			return s.solve_letters(letters, index + 1, carry, sum_letter, column)
		}
		for digit in 0 .. 10 {
			if s.used[digit] || (digit == 0 && s.leading.contains(letter)) {
				continue
			}
			s.values[letter] = digit
			s.used[digit] = true
			if s.solve_letters(letters, index + 1, carry, sum_letter, column) {
				return true
			}
			s.values.delete(letter)
			s.used[digit] = false
		}
		return false
	}
	mut total := carry
	for word in s.addends {
		if column < word.len {
			total += s.digit(word[word.len - 1 - column])
		}
	}
	// The sum is shorter than the addends, so nothing may be left over here.
	if sum_letter == 0 {
		return total == 0
	}
	digit := total % 10
	summed := s.digit(sum_letter)
	if summed != -1 {
		// The sum letter already has a digit from an earlier column.
		return summed == digit && s.solve_column(column + 1, total / 10)
	}
	if s.used[digit] || (digit == 0 && s.leading.contains(sum_letter)) {
		return false
	}
	s.values[sum_letter] = digit
	s.used[digit] = true
	if s.solve_column(column + 1, total / 10) {
		return true
	}
	s.values.delete(sum_letter)
	s.used[digit] = false
	return false
}
