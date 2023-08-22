module main

struct CustomSet[T] {
}

// build a new CustomSet
pub fn CustomSet.new[T](elements []T) CustomSet[T] {
}

pub fn (mut s CustomSet[T]) add[T](element T) {
}

pub fn (s CustomSet[T]) contains[T](element T) bool {
}

pub fn (s CustomSet[T]) equal[T](other CustomSet[T]) bool {
}

pub fn (s CustomSet[T]) is_empty[T]() bool {
}

// @union to avoid conflict with reserved word 'union'
pub fn (s CustomSet[T]) @union(other CustomSet[T]) CustomSet[T] {
}

pub fn (s CustomSet[T]) intersection(other CustomSet[T]) CustomSet[T] {
}

pub fn (s CustomSet[T]) difference[T](other CustomSet[T]) CustomSet[T] {
}

pub fn (s CustomSet[T]) is_subset[T](other CustomSet[T]) bool {
}

pub fn (s CustomSet[T]) is_disjoint[T](other CustomSet[T]) bool {
}
