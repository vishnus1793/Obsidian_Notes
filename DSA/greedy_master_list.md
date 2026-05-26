# Greedy Algorithms / Paradigms Master List

Not just named algorithms — actual greedy *patterns*, proof styles, structures, and archetypes.

---

# 1. Earliest Finish Time Greedy

Choose interval that finishes earliest.

Canonical:
- Activity Selection
- Non-overlapping Intervals
- Minimum Arrows to Burst Balloons

Core idea:
> preserve maximum future room.

---

# 2. Earliest Start Time Greedy

Process intervals by start time.

Used for:
- Merge Intervals
- Sweep Line
- Meeting Rooms

---

# 3. Shortest Processing Time First (SPT)

Choose smallest duration/job first.

Used in:
- minimizing average completion time
- CPU scheduling

---

# 4. Highest Profit First

Take highest value first.

Used in:
- Job Sequencing
- scheduling with deadlines

---

# 5. Highest Ratio First

Sort by:

\[
\frac{value}{weight}
\]

Canonical:
- Fractional Knapsack

---

# 6. Largest First Greedy

Take biggest contributor first.

Used in:
- minimizing operations
- reducing sums quickly
- Huffman-like merge variants

---

# 7. Smallest First Greedy

Take cheapest/lightest first.

Used in:
- maximize count under budget
- purchasing problems
- matching

---

# 8. Lexicographically Smallest Greedy

Always choose smallest possible valid option.

Used in:
- Remove Duplicate Letters
- smallest subsequence
- canonical string construction

---

# 9. Lexicographically Largest Greedy

Opposite version.

---

# 10. Two Pointer Greedy

Pair extremes intelligently.

Canonical:
- Boats to Save People
- Assign Cookies
- Advantage Shuffle

Core idea:
> extreme values constrain solution most.

---

# 11. Monotonic Stack Greedy

Maintain optimal monotonic structure.

Used in:
- Remove K Digits
- Next Greater Element
- Daily Temperatures
- Histogram problems

---

# 12. Monotonic Queue Greedy

Maintain best candidate in sliding window.

---

# 13. Priority Queue Greedy

Repeatedly extract best current option.

Used in:
- Huffman Coding
- IPO problem
- Task Scheduler
- Merge K arrays

---

# 14. Greedy + Heap Replacement

Replace worst chosen element when better arrives.

Canonical:
- Course Schedule III

Pattern:

```java
if(new better){
    remove worst
    add current
}
```

---

# 15. Sweep Line Greedy

Process events chronologically.

Used in:
- skyline
- railway platforms
- interval overlap
- calendar problems

---

# 16. Deadline Scheduling Greedy

Sort by deadline.

Maintain feasible set.

Canonical:
- Course Schedule III
- EDF scheduling

---

# 17. Earliest Deadline First (EDF)

Choose task with nearest deadline.

Real-time systems classic.

---

# 18. Union-Find Greedy

Greedily connect components.

Canonical:
- Kruskal MST

---

# 19. Kruskal’s Algorithm

Sort edges ascending.
Take if no cycle.

Classic MST greedy.

---

# 20. Prim’s Algorithm

Expand cheapest edge outward.

Also greedy MST.

---

# 21. Dijkstra’s Algorithm

Greedy shortest path.

Choose currently closest node.

Works because:
- nonnegative weights

---

# 22. Best-First Expansion

Expand locally optimal state.

Generalization of Dijkstra/A* style.

---

# 23. Huffman Greedy

Merge two smallest repeatedly.

Core invariant:
> deepest nodes should have smallest frequencies.

---

# 24. Greedy Coin Change

Take largest denomination first.

Only works for canonical systems.

---

# 25. Exchange Greedy

Swap local structure to improve globally.

Common proof technique.

---

# 26. Stay Ahead Greedy

Maintain:

\[
Greedy_i \ge Optimal_i
\]

at every step.

---

# 27. Cut Property Greedy

MST theory.

