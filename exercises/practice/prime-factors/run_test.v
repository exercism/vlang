module main

fn test_no_factors() {
	mut factors := []i64{}
	assert prime_factors(1) == factors
}

fn test_prime_number() {
	mut factors := []i64{}
	factors << 2
	assert prime_factors(2) == factors
}

fn test_another_prime_number() {
	mut factors := []i64{}
	factors << 3
	assert prime_factors(3) == factors
}

fn test_square_of_prime() {
	mut factors := []i64{}
	factors << 3
	factors << 3
	assert prime_factors(9) == factors
}

fn test_square_of_first_prime() {
	mut factors := []i64{}
	factors << 2
	factors << 2
	assert prime_factors(4) == factors
}

fn test_cube_of_prime() {
	mut factors := []i64{}
	factors << 2
	factors << 2
	factors << 2
	assert prime_factors(8) == factors
}

fn test_cube_of_second_prime() {
	mut factors := []i64{}
	factors << 3
	factors << 3
	factors << 3
	assert prime_factors(27) == factors
}

fn test_product_of_third_prime() {
	mut factors := []i64{}
	factors << 5
	factors << 5
	factors << 5
	factors << 5
	assert prime_factors(625) == factors
}

fn test_product_of_first_and_second_prime() {
	mut factors := []i64{}
	factors << 2
	factors << 3
	assert prime_factors(6) == factors
}

fn test_product_of_prime_and_non_prime() {
	mut factors := []i64{}
	factors << 2
	factors << 2
	factors << 3
	assert prime_factors(12) == factors
}

fn test_product_of_primes() {
	mut factors := []i64{}
	factors << 5
	factors << 17
	factors << 23
	factors << 461
	assert prime_factors(901255) == factors
}

fn test_large_prime() {
	mut factors := []i64{}
	factors << 11
	factors << 9539
	factors << 894119
	assert prime_factors(93819012551) == factors
}
