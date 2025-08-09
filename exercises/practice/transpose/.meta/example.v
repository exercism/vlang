module main

fn transpose(lines []string) []string {
	mut max_line_len := 0
	for line in lines {
		if max_line_len < line.len {
			max_line_len = line.len
		}
	}

	mut result := []string{len: max_line_len}
	for i in 0 .. max_line_len {
		mut buffer := []u8{cap: lines.len}
		for j in 0 .. (lines.len) {
			if lines[j].len <= i {
				continue
			}
			for buffer.len < j {
				buffer << ` `
			}

			buffer << lines[j][i]
		}

		result[i] = buffer.bytestr()
	}

	return result
}
