# Extended GCD (Extended Euclidean Algorithm)

## Overview

This approach uses number theory to solve the problem mathematically. The key insight: a solution exists if and only if the goal is a multiple of the greatest common divisor (GCD) of the two bucket sizes.

## Mathematical Foundation

The Water Pouring Problem is equivalent to finding integers x and y such that:

```
capacity_one * x + capacity_two * y = goal
```

Where:
- x = net fills of bucket one (positive = fill, negative = empty)
- y = net fills of bucket two (positive = fill, negative = empty)

This is a linear Diophantine equation. By Bézout's identity, it has integer solutions iff `gcd(capacity_one, capacity_two)` divides `goal`.

The Extended Euclidean Algorithm finds coefficients (x, y) such that:
```
capacity_one * x0 + capacity_two * y0 = gcd(capacity_one, capacity_two)
```

Multiplying by `goal / gcd` gives a solution to the original equation.

## Algorithm

```text
1. Compute g = gcd(capacity_one, capacity_two)
2. If goal % g != 0, return "impossible"
3. Use Extended Euclidean Algorithm to find (x0, y0) such that:
   capacity_one * x0 + capacity_two * y0 = g
4. Scale: x = x0 * (goal / g), y = y0 * (goal / g)
5. Adjust x, y to be valid move sequences:
   - While x < 0: x += capacity_two/g, y -= capacity_one/g (transfer moves)
   - While y < 0: y += capacity_one/g, x -= capacity_two/g
6. Simulate the moves to count steps and determine final state
```

## Converting Coefficients to Moves

The coefficients represent net operations. To convert to actual moves:
- Positive x: fill bucket one x times
- Negative x: empty bucket one |x| times
- Similar for y with bucket two
- Pouring operations are implicit in the transfers between buckets

## Complexity

- **Time**: O(log(min(capacity_one, capacity_two))) - Extended Euclidean Algorithm
- **Space**: O(1) - only a few integer variables

## Example

Buckets: 3 and 5, Goal: 1, Start: bucket one

1. `gcd(3, 5) = 1`, and `1 % 1 == 0` ✓
2. Extended GCD: `3 * 2 + 5 * (-1) = 1`
   - x = 2, y = -1
3. This means: fill bucket one 2 times, empty bucket two 1 time
4. Sequence: Fill 1 (3,0) → Pour 1→2 (0,3) → Fill 1 (3,3) → Pour 1→2 (1,5)
5. Result: 4 moves, goal in bucket 1, 5 in bucket 2

## Advantages

- **Optimal**: Directly computes minimum moves without search
- **Efficient**: Logarithmic time complexity
- **Insightful**: Reveals when solutions are impossible mathematically
- **Scalable**: Works for arbitrarily large bucket sizes

## When to Use

Prefer this approach when:
- Bucket sizes are very large (BFS would be slow)
- You want to understand the mathematical structure
- You need to prove impossibility quickly