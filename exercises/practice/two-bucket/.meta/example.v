module main

enum BucketId {
	one
	two
}

struct Solution {
	moves        int
	goal_bucket  BucketId
	other_bucket int
}

struct State {
	contents_one int
	contents_two int
}

struct Search {
	capacity_one int
	capacity_two int
mut:
	seen  []bool
	queue []State
}

fn (search Search) id_for_state(contents_one int, contents_two int) int {
	capacity_one := search.capacity_one
	capacity_two := search.capacity_two
	combined_capacity := capacity_one + capacity_two

	// After each move, at least one bucket is either empty or full.
	// We enumerate the valid states as follows:
	// States 0..capacity_two: bucket one empty, contents_two increasing.
	// States capacity_two..combined_capacity: contents_one increasing, bucket two full.
	// States combined_capacity..(combined_capacity + capacity_two): bucket one full, contents_two decreasing.
	// States (combined_capacity + capacity_two)..(2 * combined_capacity): contents_one decreasing, bucket two empty.

	if contents_one == 0 {
		return contents_two
	}
	if contents_two == capacity_two {
		return capacity_two + contents_one
	}
	if contents_one == capacity_one {
		return capacity_one + 2 * capacity_two - contents_two
	}
	if contents_two == 0 {
		return 2 * (capacity_one + capacity_two) - contents_one
	}
	panic('invalid state')
}

fn (mut search Search) exclude(contents_one int, contents_two int) {
	id := search.id_for_state(contents_one, contents_two)
	search.seen[id] = true
}

fn (mut search Search) enqueue(contents_one int, contents_two int) {
	id := search.id_for_state(contents_one, contents_two)
	if search.seen[id] {
		return
	}
	search.queue << State{
		contents_one: contents_one
		contents_two: contents_two
	}
	search.seen[id] = true
}

fn new_search(capacity_one int, capacity_two int) Search {
	mut result := Search{
		capacity_one: capacity_one
		capacity_two: capacity_two
	}
	result.seen = []bool{len: 2 * (capacity_one + capacity_two), init: false}
	result.queue = []State{cap: 2 * (capacity_one + capacity_two)}
	return result
}

pub fn measure(capacity_one int, capacity_two int, goal int, start_bucket BucketId) !Solution {
	assert goal != 0

	mut search := new_search(capacity_one, capacity_two)
	if start_bucket == .one {
		search.enqueue(capacity_one, 0)
		search.exclude(0, capacity_two)
	} else {
		search.enqueue(0, capacity_two)
		search.exclude(capacity_one, 0)
	}

	mut moves := 1
	// The total number of states added before the next move.
	mut old_back := search.queue.len

	mut front := 0
	for front < search.queue.len {
		contents_one := search.queue[front].contents_one
		contents_two := search.queue[front].contents_two
		combined_contents := contents_one + contents_two

		if contents_one == goal {
			return Solution{
				moves: moves
				goal_bucket: .one
				other_bucket: contents_two
			}
		}
		if contents_two == goal {
			return Solution{
				moves: moves
				goal_bucket: .two
				other_bucket: contents_one
			}
		}

		// Pouring one bucket into the other bucket.
		if combined_contents <= capacity_one {
			search.enqueue(combined_contents, 0)
		} else {
			search.enqueue(capacity_one, combined_contents - capacity_one)
		}
		if combined_contents <= capacity_two {
			search.enqueue(0, combined_contents)
		} else {
			search.enqueue(combined_contents - capacity_two, capacity_two)
		}

		// Emptying a bucket and doing nothing to the other.
		search.enqueue(0, contents_two)
		search.enqueue(contents_one, 0)

		// Filling a bucket and doing nothing to the other.
		search.enqueue(capacity_one, contents_two)
		search.enqueue(contents_one, capacity_two)

		front += 1
		if front == old_back {
			moves += 1
			old_back = search.queue.len
		}
	}

	// No more reachable states.
	return error('impossible')
}
