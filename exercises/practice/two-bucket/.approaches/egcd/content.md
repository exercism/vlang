# Extended GCD (Mathematical Approach)

```v
module main

import math

enum BucketId {
	one
	two
}

struct Solution {
	moves        int
	goal_bucket  BucketId
	other_bucket int
}

// Prefer bucket one if both hold the goal.
fn solution(moves int, contents_one int, contents_two int, goal int) Solution {
	if contents_one == goal {
		return Solution{moves, .one, contents_two}
	}
	return Solution{moves, .two, contents_one}
}

// Returns moves and the final contents of the start and other buckets.
// f fills of the start bucket and k fills of the other bucket leave s*f - d*k = goal.
fn plan(s int, d int, goal int) (int, int, int) {
	if goal == s {
		return 1, s, 0
	}
	if goal == d {
		start_contents := if goal < s { s - d } else { s }
		return 2, start_contents, d
	}

	// x is the inverse of s/g modulo d/g.
	g, x, _ := math.egcd(s, d)
	step := d / g
	mut f := int((x * (goal / g)) % step)
	if f <= 0 {
		f += int(step)
	}
	k := int((i64(s) * f - goal) / d)

	if goal < s {
		// Goal left in the start bucket, other bucket full.
		return 2 * (f + k - 1), goal, d
	}
	// Goal poured into the other bucket, start bucket empty.
	return 2 * (f + k), 0, goal
}

pub fn measure(capacity_one int, capacity_two int, goal int, start_bucket BucketId) !Solution {
	assert goal != 0
	if goal > math.max(capacity_one, capacity_two)
		|| goal % int(math.gcd(capacity_one, capacity_two)) != 0 {
		return error('impossible')
	}
	if start_bucket == .one {
		moves, contents_one, contents_two := plan(capacity_one, capacity_two, goal)
		return solution(moves, contents_one, contents_two, goal)
	}
	moves, contents_two, contents_one := plan(capacity_two, capacity_one, goal)
	return solution(moves, contents_one, contents_two, goal)
}
```

## The Strategy

Call the starting bucket the source, with capacity `s`, and the other bucket the destination, with capacity `d`.
The solution repeats three moves:

- if the source is empty, fill it
- if the destination is full, empty it
- otherwise, pour the source into the destination

Only the starting bucket is used as the source.
The rule that the starting bucket may not be empty while the other bucket is full rules out the reverse strategy.

## The Equation: `s*f - d*k = goal`

Let `f` be the number of times the source is filled, and `k` the number of times the destination becomes full.
Each fill adds `s` liters, and each time the destination becomes full, `d` liters are set aside (and later emptied).
So the goal is reached when

```
s*f - d*k = goal
```

This is a linear Diophantine equation.
By [Bézout's identity][bezout], it has integer solutions if and only if `gcd(s, d)` divides `goal`.
The goal must also fit in one of the buckets.
`measure` checks both conditions first:

```v
if goal > math.max(capacity_one, capacity_two)
	|| goal % int(math.gcd(capacity_one, capacity_two)) != 0 {
	return error('impossible')
}
```

## Finding the Smallest `f`

The equation says `s*f ≡ goal (mod d)`.
Dividing everything by `g = gcd(s, d)` gives `(s/g)*f ≡ goal/g (mod d/g)`.

[`math.egcd(s, d)`][egcd] uses the [extended Euclidean algorithm][extended-euclid] to return `g`, `x` and `y` with `s*x + d*y = g`.
Dividing by `g` shows that `x` is the inverse of `s/g` modulo `d/g`.
So multiplying both sides by `x` gives

```
f ≡ x * (goal/g) (mod d/g)
```

The smallest positive `f` is that remainder, with `d/g` in place of `0`.
V's `%` keeps the sign of the left operand, so a negative remainder is also moved up by `d/g`:

```v
g, x, _ := math.egcd(s, d)
step := d / g
mut f := int((x * (goal / g)) % step)
if f <= 0 {
	f += int(step)
}
k := int((i64(s) * f - goal) / d)
```

`egcd` returns `i64` values, so `x * (goal / g)` is calculated with `i64`.
`s * f` can be as large as the least common multiple of `s` and `d`, so it is also calculated with `i64`, to avoid overflowing `int` with large buckets.

## Counting Moves

Every pour ends with the source empty or the destination full.

- **Goal left in the source** (`goal < s`): the source holds `goal` just after the destination becomes full for the `k`-th time.
  There were `f` fills, `k - 1` empties, and `f - 1 + k` pours, so `2 * (f + k - 1)` moves.
  The destination is full.
- **Goal poured into the destination** (otherwise): the source is empty and the destination holds `goal`.
  There were `f` fills, `k` empties and `f + k` pours, so `2 * (f + k)` moves.

## Special Cases

Two cases are handled before solving the equation:

- `goal == s`: 1 move, because filling the starting bucket is enough.
- `goal == d`: 2 moves.
  Fill the starting bucket, then pour it into the other bucket if `goal < s`, or fill the other bucket otherwise.

`plan` returns the final contents of the source and the destination.
`measure` maps them back to bucket one and bucket two, and `solution` reports bucket one if it holds the goal, otherwise bucket two.
This decides the case where both buckets hold the goal, such as buckets of 6 and 3 with a goal of 3.

## Example

Buckets 3 and 5, goal 1, start bucket one, so `s = 3` and `d = 5`:

- `gcd(3, 5) = 1`, so the goal is possible.
- `3*2 - 5*1 = 1`, so `x ≡ 2 (mod 5)` and `f = 2*1 mod 5 = 2`.
- `k = (3*2 - 1) / 5 = 1`.
- `goal < s`, so the goal is left in the source: `2 * (2 + 1 - 1) = 4` moves, with 5 liters in the other bucket.

| Move | Bucket 1 | Bucket 2 | Action |
|------|----------|----------|--------|
| 1    | 3        | 0        | Fill bucket 1 |
| 2    | 0        | 3        | Pour 1->2 |
| 3    | 3        | 3        | Fill bucket 1 |
| 4    | 1        | 5        | Pour 1->2 (goal reached!) |

## Verification

This approach was checked against a breadth-first search for every pair of bucket sizes from 1 to 15 (goals 1 to 16, both start buckets), and for 20,000 random cases with sizes up to 60.
That is strong evidence but not a proof.

## Complexity

There is no search.
The work is dominated by the `egcd` call, which takes O(log min(s, d)) steps.
Space use is constant.

[bezout]: https://en.wikipedia.org/wiki/B%C3%A9zout%27s_identity
[egcd]: https://modules.vlang.io/math.html#egcd
[extended-euclid]: https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm
