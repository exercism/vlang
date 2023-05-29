module main

fn response(hey_bob string) string {
	mut is_silence := true
	mut is_question := false
	mut contains_upper := false
	mut contains_lower := false

	for ch in hey_bob.bytes() {
		if ch.is_space() {
			continue
		}
		is_silence = false

		if ch == u8(`?`) {
			// The last non-whitespace character is a question mark.
			is_question = true
			continue
		}
		is_question = false

		if ch.is_letter() {
			if ch.is_capital() {
				contains_upper = true
			} else {
				contains_lower = true
			}
		}
	}

	if is_silence {
		return 'Fine. Be that way!'
	}

	if contains_upper && !contains_lower {
		if is_question {
			return "Calm down, I know what I'm doing!"
		}
		return 'Whoa, chill out!'
	}

	if is_question {
		return 'Sure.'
	}
	return 'Whatever.'
}
