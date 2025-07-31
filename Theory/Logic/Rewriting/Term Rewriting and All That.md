---
title: Term Rewriting and All That
publish: true
tags: [compiler]
aliases: [Term Rewriting and All That]
created: 2025-07-31T15:08:29+09:00
modified: 2025-07-31T15:41:31+09:00
---

# Term Rewriting and All That

## 2. Abstract Reduction Systems

Abstract Reduction System is
- a pair $(A, \rightarrow)$, where the reduction is a binary relation on the set A, i.e. $\rightarrow \hspace{4pt} \subseteq A \times A$. Instead of $(a, b) \in \hspace{4pt} \rightarrow$ we write $a \rightarrow b$.
- If you want it terminate, [_well-founded_](https://ncatlab.org/nlab/show/well-founded+relation) relation is necessary.

### 2.1 Equivalence and reduction

Reduction is
1. a directed computation, which, starting from some point $a_{0}$, tries to reach a normal form by following the reduction  $a0 \rightarrow a1 \rightarrow ...$ . This corresponds to the idea of program evaluation.
2. a description of $\xleftrightarrow{\star}$, where $a \xleftrightarrow{\star} b$ means that there is a path between a and b where the arrow can be traversed in both directions

Equivalent is
- If two elements a and b are **equivalent** , i.e. if $a \xleftrightarrow{\star} b$ holds.

The central themes of this book is termination and confluence of reduction.

## 2.1.2 Basic definitions

A reduction is called
- Church-Rosser: iff $x \xleftrightarrow{\star} y \Rightarrow x \downarrow y$ 
-  confluent: 