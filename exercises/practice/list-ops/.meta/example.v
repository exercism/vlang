module main

pub fn append[T](front []T, back []T) []T {
	front_len := front.len

	mut result := []T{len: front_len + back.len}

	for i, element in front {
		result[i] = element
	}

	for i, element in back {
		result[front_len + i] = element
	}

	return result
}

pub fn concat[T](array [][]T) []T {
	mut result_len := 0

	for element in array {
		result_len += element.len
	}

	mut result := []T{cap: result_len}

	for element in array {
		result = append(result, element)
	}

	return result
}

pub fn foldl[T, U](array []T, initial U, folder fn (acc U, e T) U) U {
	mut result := initial

	for element in array {
		result = folder(result, element)
	}

	return result
}

pub fn foldr[T, U](array []T, initial U, folder fn (acc U, e T) U) U {
	return foldl(reverse(array), initial, folder)
}

pub fn length[T](array []T) int {
	return foldl[T, int](array, 0, fn [T](acc int, _ T) int {
		return acc + 1
	})
}

pub fn reverse[T](array []T) []T {
	mut result := []T{cap: array.len}

	for element in array {
		result = append([element], result)
	}

	return result
}

pub fn filter[T](array []T, predicate fn (e T) bool) []T {
	mut result := []T{cap: array.len}

	for element in array {
		if predicate(element) {
			result = append(result, [element])
		}
	}

	return result
}

// renamed 'map_of' as 'map' conflicts with V 'map' datatype

pub fn map_of[T, U](array []T, mapper fn (e T) U) []U {
	mut result := []U{cap: array.len}

	for element in array {
		result = append(result, [mapper(element)])
	}

	return result
}
