module main

fn sieve(limit int) []int {
	mut test := []bool{len: limit + 1, init: false}
	for i in 2 .. limit + 1 {
		if test[i] == false {
			mut j := i + i
			for j <= limit {
				test[j] = true
				j = j + i
			}
		}
	}
	mut primes := []int{}
	for k in 2 .. limit + 1 {
		if !test[k] {
			primes << k
		}
	}
	return primes
}
