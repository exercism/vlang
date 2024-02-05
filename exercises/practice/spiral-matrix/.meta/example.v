module main

fn spiral_matrix(size int) [][]int {
	mut result := [][]int{len: size}
	for i in 0 .. size {
		result[i] = []int{len: size, init: size * size}
	}

	mut value := 1
	mut row := 0
	mut column := 0
	mut side_length := size - 1
	for side_length >= 1 {
		for _ in 0 .. side_length {
			result[row][column] = value++
			column++
		}
		for _ in 0 .. side_length {
			result[row][column] = value++
			row++
		}
		for _ in 0 .. side_length {
			result[row][column] = value++
			column--
		}
		for _ in 0 .. side_length {
			result[row][column] = value++
			row--
		}
		row++
		column++
		side_length -= 2
	}

	return result
}
