module main

import strconv

fn add(a int, b int) int {
	return a + b
}

fn subtract(a int, b int) int {
	return a - b
}

fn multiply(a int, b int) int {
	return a * b
}

fn divide(a int, b int) int {
	return a / b
}

fn answer(question string) ?int {
	if question.index_u8(u8(`?`)) + 1 != question.len {
		return none
	}

	words := question#[0..-1].split(' ')
	if words.len < 3 || words[0] != 'What' || words[1] != 'is' {
		return none
	}
	mut index := 2

	mut a := 0
	mut operation := add
	for index != words.len && index + 2 != words.len {
		b := strconv.atoi(words[index]) or { return none }
		a = operation(a, b)
		index++
		if index == words.len {
			return a
		}

		operation = match words[index] {
			'plus' { add }
			'minus' { subtract }
			'multiplied' { multiply }
			'divided' { divide }
			else { return none }
		}
		index++

		if operation == multiply || operation == divide {
			if words[index] != 'by' {
				return none
			}
			index++
		}
	}
	return none
}
