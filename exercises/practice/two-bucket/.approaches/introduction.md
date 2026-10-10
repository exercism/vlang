# Introduction

The Two Bucket problem asks you to measure an exact amount of water using two buckets of different sizes. You can fill, empty, and pour between buckets. The challenge is to find the minimum number of moves.

There are two main approaches to solve this:

## Breadth-First Search (BFS)

Model the problem as a state space search. Each state represents the amount of water in each bucket. BFS explores all possible states level by level, guaranteeing the shortest path (minimum moves) to the goal.

This is the approach used in the example solution. It's intuitive and works well for the problem constraints.

Key idea: After every move, at least one bucket is empty or full. This bounds the state space to `2 * (capacity_one + capacity_two)` valid states, each mapped to a unique ID for O(1) visited checks. The `capacity_one`, `capacity_two`, and `combined_capacity` values come from the `Search` struct.

```v
fn (search Search) id_for_state(contents_one int, contents_two int) int {
	if contents_one == 0 { return contents_two }
	if contents_two == capacity_two { return capacity_two + contents_one }
	if contents_one == capacity_one { return capacity_one + 2 * capacity_two - contents_two }
	if contents_two == 0 { return 2 * combined_capacity - contents_one }
	panic('invalid state')
}
```

For more information, check the [BFS approach][approach-bfs].

## Extended GCD (Mathematical Approach)

Use number theory: a solution exists if and only if the goal is a multiple of the GCD of the two bucket sizes. The Extended Euclidean Algorithm finds the coefficients to express the GCD as a linear combination of the bucket sizes, which directly gives the solution without searching.

Core equation: `s*f - d*k = goal` where `s` = source bucket capacity, `d` = destination bucket capacity, `f` = source fills, `k` = destination empties/fills.

```v
g64, x64, _ := math.egcd(s, d)
g := int(g64)
step := d / g
// Use i64 for the multiplication to avoid overflow with large buckets
f0 := i64(x64) * i64(goal / g)
mut f := int((f0 % i64(step) + i64(step)) % i64(step))
for f < 1 || s * f < goal {
	f += step
}
k := (s * f - goal) / d
```

**Note**: The multiplications can overflow V's 32-bit `int` once capacity₁ × capacity₂ exceeds about 2 billion. For typical exercise inputs this is not an issue.

For more information, check the [Extended GCD approach][approach-egcd].

## Which Approach to Use?

| Aspect | BFS | Extended GCD |
|--------|-----|--------------|
| **Simplicity** | Easier to understand & implement | Requires number theory background |
| **Correctness** | Always correct (exhaustive search) | Verified up to bucket size 60 (see [Extended GCD approach][approach-egcd]) |
| **Performance** | O(capacity₁ + capacity₂) | O(log min(capacity₁, capacity₂)) |
| **Scalability** | Slows down with large buckets | Fast for large buckets |
| **Insight** | Shows the pouring sequence | Reveals *when* solutions exist |

- **BFS**: Simpler to understand and implement. Good for learning state space search. The example solution uses this.
- **Extended GCD**: More elegant mathematically. Better performance for very large buckets. Recommended if you're comfortable with number theory.

[approach-bfs]: https://exercism.org/tracks/vlang/exercises/two-bucket/approaches/bfs
[approach-egcd]: https://exercism.org/tracks/vlang/exercises/two-bucket/approaches/egcd