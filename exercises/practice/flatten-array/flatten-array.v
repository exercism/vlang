module main

type Box[T] = None | One[T] | Many[T]

struct None {}

struct One[T] {
	value T
}

struct Many[T] {
	boxes []Box[T]
}

fn flatten[T](box Box[T]) []T {
	// Please implement the `flatten` function
}
