module main

struct CircularBuffer[T] {
	capacity int
mut:
	content []T
}

pub fn create_buffer[T](capacity int) CircularBuffer[T] {
	return CircularBuffer[T]{
		capacity: capacity
		content: []T{}
	}
}

pub fn (mut b CircularBuffer[T]) write(value T) ! {
	if b.content.len >= b.capacity {
		return error('Buffer is full')
	}
	b.content.prepend(value)
}

pub fn (mut b CircularBuffer[T]) read() !T {
	if b.content.len == 0 {
		return error('Buffer is empty')
	}

	return b.content.pop()
}

pub fn (mut b CircularBuffer[T]) overwrite(value T) {
	if b.content.len >= b.capacity {
		b.content.pop()
	}

	b.content.prepend(value)
}

pub fn (mut b CircularBuffer[T]) clear() {
	b.content.clear()
}
