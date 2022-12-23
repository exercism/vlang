module main

fn prime_factors(n i64) []i64 {
	mut factors := []i64{}
	mut possible_factor := 2
	mut num := n

	for possible_factor * possible_factor <= num {
		for num % possible_factor == 0 {
			factors << possible_factor
			num /= possible_factor
		}
		possible_factor++
	}

	if num > 1 {
		factors << num
	}

	return factors
}
