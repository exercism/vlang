module main

fn test_triplets_whose_sum_is_12() {
	expected := [
		[3, 4, 5],
	]
	assert triplets_with_sum(12) == expected
}

fn test_triplets_whose_sum_is_108() {
	expected := [
		[27, 36, 45],
	]
	assert triplets_with_sum(108) == expected
}

fn test_triplets_whose_sum_is_1000() {
	expected := [
		[200, 375, 425],
	]
	assert triplets_with_sum(1000) == expected
}

fn test_no_matching_triplets_for_1001() {
	expected := [][]int{}
	assert triplets_with_sum(1001) == expected
}

fn test_returns_all_matching_triplets() {
	expected := [
		[9, 40, 41],
		[15, 36, 39],
	]
	assert triplets_with_sum(90) == expected
}

fn test_several_matching_triplets() {
	expected := [
		[40, 399, 401],
		[56, 390, 394],
		[105, 360, 375],
		[120, 350, 370],
		[140, 336, 364],
		[168, 315, 357],
		[210, 280, 350],
		[240, 252, 348],
	]
	assert triplets_with_sum(840) == expected
}

fn test_triplets_for_large_number() {
	expected := [
		[1200, 14375, 14425],
		[1875, 14000, 14125],
		[5000, 12000, 13000],
		[6000, 11250, 12750],
		[7500, 10000, 12500],
	]
	assert triplets_with_sum(30000) == expected
}
