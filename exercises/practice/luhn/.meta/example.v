module main

fn valid(value string) bool {
	mut count := 0
	mut total := 0

	// We traverse the string once, starting from the right.
	mut index := value.len
	for index > 0 {
		index--
		mut ch := value[index]
		if ch.is_space() {
			continue
		}
		if !ch.is_digit() {
			return false
		}
		count++

		mut digit := int(ch) - int(`0`)
		if count % 2 == 0 {
			digit *= 2
			if digit > 9 {
				digit -= 9
			}
		}
		total += digit
	}
	return count >= 2 && total % 10 == 0
}
