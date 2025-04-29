---
aliases: [Goals]
publish: true
created: 2025-03-10T12:58:21+09:00
modified: 2025-04-29T20:15:11+09:00
---

# Goals
- Context free grammars (CFGs) - definition
- Context free languages (CFLs)
- Pushdown automata (PDA)
- Converting CFGs to PDAs

# CFG - Formal definition

Defn: A Context Free Grammar (CFG) G is a 4-tuple ($V, \Sigma, R, S$)
- finite set of variables
- finite set of terminal symbols
- finite set of rules (rule form: $V \rightarrow (V \bigcup \Sigma)^{\ast}$ )
- start variable
For $u, v \in (V \bigcup \Sigma)^{\ast}$ write
1) $u\rightarrow v$ if can go 
2) $u \rightarrow v$ if

# PDA - Formal definition

$(Q, \Sigma, \Gamma, \delta, q_{0}, F)$