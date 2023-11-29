module main

const empty = []int{cap: 0}

fn test_keep_on_empty_list_returns_empty_list() {
	predicate := fn (x int) bool {
		return true
	}
	assert keep(empty, predicate) == empty
}

fn test_keeps_everything() {
	array := [1, 3, 5]
	predicate := fn (x int) bool {
		return true
	}
	expect := [1, 3, 5]
	assert keep(array, predicate) == expect
}

fn test_keeps_nothing() {
	array := [1, 3, 5]
	predicate := fn (x int) bool {
		return false
	}
	assert keep(array, predicate) == empty
}

fn test_keeps_first_and_last() {
	array := [1, 2, 3]
	predicate := fn (x int) bool {
		return x % 2 == 1
	}
	expect := [1, 3]
	assert keep(array, predicate) == expect
}

fn test_keeps_neither_first_nor_last() {
	array := [1, 2, 3]
	predicate := fn (x int) bool {
		return x % 2 == 0
	}
	expect := [2]
	assert keep(array, predicate) == expect
}

fn test_keeps_strings() {
	array := ['apple', 'zebra', 'banana', 'zombies', 'cherimoya', 'zealot']
	predicate := fn (x string) bool {
		return x.starts_with('z')
	}
	expect := ['zebra', 'zombies', 'zealot']
	assert keep(array, predicate) == expect
}

fn test_keeps_lists() {
	array := [
		[1, 2, 3],
		[5, 5, 5],
		[5, 1, 2],
		[2, 1, 2],
		[1, 5, 2],
		[2, 2, 1],
		[1, 2, 5],
	]
	predicate := fn (x []int) bool {
		return x.contains(5)
	}
	expect := [
		[5, 5, 5],
		[5, 1, 2],
		[1, 5, 2],
		[1, 2, 5],
	]
	assert keep(array, predicate) == expect
}

fn test_discard_on_empty_list_returns_empty_list() {
	predicate := fn (x int) bool {
		return true
	}
	assert discard(empty, predicate) == empty
}

fn test_discards_everything() {
	array := [1, 3, 5]
	predicate := fn (x int) bool {
		return true
	}
	assert discard(array, predicate) == empty
}

fn test_discards_nothing() {
	array := [1, 3, 5]
	predicate := fn (x int) bool {
		return false
	}
	expect := [1, 3, 5]
	assert discard(array, predicate) == expect
}

fn test_discards_first_and_last() {
	array := [1, 2, 3]
	predicate := fn (x int) bool {
		return x % 2 == 1
	}
	expect := [2]
	assert discard(array, predicate) == expect
}

fn test_discards_neither_first_nor_last() {
	array := [1, 2, 3]
	predicate := fn (x int) bool {
		return x % 2 == 0
	}
	expect := [1, 3]
	assert discard(array, predicate) == expect
}

fn test_discards_strings() {
	array := ['apple', 'zebra', 'banana', 'zombies', 'cherimoya', 'zealot']
	predicate := fn (x string) bool {
		return x.starts_with('z')
	}
	expect := ['apple', 'banana', 'cherimoya']
	assert discard(array, predicate) == expect
}

fn test_discards_lists() {
	array := [
		[1, 2, 3],
		[5, 5, 5],
		[5, 1, 2],
		[2, 1, 2],
		[1, 5, 2],
		[2, 2, 1],
		[1, 2, 5],
	]
	predicate := fn (x []int) bool {
		return x.contains(5)
	}
	expect := [
		[1, 2, 3],
		[2, 1, 2],
		[2, 2, 1],
	]
	assert discard(array, predicate) == expect
}
