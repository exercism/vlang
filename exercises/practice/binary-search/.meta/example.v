module main

pub fn find(array []int, value int) !int {
	return binary_search(array, value, 0, array.len - 1)
}

fn binary_search(array []int, value int, lower_limit int, upper_limit int) !int {
	if upper_limit < lower_limit {
		return error('value not in array')
	}

	middle_index := (lower_limit + upper_limit) / 2
	middle_value := array[middle_index]

	return match true {
		value < middle_value { binary_search(array, value, lower_limit, middle_index - 1)! }
		value > middle_value { binary_search(array, value, middle_index + 1, upper_limit)! }
		else { middle_index }
	}
}
