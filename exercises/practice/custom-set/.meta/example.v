module main

import arrays { concat }
import maps { from_array, invert, to_map }

/*
Why use a `map` and not an array?
- no need to check when adding
- membership tests faster (no need to check array):
- an equality test would require both arrays to be in order
  (i.e sorted)
*/
struct CustomSet[T] {
mut:
	items map[T]u8
}

@[inline]
fn (s CustomSet[T]) items() []T {
	return s.items.keys()
}

/*
This needs an explanation:

	elements := ['a', 'b', 'c', 'b']
	from_array(elements) => { 0: 'a', 1: 'b', 2: 'c', 3: 'b' }
	invert({ 0: 'a', 1: 'b', 2: 'c', 3`: 'b'}) => { 'a': 0, 'c': 2, 'b': 3 }
	to_map({ 'a': 0, 'c': 2, 'b': 3}) => { 'a': 1, 'c': 1, 'b': 1 }
*/
// build a new CustomSet
pub fn CustomSet.new[T](elements []T) CustomSet[T] {
	return CustomSet[T]{
		items: to_map[T, int, T, int](invert[T, int](from_array[T](elements)), fn [T](key T, _ int) (T, u8) {
			return key, 1
		})
	}
}

pub fn (mut s CustomSet[T]) add[T](element T) {
	s.items[element] = 1
}

pub fn (s CustomSet[T]) contains[T](element T) bool {
	return element in s.items
}

pub fn (s CustomSet[T]) equal[T](other CustomSet[T]) bool {
	return s.items.len == other.items.len && s.items == other.items
}

pub fn (s CustomSet[T]) is_empty[T]() bool {
	return s.items.len == 0
}

// @union to avoid conflict with reserved word 'union'
pub fn (s CustomSet[T]) @union(other CustomSet[T]) CustomSet[T] {
	return CustomSet.new(concat(s.items(), ...other.items()))
}

pub fn (s CustomSet[T]) intersection(other CustomSet[T]) CustomSet[T] {
	return CustomSet.new[T](other.items().filter(s.contains(it)))
}

pub fn (s CustomSet[T]) difference[T](other CustomSet[T]) CustomSet[T] {
	common := s.intersection(other)
	return CustomSet.new[T](s.items().filter(!common.contains(it)))
}

pub fn (s CustomSet[T]) is_subset[T](other CustomSet[T]) bool {
	return s.intersection(other).equal(s)
}

pub fn (s CustomSet[T]) is_disjoint[T](other CustomSet[T]) bool {
	return s.intersection(other).is_empty()
}
