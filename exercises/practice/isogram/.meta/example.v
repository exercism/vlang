module main

fn is_isogram(word string) bool {
	upper := word.to_upper().split('')
	for i, letter in upper {
		if letter != ' ' && letter != '-' && (letter in upper[..i] || letter in upper[i + 1..]) {
			return false
		}
	}
	return true
}
