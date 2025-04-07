module main

fn count_words(sentence string) map[string]int {
	mut result := map[string]int{}
	mut first := 0

	outer: for {
		for {
			if first >= sentence.len {
				break outer
			}

			ch := sentence[first]
			if ch.is_letter() || ch.is_digit() {
				break
			}

			first++
		}

		mut last := first + 1
		for {
			if last == sentence.len {
				break
			}

			ch := sentence[last]
			if !ch.is_letter() && !ch.is_digit() && ch != `'` {
				break
			}

			last++
		}

		for sentence[last - 1] == `'` {
			last--
		}

		result[sentence[first..last].to_lower()]++

		first = last + 1
	}

	return result
}
