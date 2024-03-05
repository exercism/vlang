module main

struct CircularBuffer[T] {
	// Please define the CircularBuffer struct
}

pub fn create_buffer[T](capacity int) CircularBuffer[T] {
	// Please implement the `create_buffer` function
}

pub fn (mut b CircularBuffer[T]) write(value T) ! {
	// Please implement the `write` function
}

pub fn (mut b CircularBuffer[T]) read() !T {
	// Please implement the `read` function
}

pub fn (mut b CircularBuffer[T]) overwrite(value T) {
	// Please implement the `overwrite` function
}

pub fn (mut b CircularBuffer[T]) clear() {
	// Please implement the `clear` function
}
