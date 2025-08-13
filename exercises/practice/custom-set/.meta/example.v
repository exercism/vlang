module main

import arrays { append, distinct, map_of_counts }

/*
Why don't use a map?
According to the documentation, keys must be either a string, rune,
integer, float or voidptr.
*/
struct CustomSet[T] {
mut:
	items []T
}

// build a new CustomSet
pub fn CustomSet.new[T](elements []T) CustomSet[T] {
  return CustomSet[T] {
    items: distinct(elements)
  }
}

pub fn (mut s CustomSet[T]) add[T](element T) {
	if !(element in s.items) {
    s.items << element
  }
}

pub fn (s CustomSet[T]) contains[T](element T) bool {
	return element in s.items
}

pub fn (s CustomSet[T]) equal[T](other CustomSet[T]) bool {
	return map_of_counts(s.items) == map_of_counts(other.items)
}

pub fn (s CustomSet[T]) is_empty[T]() bool {
	return s.items.len == 0
}

// @union to avoid conflict with reserved word 'union'
pub fn (s CustomSet[T]) @union(other CustomSet[T]) CustomSet[T] {
  return CustomSet.new[T](append(s.items, other.items))
}

pub fn (s CustomSet[T]) intersection(other CustomSet[T]) CustomSet[T] {
	return CustomSet.new[T](other.items.filter(it in s.items))
}

pub fn (s CustomSet[T]) difference[T](other CustomSet[T]) CustomSet[T] {
	return CustomSet.new[T](s.items.filter(!other.contains(it)))
}

pub fn (s CustomSet[T]) is_subset[T](other CustomSet[T]) bool {
	return s.intersection(other).equal(s)
}

pub fn (s CustomSet[T]) is_disjoint[T](other CustomSet[T]) bool {
	return s.intersection(other).is_empty()
}
