# Breadth First Search (BFS)

```v
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
		return 2 * combined_capacity - contents_one
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
				moves:        moves
				goal_bucket:  .one
				other_bucket: contents_two
			}
		}
		if contents_two == goal {
			return Solution{
				moves:        moves
				goal_bucket:  .two
				other_bucket: contents_one
			}
		}

		// Pouring one bucket into the other bucket until source is empty or target is full.
		// Pour 2->1: bucket one gets min(combined, capacity_one), bucket two gets the rest.
		if combined_contents <= capacity_one {
			search.enqueue(combined_contents, 0)
		} else {
			search.enqueue(capacity_one, combined_contents - capacity_one)
		}
		// Pour 1->2: bucket two gets min(combined, capacity_two), bucket one gets the rest.
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
```

This approach models the two-bucket problem as a **state space search** using **Breadth-First Search (BFS)**.
Each state represents the amount of water in both buckets.
BFS explores states level by level, guaranteeing the minimum number of moves to reach the goal.

## Data Structures

### `State`

Represents a single configuration: `(contents_one, contents_two)` -- liters in each bucket.
See [structs][structs].

### `Search`

Holds the search state:
- `capacity_one`, `capacity_two` -- bucket sizes
- `seen` -- boolean [array][arrays] tracking visited states (indexed by `id_for_state`)
- `queue` -- slice of `State` for BFS frontier

### `Solution`

Return value: `moves`, `goal_bucket` (which bucket has the goal), `other_bucket` (liters in the other bucket).
The function returns `!Solution` -- see [error handling][error-handling].

## Key Functions

### `id_for_state`

Maps each valid state to a unique integer ID for O(1) visited checks.

**Insight**: After every move, at least one bucket is empty or full.
Valid states form a bounded set of size `2 * (capacity_one + capacity_two)`.

The mapping:

| Condition | ID Range | Meaning |
|-----------|----------|---------|
| `contents_one == 0` | `0 .. capacity_two` | Bucket 1 empty, bucket 2 varies |
| `contents_two == capacity_two` | `capacity_two .. combined_capacity` | Bucket 2 full, bucket 1 varies |
| `contents_one == capacity_one` | `combined_capacity .. combined_capacity + capacity_two` | Bucket 1 full, bucket 2 decreases |
| `contents_two == 0` | `combined_capacity + capacity_two .. 2*combined_capacity` | Bucket 2 empty, bucket 1 decreases |

The `panic('invalid state')` is unreachable during the search, because every state the search creates has at least one bucket empty or full.
Note that `(0,0)` is a valid state the search can visit (both buckets empty).

### `enqueue`

Adds a state to the BFS queue if not already visited.
Uses `id_for_state` for deduplication.

### `exclude`

Marks a state as visited without enqueueing.
Used to **exclude the invalid starting state** where the non-starting bucket is full while the starting bucket is empty (per problem rules).

### `new_search`

Initializes `seen` array (size `2*(c1+c2)`) and `queue` with capacity for all possible states.

## Algorithm: `measure`

1. **Assert**: `goal != 0` -- see [assert][assert] (assertion, not an error return).
2. **Initialize search** with capacities.
3. **Set starting state**:
   - If `start_bucket == one`: enqueue `(capacity_one, 0)`, exclude `(0, capacity_two)`
   - If `start_bucket == two`: enqueue `(0, capacity_two)`, exclude `(capacity_one, 0)`
   - Move count starts at 1 (initial fill counts as a move).
4. **BFS loop** (level-by-level):
   - Dequeue state, check if either bucket == goal -> return `Solution`
   - Generate all 6 possible next states:
     - **Pour 2->1** (until source empty or target full): bucket one gets `min(combined, capacity_one)`, bucket two gets the rest.
     - **Pour 1->2** (until source empty or target full): bucket two gets `min(combined, capacity_two)`, bucket one gets the rest.
     - **Empty bucket 1**: `(0, contents_two)`
     - **Empty bucket 2**: `(contents_one, 0)`
     - **Fill bucket 1**: `(capacity_one, contents_two)`
     - **Fill bucket 2**: `(contents_one, capacity_two)`
   - Enqueue unvisited states.
5. **Level counting**: `front` index tracks current state; `old_back` marks queue length at start of level.

    Example with buckets 3 and 5, start bucket one, (0,5) excluded:
    ```
    Initial: queue=[(3,0)], front=0, old_back=1, moves=1
    Process (3,0): adds (0,3), (0,0), (3,5) -- queue length is 4
    front=1 == old_back=1 -> moves=2, old_back=4
    Process the 3 states at moves=2, then front=4 == old_back=4 -> moves=3
    ```
    The goal check happens when a state is taken off the queue, so a state found at level N is reported with moves = N.
    When `front` reaches `old_back`, all states at the current distance are done; increment `moves` and set `old_back` to the new queue length.
6. **Exhaustion**: If queue empties, return `error('impossible')`.

## Complexity

- **Time**: O(capacity_one + capacity_two) -- there are at most `2 * (capacity_one + capacity_two)` valid states and each generates up to 6 moves.
- **Space**: O(capacity_one + capacity_two) -- `seen` array + queue.

## Example Walkthrough

Buckets: 3 and 5, Goal: 1, Start: bucket one

| Move | Bucket 1 | Bucket 2 | Action |
|------|----------|----------|--------|
| 1    | 3        | 0        | Fill bucket 1 |
| 2    | 0        | 3        | Pour 1->2 |
| 3    | 3        | 3        | Fill bucket 1 |
| 4    | 1        | 5        | Pour 1->2 (goal reached!) |

Result: 4 moves, goal in bucket 1, 5 liters in bucket 2

## Why BFS?

- **Guarantees optimal** (minimum moves) -- explores all states at distance N before N+1
- **Simple to understand and implement** -- no advanced math required
- **Works within problem constraints** -- the number of states grows with bucket sizes, so it's fine for exercise inputs

[arrays]: https://github.com/vlang/v/blob/master/doc/docs.md#arrays
[structs]: https://github.com/vlang/v/blob/master/doc/docs.md#structs
[error-handling]: https://github.com/vlang/v/blob/master/doc/docs.md#error-handling
[assert]: https://github.com/vlang/v/blob/master/doc/docs.md#assert