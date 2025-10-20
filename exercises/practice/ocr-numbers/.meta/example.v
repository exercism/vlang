module main

import strings

fn convert_digit(first string, second string, third string, fourth string) rune {
	return if fourth != '   ' {
		`?`
	} else if first == ' _ ' && second == '| |' && third == '|_|' {
		`0`
	} else if first == '   ' && second == '  |' && third == '  |' {
		`1`
	} else if first == ' _ ' && second == ' _|' && third == '|_ ' {
		`2`
	} else if first == ' _ ' && second == ' _|' && third == ' _|' {
		`3`
	} else if first == '   ' && second == '|_|' && third == '  |' {
		`4`
	} else if first == ' _ ' && second == '|_ ' && third == ' _|' {
		`5`
	} else if first == ' _ ' && second == '|_ ' && third == '|_|' {
		`6`
	} else if first == ' _ ' && second == '  |' && third == '  |' {
		`7`
	} else if first == ' _ ' && second == '|_|' && third == '|_|' {
		`8`
	} else if first == ' _ ' && second == '|_|' && third == ' _|' {
		`9`
	} else {
		`?`
	}
}

fn convert(rows []string) !string {
	if rows.len % 4 != 0 {
		return error('Number of input lines is not a multiple of four')
	}
	if rows[0].len % 3 != 0 {
		return error('Number of input columns is not a multiple of three')
	}
	r := rows.len / 4
	c := rows[0].len / 3
	mut builder := strings.new_builder(r * (c + 1) - 1)
	for i in 0 .. r {
		for j in 0 .. c {
			top := 4 * i
			left := 3 * j
			right := 3 * (j + 1)
			first := rows[top][left..right]
			second := rows[top + 1][left..right]
			third := rows[top + 2][left..right]
			fourth := rows[top + 3][left..right]
			builder.write_rune(convert_digit(first, second, third, fourth))
		}
		if i + 1 < r {
			builder.write_rune(`,`)
		}
	}
	return builder.str()
}
