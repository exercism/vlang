module main

fn triplets_with_sum(n int) [][]int {
	mut result := [][]int{}
	if n < 2 {
		return result
	}
	mut a := 0
	for {
		a++
		numerator := n * (n - 2 * a)
		denominator := 2 * (n - a)
		b := numerator / denominator
		if b < a {
			break
		}
		if numerator % denominator != 0 {
			continue
		}
		c := n - a - b
		result << [a, b, c]
	}
	return result
}
