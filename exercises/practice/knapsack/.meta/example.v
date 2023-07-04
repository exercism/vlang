module main

struct Item {
	weight int
	value  int
}

fn maximum_value(maximum_weight int, items []Item) int {
	mut value := []int{len: maximum_weight + 1, init: 0}

	for item in items {
		// For each weight i, value[i] contains the maximum value achievable
		// with the items seen to date. Each item may only be used once.
		for i := maximum_weight; i >= item.weight; i-- {
			value[i] = maximum(value[i], value[i - item.weight] + item.value)
		}
	}

	return value[maximum_weight]
}

fn maximum(a int, b int) int {
	return if a > b { a } else { b }
}
