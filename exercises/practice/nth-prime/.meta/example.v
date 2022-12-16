module main

import math

fn nth_prime(n int) !int {
	if n < 1 {
		return error('n must be greater than 0')
	}

	mut n_primes := 1
	mut i := 3

	for n_primes < n {
		if is_prime(i) {
			n_primes++
		}
		i++
	}
	return i - 1
}

fn is_prime(n int) bool {
	for m in 2 .. int(math.ceil(math.sqrt(n))) + 1 {
		if n % m == 0 {
			return false
		}
	}
	return true
}
