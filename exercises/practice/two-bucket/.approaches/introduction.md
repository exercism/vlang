# Introduction

The Two Bucket problem asks you to measure an exact amount of water using two buckets of different sizes. You can fill, empty, and pour between buckets. The challenge is to find the minimum number of moves.

There are two main approaches to solve this:

## Breadth-First Search (BFS)

Model the problem as a state space search. Each state represents the amount of water in each bucket. BFS explores all possible states level by level, guaranteeing the shortest path (minimum moves) to the goal.

This is the approach used in the example solution. It's intuitive and works well for the problem constraints.

## Extended GCD (Mathematical Approach)

Use number theory: a solution exists if and only if the goal is a multiple of the GCD of the two bucket sizes. The Extended Euclidean Algorithm finds the coefficients to express the GCD as a linear combination of the bucket sizes, which directly gives the solution.

This approach is more efficient for large bucket sizes and provides mathematical insight into when a solution is possible.

## Which approach to use?

- **BFS**: Simpler to understand and implement. Good for learning state space search. The example solution uses this.
- **Extended GCD**: More elegant mathematically. Better performance for very large buckets. Recommended if you're comfortable with number theory.
