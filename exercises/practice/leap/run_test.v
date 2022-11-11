module main

fn test_not_divisible_by_4() {
	assert !is_leap_year(2015)
}

fn test_divisible_by_2_not_by_4() {
	assert !is_leap_year(1970)
}

fn test_divisible_by_4_not_by_100() {
	assert is_leap_year(1996)
}

fn test_divisible_by_4_and_5() {
	assert is_leap_year(1960)
}

fn test_divisible_by_100_not_by_400(){
	assert !is_leap_year(2100)
}

fn test_divisible_by_100_not_by_3() {
	assert !is_leap_year(1900)
}

fn test_divisible_by_400() {
	assert is_leap_year(2000)
}

fn test_divisible_by_100_not_by_125() {
	assert is_leap_year(2400)
}

fn test_divisible_by_200_not_by_400() {
	assert !is_leap_year(1800)
}