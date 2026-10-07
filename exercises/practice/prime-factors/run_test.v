module main

fn test_no_factors() {
	assert prime_factors(1) == []i64{}
}

fn test_prime_number() {
	assert prime_factors(2) == [i64(2)]
}

fn test_another_prime_number() {
	assert prime_factors(3) == [i64(3)]
}

fn test_square_of_a_prime() {
	assert prime_factors(9) == [i64(3), i64(3)]
}

fn test_product_of_first_prime() {
	assert prime_factors(4) == [i64(2), i64(2)]
}

fn test_cube_of_a_prime() {
	assert prime_factors(8) == [i64(2), i64(2), i64(2)]
}

fn test_product_of_second_prime() {
	assert prime_factors(27) == [i64(3), i64(3), i64(3)]
}

fn test_product_of_third_prime() {
	assert prime_factors(625) == [i64(5), i64(5), i64(5), i64(5)]
}

fn test_product_of_first_and_second_prime() {
	assert prime_factors(6) == [i64(2), i64(3)]
}

fn test_product_of_primes_and_non_primes() {
	assert prime_factors(12) == [i64(2), i64(2), i64(3)]
}

fn test_product_of_primes() {
	assert prime_factors(901255) == [i64(5), i64(17), i64(23), i64(461)]
}

fn test_factors_include_a_large_prime() {
	assert prime_factors(93819012551) == [i64(11), i64(9539), i64(894119)]
}
