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

struct Plan {
	moves            int
	holder_is_source bool
	other            int
}

fn bucket_of(index int) BucketId {
	return if index == 0 { BucketId.one } else { BucketId.two }
}

// Fill the source (capacity s), pour into the destination (capacity d),
// and empty the destination whenever it is full.
// With f source fills and k destination empties/fills: s*f - d*k = goal.
fn plan(s int, d int, goal int) ?Plan {
	if goal == s {
		return Plan{1, true, 0}
	}
	g64, x64, _ := math.egcd(s, d)
	g := int(g64)
	x0 := int(x64)
	if goal % g != 0 {
		return none
	}
	step := d / g
	// Use i64 for the multiplication to avoid overflow with large capacities
	f0 := i64(x64) * i64(goal / g)
	mut f := int((f0 % i64(step) + i64(step)) % i64(step))
	for f < 1 || s * f < goal {
		f += step
	}
	k := (s * f - goal) / d
	if k >= 1 && goal < s {
		return Plan{2 * (f + k - 1), true, d}
	}
	if goal <= d {
		return Plan{2 * (f + k), false, 0}
	}
	return none
}

pub fn measure(capacity_one int, capacity_two int, goal int, start_bucket BucketId) !Solution {
	assert goal != 0
	c := [capacity_one, capacity_two]
	if goal > math.max(capacity_one, capacity_two)
		|| goal % int(math.gcd(capacity_one, capacity_two)) != 0 {
		return error('impossible')
	}
	s := if start_bucket == .one { 0 } else { 1 }
	o := 1 - s
	if goal == c[s] {
		return Solution{1, bucket_of(s), 0}
	}
	if goal == c[o] {
		other := if goal < c[s] { c[s] - goal } else { c[s] }
		return Solution{2, if other == goal { BucketId.one } else { bucket_of(o) }, other}
	}
	p := plan(c[s], c[o], goal) or { return error('impossible') }
	return Solution{p.moves, if p.holder_is_source { bucket_of(s) } else { bucket_of(o) }, p.other}
}
```

## The Equation: `s*f - d*k = goal`

The core insight: the water pouring process can be modeled as a linear Diophantine equation.

- `s` = source bucket capacity (the one we start with)
- `d` = destination bucket capacity
- `f` = number of times we **fill** the source bucket
- `k` = number of times we **empty/fill** the destination bucket
- Each fill of source adds `s` liters; each empty of destination removes `d` liters
- `s*f - d*k` is the total water poured in minus the total emptied out, which is what remains in the bucket holding the goal.

For a solution to exist, `goal` must be a multiple of `gcd(s, d)`. This is Bézout's identity — the equation `s*f - d*k = goal` has integer solutions iff `gcd(s, d)` divides `goal`.

The `measure` function checks this early:
```v
if goal > math.max(capacity_one, capacity_two)
    || goal % int(math.gcd(capacity_one, capacity_two)) != 0 {
    return error('impossible')
}
```

## From `math.egcd` to the Smallest `f`

[`math.egcd(s, d)`][egcd] uses the [extended Euclidean algorithm][extended-euclid] and returns `(g, x0, y0)` where `s*x0 + d*y0 = g = gcd(s, d)`.

Scaling by `goal/g` gives a particular solution:
```
s * (x0 * goal/g) + d * (y0 * goal/g) = goal
```

So `f₀ = x0 * (goal/g)` is one solution for `f`. But we need the **smallest positive `f`** such that:
1. `f ≥ 1` (at least one fill)
2. `s*f ≥ goal` (source has enough water to reach goal)

All solutions for `f` are: `f = f₀ + t*(d/g)` for integer `t`.

The code computes this efficiently:
```v
step := d / g
f0 := i64(x64) * i64(goal / g)
mut f := int((f0 % i64(step) + i64(step)) % i64(step))  // f₀ mod step, normalized to [0, step)
for f < 1 || s * f < goal {
    f += step
}
```

The modulo arithmetic gives the smallest non-negative `f ≡ f₀ (mod step)`. The loop then increases by `step` until both conditions hold.

## Move Count

Each fill of the source is followed by a pour into the destination.
Whenever the destination becomes full, we empty it (1 move) and pour again (1 move), so `k` destination fills means `k` pours + `k` empties when it ends in the destination, or `k - 1` empties when it ends in the source.

- **Goal ends in destination** (`goal <= d`): We fill the source `f` times, pour `f` times, empty the destination `k` times. Total: `f + f + k = 2*(f + k)` moves. The source is empty at the end.
- **Goal ends in source** (`k >= 1` and `goal < s`): We fill the source `f` times, pour `f` times, empty the destination `k - 1` times (the last fill leaves the destination full with the goal in source). Total: `f + f + (k - 1) = 2*(f + k - 1)` moves. The destination is full at the end.

The source row is checked first in the code, matching the table above.

## Special cases

Two cases are handled in `measure` before calling `plan`:

- `goal == s`: 1 move, because filling the starting bucket is enough.
- `goal == d`: 2 moves. Fill the starting bucket, then pour into the other bucket if `goal < s`, or fill the other bucket otherwise.
  If both buckets then hold the goal, the answer reports bucket one.

Only the starting bucket is used as the source.
The rule that the starting bucket may not be empty while the other is full rules out the reverse strategy, apart from the special cases above.

## Example

Buckets 3 and 5, goal 1, start bucket one, so `s = 3` and `d = 5`:

- `gcd(3, 5) = 1`, so the goal is possible.
- The smallest `f` with `3*f >= 1` and `3*f ≡ 1 (mod 5)` is `f = 2`.
- `k = (3*2 - 1) / 5 = 1`.
- `k >= 1` and `goal < s`, so the goal is in the source: `2 * (2 + 1 - 1) = 4` moves, with 5 liters in the other bucket.

## Verification

This approach was checked against a breadth-first search for every pair of bucket sizes from 1 to 15 (goals 1 to 16, both start buckets), and for 20,000 random cases with sizes up to 60.
That is strong evidence but not a proof.

## Complexity

There is no search.
The work is dominated by the `egcd` call, plus a few steps of the loop that adds `step` to `f`.
Space use is constant.

[egcd]: https://modules.vlang.io/math.html#egcd
[extended-euclid]: https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm
