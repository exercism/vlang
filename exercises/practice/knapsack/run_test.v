module main

fn test_no_items() {
	items := []Item{}
	assert maximum_value(100, items) == 0
}

fn test_one_item_too_heavy() {
	items := [
		Item{
			weight: 100
			value: 1
		},
	]
	assert maximum_value(10, items) == 0
}

fn test_five_items_cannot_be_greedy_by_weight() {
	items := [
		Item{
			weight: 2
			value: 5
		},
		Item{
			weight: 2
			value: 5
		},
		Item{
			weight: 2
			value: 5
		},
		Item{
			weight: 2
			value: 5
		},
		Item{
			weight: 10
			value: 21
		},
	]
	assert maximum_value(10, items) == 21
}

fn test_five_items_cannot_be_greedy_by_value() {
	items := [
		Item{
			weight: 2
			value: 20
		},
		Item{
			weight: 2
			value: 20
		},
		Item{
			weight: 2
			value: 20
		},
		Item{
			weight: 2
			value: 20
		},
		Item{
			weight: 10
			value: 50
		},
	]
	assert maximum_value(10, items) == 80
}

fn test_example_knapsack() {
	items := [
		Item{
			weight: 5
			value: 10
		},
		Item{
			weight: 4
			value: 40
		},
		Item{
			weight: 6
			value: 30
		},
		Item{
			weight: 4
			value: 50
		},
	]
	assert maximum_value(10, items) == 90
}

fn test_8_items() {
	items := [
		Item{
			weight: 25
			value: 350
		},
		Item{
			weight: 35
			value: 400
		},
		Item{
			weight: 45
			value: 450
		},
		Item{
			weight: 5
			value: 20
		},
		Item{
			weight: 25
			value: 70
		},
		Item{
			weight: 3
			value: 8
		},
		Item{
			weight: 2
			value: 5
		},
		Item{
			weight: 2
			value: 5
		},
	]
	assert maximum_value(104, items) == 900
}

fn test_15_items() {
	items := [
		Item{
			weight: 70
			value: 135
		},
		Item{
			weight: 73
			value: 139
		},
		Item{
			weight: 77
			value: 149
		},
		Item{
			weight: 80
			value: 150
		},
		Item{
			weight: 82
			value: 156
		},
		Item{
			weight: 87
			value: 163
		},
		Item{
			weight: 90
			value: 173
		},
		Item{
			weight: 94
			value: 184
		},
		Item{
			weight: 98
			value: 192
		},
		Item{
			weight: 106
			value: 201
		},
		Item{
			weight: 110
			value: 210
		},
		Item{
			weight: 113
			value: 214
		},
		Item{
			weight: 115
			value: 221
		},
		Item{
			weight: 118
			value: 229
		},
		Item{
			weight: 120
			value: 240
		},
	]
	assert maximum_value(750, items) == 1458
}
