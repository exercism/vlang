module main

fn sum(factors []int, limit int) int {
	mut result := 0
	for n in 1 .. limit {
		for factor in factors {
			if factor != 0 && n % factor == 0 {
				result += n
				break
			}
		}
	}
	return result
}