Minimum edge crossing a cut is safe.

Used in:
- Kruskal
- Prim

---

# 28. Interval Partitioning Greedy

Assign intervals to minimum resources.

Use min heap of end times.

---

# 29. Resource Allocation Greedy

Assign scarce resources optimally.

Examples:
- Meeting Rooms
- CPU allocation

---

# 30. Load Balancing Greedy

Assign next job to least loaded machine.

---

# 31. Greedy Matching

Match smallest compatible pair.

Canonical:
- Assign Cookies
- matching arrays

---

# 32. Stable Matching Greedy-like

Deferred acceptance.

Not purely greedy but greedy-flavored.

Canonical:
- Gale-Shapley

---

# 33. Greedy BFS Layer Expansion

Expand current reachable frontier.

Canonical:
- Jump Game II

---

# 34. Furthest Reach Greedy

Track maximum future reach.

Canonical:
- Jump Game
- Jump Game II

---

# 35. Local Peak Greedy

Choose locally dominant option.

Used in:
- hill climbing
- approximation algorithms

---

# 36. Greedy Bitwise Construction

Construct answer bit-by-bit greedily.

Common in:
- XOR problems
- trie problems

---

# 37. Prefix Greedy

Fix answer left-to-right.

Canonical:
- partition labels
- string construction

---

# 38. Suffix Greedy

Fix answer right-to-left.

---

# 39. Bidirectional Greedy

Greedy from both ends.

Used in:
- deque optimization
- palindrome transformations

---

# 40. Frequency Greedy

Act based on counts.

Canonical:
- Rearrange String
- Task Scheduler

---

# 41. Character Frequency Heap Greedy

Repeatedly use most frequent valid character.

---

# 42. Greedy Rearrangement

Reorder to satisfy constraints.

Examples:
- reorganize string
- avoid adjacent duplicates

---

# 43. Greedy Compression

Merge smallest structures first.

Canonical:
- Huffman
- optimal merge pattern

---

# 44. Optimal Merge Pattern

Always merge smallest files first.

---

# 45. Fractional Greedy

Partial selection allowed.

Canonical:
- Fractional Knapsack

---

# 46. Greedy Feasibility

Binary search answer.
Greedy checks validity.

Canonical:
- Aggressive Cows
- Minimize maximum load

---

# 47. Greedy Partitioning

Split optimally under constraints.

---

# 48. Greedy Packing

Fit items efficiently.

Canonical:
- bin-packing approximations

---

# 49. First Fit Greedy

Put item in first valid container.

---

# 50. Best Fit Greedy

Put item in tightest valid container.

---

# 51. Worst Fit Greedy

Opposite heuristic.

---

# 52. Greedy Coloring

Assign smallest available color.

Canonical:
- interval graph coloring

---

# 53. Greedy Tree Construction

Locally optimal tree growth.

Canonical:
- Prim
- Huffman

---

# 54. Greedy Graph Traversal

Always take best edge/node next.

---

# 55. Greedy Edge Removal

Remove least useful edges first.

---

# 56. Greedy Edge Addition

Add safest edge first.

---

# 57. Greedy Spanning Structure

Incrementally build valid structure.

---

# 58. Greedy Interval Cover

Cover line with minimum intervals.

Classic theorem.

---

# 59. Greedy Set Cover Approximation

Choose set covering most uncovered elements.

Approximation algorithm.

---

# 60. Greedy Vertex Cover Approximation

Pick edge → include both endpoints.

---

# 61. Greedy Scheduling with Replacement

Take task if possible.
Else replace worst task.

VERY important.

---

# 62. Greedy Median Strategy

Choose median minimizes absolute deviation.

---

# 63. Greedy Pairing

Pair:
- largest-smallest
- closest values
- complementary values

---

# 64. Greedy Ordering

Correct ordering itself solves problem.

Examples:
- largest number problem
- custom concatenation order

---

# 65. Greedy Concatenation

Sort strings by:

```text
a+b vs b+a
```

