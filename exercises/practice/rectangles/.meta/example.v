module main

fn rectangles(strings []string) int {
	is_corner := fn [strings] (row int, col int) bool {
		return strings[row][col] == u8(`+`)
	}

	is_horizontal := fn [strings] (row int, col int) bool {
		return strings[row][col] == u8(`-`) || strings[row][col] == u8(`+`)
	}

	is_vertical := fn [strings] (row int, col int) bool {
		return strings[row][col] == u8(`|`) || strings[row][col] == u8(`+`)
	}

	mut result := 0
	for top in 0 .. (strings.len) {
		for left in 0 .. (strings[0].len) {
			if !is_corner(top, left) {
				continue
			}

			for bottom in (top + 1) .. (strings.len) {
				if !is_vertical(bottom, left) {
					break
				}
				if !is_corner(bottom, left) {
					continue
				}

				for right in (left + 1) .. (strings[0].len) {
					if !is_horizontal(top, right) || !is_horizontal(bottom, right) {
						break
					}
					if !is_corner(top, right) || !is_corner(bottom, right) {
						continue
					}

					mut valid := true
					for row in (top + 1) .. bottom {
						if !is_vertical(row, right) {
							valid = false
							break
						}
					}
					if valid {
						result++
					}
				}
			}
		}
	}
	return result
}
