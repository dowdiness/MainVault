---
aliases: [Time Complexity, TIME Complexity Class]
publish: true
created: 2025-03-30T18:53:20+09:00
modified: 2025-04-29T20:33:00+09:00
---

[YouTube](https://youtu.be/asjAc90L8rE?si=ZKy7FLOd3Kkl1Wm0)


$A = \{a^{k}b^{k}| k\ge0\}$


- 1-tape TM: O(n log n)
- Multi-tape TM: O(n)

**Computability Theory: model independence**
**Complexity Theory: model dependence**

# TIME Complexity Class


All reasonable deterministic models are polynomially related.

# The Class P

Defn: $P=\bigcup_{k}TIME(n^{k})$ = Polynomial time decidable language
- Invariant for all reasonable deterministic models

$PATH \in P$

Polynomial Time: Each stage is polynomial and the total number of steps polynomial

# The Class NP
