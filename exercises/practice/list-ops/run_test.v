module main

const empty = []int{cap: 0}

// append

fn test_append_empty_lists() {
	assert append[int](empty, empty) == empty
}

fn test_append_list_to_empty_list() {
	assert append[int](empty, [1, 2, 3, 4]) == [1, 2, 3, 4]
}

fn test_append_empty_list_to_list() {
	assert append[int]([1, 2, 3, 4], empty) == [1, 2, 3, 4]
}

fn test_append_non_empty_lists() {
	assert append[int]([1, 2], [2, 3, 4, 5]) == [1, 2, 2, 3, 4, 5]
}

// concat

fn test_concat_empty_list() {
	assert concat[int]([empty]) == empty
}

fn test_concat_list_of_lists() {
	assert concat[int]([[1, 2], [3], empty, [4, 5, 6]]) == [1, 2, 3, 4, 5, 6]
}

fn test_concat_list_of_nested_lists() {
	assert concat[[]int]([[[1], [2]], [[3]], [[]], [[4, 5, 6]]]) == [
		[1],
		[2],
		[3],
		empty,
		[4, 5, 6],
	]
}

// filter

fn test_filter_empty_list() {
	assert filter[int](empty, fn (e int) bool {
		return e % 2 == 1
	}) == empty
}

fn test_filter_odd_numbers() {
	assert filter[int]([1, 2, 3, 5], fn (e int) bool {
		return e % 2 == 1
	}) == [1, 3, 5]
}

// length

fn test_length_of_empty_list() {
	assert length[int](empty) == 0
}

fn test_length_of_non_empty_list() {
	assert length[int]([1, 2, 3, 4]) == 4
}

// map_of

fn test_map_of_empty_list() {
	assert map_of[int, int](empty, fn (e int) int {
		return e + 1
	}) == empty
}

fn test_map_of_non_empty_list() {
	assert map_of[int, int]([1, 3, 5, 7], fn (e int) int {
		return e + 1
	}) == [2, 4, 6, 8]
}

// foldl

fn test_foldl_with_empty_list() {
	assert foldl[int, int](empty, 2, fn (acc int, e int) int {
		return acc * e
	}) == 2
}

fn test_foldl_with_non_empty_list() {
	assert foldl[int, int]([1, 2, 3, 4], 5, fn (acc int, e int) int {
		return acc + e
	}) == 15
}

fn test_foldl_with_non_empty_list_discard_fractional_division() {
	assert foldl[int, int]([2, 5], 5, fn (acc int, e int) int {
		return acc / e
	}) == 0
}

fn test_foldl_with_empty_list_reversed_arguments() {
	assert foldl[int, int](empty, 2, fn (acc int, e int) int {
		return e * acc
	}) == 2
}

fn test_foldl_with_non_empty_list_reversed_args() {
	assert foldl[int, int]([1, 2, 3, 4], 5, fn (acc int, e int) int {
		return e + acc
	}) == 15
}

fn test_foldl_with_direction_dependent_function() {
	assert foldl[int, int]([2, 5], 5, fn (acc int, e int) int {
		return acc / e
	}) == 0
}

// foldr

fn test_foldr_with_empty_list() {
	assert foldr[int, int](empty, 2, fn (acc int, e int) int {
		return acc * e
	}) == 2
}

fn test_foldr_with_non_empty_list() {
	assert foldr[int, int]([1, 2, 3, 4], 5, fn (acc int, e int) int {
		return acc + e
	}) == 15
}

fn test_foldr_with_non_empty_list_directional_dependent_function() {
	assert foldr[int, int]([2, 5], 5, fn (acc int, e int) int {
		return acc / e
	}) == 0
}

fn test_foldr_with_empty_list_reversed_args() {
	assert foldr[int, int](empty, 2, fn (acc int, e int) int {
		return e * acc
	}) == 2
}

fn test_foldr_direction_independent_function_applied_to_non_empty_list() {
	assert foldr[int, int]([1, 2, 3, 4], 5, fn (acc int, e int) int {
		return e + acc
	}) == 15
}

fn test_foldr_direction_dependent_function_applied_to_non_empty_list() {
	assert foldr[int, int]([2, 5], 5, fn (acc int, e int) int {
		return e / acc
	}) == 2
}

// reverse

fn test_reverse_empty_list() {
	assert reverse[int](empty) == empty
}

fn test_reverse_non_empty_list() {
	assert reverse[int]([1, 3, 5, 7]) == [7, 5, 3, 1]
}

fn test_reverse_list_of_lists_not_flattened() {
	expected := [[4, 5, 6], empty, [3], [1, 2]]
	assert reverse[[]int]([[1, 2], [3], empty, [4, 5, 6]]) == expected
}
