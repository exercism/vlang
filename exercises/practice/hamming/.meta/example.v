module main

fn distance(a string, b string) !int {
	if a.len != b.len {
		return error('lengths must match!')
	}
	mut sum := 0
	for i in 0 .. a.len {
		if a[i] != b[i] {
			sum++
		}
	}
	return sum
}
