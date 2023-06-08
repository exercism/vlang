module main

fn rectangles(strings []string) int {
	mut result := 0
	for top in 0 .. (strings.len) {
		for left in 0 .. (strings[0].len) {
			if strings[top][left] != u8(`+`) {
				continue
			}

			for bottom in (top + 1) .. (strings.len) {
				if strings[bottom][left] == u8(`|`) {
					continue
				}
				if strings[bottom][left] != u8(`+`) {
					break
				}

				for right in (left + 1) .. (strings[0].len) {
					if (strings[top][right] != u8(`-`) && strings[top][right] != u8(`+`))
						|| (strings[bottom][right] != u8(`-`) && strings[bottom][right] != u8(`+`)) {
						break
					}
					if strings[top][right] == u8(`-`) || strings[bottom][right] == u8(`-`) {
						continue
					}

					mut valid := true
					for row in (top + 1) .. bottom {
						if strings[row][right] != u8(`|`) && strings[row][right] != u8(`+`) {
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
