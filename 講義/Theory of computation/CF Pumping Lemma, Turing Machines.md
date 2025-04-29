---
aliases: [Pumping Lemma for CFGs]
publish: true
created: 2025-03-11T15:30:25+09:00
modified: 2025-04-29T20:15:24+09:00
---

- Proving languages not Context Free
- Turing machine

$\setminus \smallsetminus$

# Pumping Lemma for CFGs

For every CFL A, there is a p such hat if $s \in A$ and $| s | \ge p$ then $s = uvxyz$ where
1) $uv^{i}xy^{i}z \in A$ for all $i \ge 0$
2) $vy \ne \epsilon$
3) $| vxy | \le p$

Informally: All long strings in $A$ are pumpable and stay $A$
