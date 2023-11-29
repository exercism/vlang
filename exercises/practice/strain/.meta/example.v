module main

pub fn keep[T](array []T, predicate fn (e T) bool) []T {
	mut result := []T{cap: array.len}

	for element in array {
		if predicate(element) {
			result << element
		}
	}

	return result
}

pub fn discard[T](array []T, predicate fn (e T) bool) []T {
	mut result := []T{cap: array.len}

	for element in array {
		if !predicate(element) {
			result << element
		}
	}

	return result
}
