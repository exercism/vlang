module main

fn tick(matrix [][]int) [][]int {
	if matrix.len == 0 {
		return matrix
	}
	mut result := [][]int{len: matrix.len, init: []int{len: matrix[0].len}}
	for i in 0 .. matrix.len {
		for j in 0 .. matrix[0].len {
			mut live_neighbors := 0
			for di in -1 .. 2 {
				ni := i + di
				if ni < 0 || ni >= matrix.len {
					continue
				}
				for dj in -1 .. 2 {
					nj := j + dj
					if nj < 0 || nj >= matrix[0].len {
						continue
					}
					if di == 0 && dj == 0 {
						continue
					}
					if matrix[ni][nj] != 0 {
						live_neighbors++
					}
				}
			}
			result[i][j] = if live_neighbors == 2 {
				matrix[i][j]
			} else if live_neighbors == 3 {
				1
			} else {
				0
			}
		}
	}
	return result
}
