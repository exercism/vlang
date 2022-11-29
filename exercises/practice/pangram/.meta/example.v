module main

fn is_pangram(phrase string) bool {
	lower := phrase.to_lower().bytes()
	for ch in "abcdefghijklmnopqrstuvwxyz" {
		if ch !in lower {
			return false
		}
	}
	return true
}