Canonical:
- Largest Number

---

# 66. Greedy Prefix Sum

Take until threshold exceeded.

---

# 67. Greedy Balancing

Continuously rebalance structure.

---

# 68. Greedy Energy Management

Use resources where marginal gain highest.

---

# 69. Greedy Cache Eviction

Evict least useful item.

Canonical:
- LRU
- Belady optimal

---

# 70. Offline Greedy

Sort queries/data together.

Used in:
- Mo’s-like offline processing
- interval activation

---

# 71. Event Activation Greedy

Activate/deactivate structures over time.

---

# 72. Greedy Segment Expansion

Expand interval/window maximally.

---

# 73. Sliding Window Greedy

Maintain maximal/minimal valid window.

---

# 74. Greedy Shrinking Window

Shrink only when invalid.

---

# 75. Greedy Augmentation

Incrementally improve feasible solution.

---

# 76. Greedy Matroid Optimization

Theoretical foundation of many correct greedies.

If problem forms a matroid:
greedy works.

Huge theory topic.

---

# 77. Submodular Greedy

Approximation theory.

Choose item with largest marginal gain.

Used in:
- influence maximization
- coverage optimization

---

# 78. Primal-Dual Greedy

Advanced approximation algorithms.

---

# 79. Greedy Randomized Algorithms

Locally optimal randomized choice.

---

# 80. Online Greedy

Must decide immediately without future knowledge.

---

# 81. Adaptive Greedy

Greedy changes based on evolving constraints.

---

# 82. Greedy DP Hybrid

Greedy inside DP transitions.

Very common.

---

# 83. Greedy Convex Hull Trick Ordering

Sort slopes/queries strategically.

---

# 84. Greedy Geometry

Choose nearest/farthest geometric structure.

---

# 85. Greedy Topological Choice

Always process node with smallest/largest property.

---

# 86. Greedy Elimination

Repeatedly eliminate weakest candidate.

---

# 87. Greedy Survivorship

Keep strongest feasible candidates.

---

# 88. Greedy Selection Under Constraints

Choose best feasible at each step.

General archetype.

---

# 89. Greedy State Compression

Collapse states by keeping dominant ones.

---

# 90. Greedy Dominance

Discard dominated solutions.

---

# 91. Greedy Canonicalization

Force canonical structure.

---

# 92. Greedy Incremental Construction

Build answer piece-by-piece irreversibly.

---

# 93. Greedy Local Repair

Repair violations minimally.

---

# 94. Greedy Exchange Chains

Repeated local exchanges improve solution.

---

# 95. Greedy Boundary Expansion

Expand from boundaries inward/outward.

---

# 96. Greedy Neighbor Selection

Choose locally best adjacent state.

---

# 97. Greedy Dynamic Frontier

Maintain current optimal frontier.

---

# 98. Greedy Competitive Strategy

Game-theoretic local optimization.

---

# 99. Greedy Approximation Algorithms

Not optimal but provably close.

Important NP-hard area.

---

# 100. Parametric Greedy

Optimize parameter using greedy feasibility.

---

# The Deep Truth About Greedy

Most greedy algorithms are secretly one of these:

| Core Principle | Example |
|---|---|
| preserve future flexibility | activity selection |
| take best marginal gain | set cover |
| process constraints earliest | EDF |
| repeatedly use best candidate | heaps |
| sort to reveal structure | intervals |
| maintain optimal frontier | Dijkstra |
| merge smallest repeatedly | Huffman |
| pair extremes | two pointers |
| discard dominated states | monotonic stack |

---

# The Ultimate Greedy Diagnostic

When solving a problem ask:

1. If I sort something, does structure appear?
2. Is there a “safest” irreversible move?
3. Does local optimality preserve future options?
4. Can an optimal solution be transformed into greedy one?
5. Is feasibility monotonic?
6. Can worst choices be replaced later?
7. Are constraints interval-like or order-like?

If yes:
greedy is probably nearby.
