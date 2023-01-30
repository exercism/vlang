module main

fn sqr(n int) int {
	return n * n
}

fn cube(n int) int {
	return n * n * n
}

fn reverse(n string) string {
	return n.reverse()
}

fn get_upper(n string) string {
	return n.to_upper()
}

fn test_empty() {
	int_values := []int{}
	str_values := []string{}
	assert accumulate_ints(int_values, sqr) == []
	assert accumulate_strs(str_values, reverse) == []
}

fn test_squares() {
	values := [1, 2, 3]
	assert accumulate_ints(values, sqr) == [1, 4, 9]
}

fn test_cubes() {
	values := [1, -2, 3]
	assert accumulate_ints(values, cube) == [1, -8, 27]
}

fn test_upper_cases() {
	values := ['Hello', 'World']
	assert accumulate_strs(values, get_upper) == ['HELLO', 'WORLD']
}

fn test_reverse_strings() {
	values := ['the', 'quick', 'brown', 'fox', 'etc']
	assert accumulate_strs(values, reverse) == ['eht', 'kciuq', 'nworb', 'xof', 'cte']
}
