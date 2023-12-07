module main

import strconv

fn row(str string, index int) []int {
	line := str.split('\n')[index - 1]
	return line.split(' ').map(fn (s string) int {
		return strconv.atoi(s) or { 0 }
	})
}

fn column(str string, index int) []int {
	lines := str.split('\n')
	return lines.map(fn [index] (line string) int {
		return strconv.atoi(line.split(' ')[index - 1]) or { 0 }
	})
}
