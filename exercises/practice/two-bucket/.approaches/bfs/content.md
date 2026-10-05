# Breadth-First Search

## Overview

Model the problem as a graph where each node is a state (amount of water in each bucket) and edges represent valid moves (fill, empty, pour). BFS explores states level by level, guaranteeing the minimum number of moves to reach the goal.

## State Representation

A state is a pair `(contents_one, contents_two)` representing liters in each bucket. Since at least one bucket is always empty or full after each move, the number of valid states is bounded by `2 * (capacity_one + capacity_two)`.

## Valid Moves

From any state, you can:
1. **Fill** a bucket completely
2. **Empty** a bucket completely
3. **Pour** from one bucket to another until the source is empty or the target is full

## Algorithm

```text
1. Start with the initial state (based on start_bucket)
2. Enqueue the start state with move count = 1
3. While queue is not empty:
   a. Dequeue current state
   b. If either bucket equals goal, return solution
   c. Generate all valid next states
   d. Enqueue unvisited states with move count + 1
4. If queue exhausted, return "impossible"
```

## Optimizations

- **Visited tracking**: Use a boolean array indexed by a unique state ID to avoid revisiting
- **State ID mapping**: Map each valid state to a unique integer for O(1) visited checks
- **Exclude invalid start**: The opposite bucket being full while starting bucket is empty is invalid per problem rules

## Complexity

- **Time**: O(capacity_one + capacity_two) - each state visited at most once
- **Space**: O(capacity_one + capacity_two) - for the visited array and queue

## Example Walkthrough

For buckets of size 3 and 5, goal 1, starting with bucket one:

| Move | Bucket 1 | Bucket 2 | Action |
|------|----------|----------|--------|
| 1    | 3        | 0        | Fill bucket 1 |
| 2    | 0        | 3        | Pour 1→2 |
| 3    | 3        | 3        | Fill bucket 1 |
| 4    | 1        | 5        | Pour 1→2 (goal reached!) |

Result: 4 moves, goal in bucket 1, 5 liters in bucket 2
