module main

fn is_paired(input string) bool {
	open := '[{('
	close := ']})'

	// Brackets that have been opened but not closed.
	mut pending := []int{}

	for ch in input.bytes() {
		if bracket_type := open.index(ch.ascii_str()) {
			pending << bracket_type
		} else if bracket_type := close.index(ch.ascii_str()) {
			if pending.len == 0 || pending.pop() != bracket_type {
				return false
			}
		}
	}

	return pending.len == 0
}
