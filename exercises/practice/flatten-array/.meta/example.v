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
	mut dest := []T{}
	append(mut dest, box)
	return dest
}

fn append[T](mut dest []T, box Box[T]) {
	match box {
		None {}
		One[T] {
			dest << box.value
		}
		Many[T] {
			for element in box.boxes {
				append(mut dest, element)
			}
		}
	}
}
