module main

fn truncate(phrase string) string {
	if phrase.len_utf8() <= 5 {
		return phrase
	}
	return phrase.runes()[0..5].string()
}
