module main

fn row(str string, index int) []int {
	line := str.split_into_lines()[index - 1]
	return line.split(' ').map(fn (s string) int {
		return s.int()
	})
}

fn column(str string, index int) []int {
	lines := str.split_into_lines()
	return lines.map(fn [index] (line string) int {
		return line.split(' ')[index - 1].int()
	})
}
