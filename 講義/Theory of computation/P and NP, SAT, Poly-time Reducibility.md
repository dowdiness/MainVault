---
aliases: [Nondeterministic Complexity]
created: 2025-03-30T18:54:13+09:00
modified: 2025-05-21T15:17:14+09:00
publish: true
---

# Nondeterministic Complexity


## ハミルトン経路問題とは？

ハミルトン経路とは、グラフ内の各頂点をちょうど一度だけ訪れる経路です。HAMPATH決定問題は「与えられたグラフGと2つの頂点s、tに対して、sからtへのハミルトン経路は存在するか？」を問います。
### $HAMPATH \in NP$

これはハミルトン経路問題が計算量クラスNP（非決定性多項式時間）に属することを示す証明です。
クラスNPに属しているかを示すためには
問題がクラスNPへ所属していることを示す標準的な手法を教えて下さい。

Theorem: $HAMPATH \in NP$
Proof:
"On input $\langle G, s, t\rangle$ (Say $G$ has $m$ nodes)
1. Nondeterministically write a sequence $v_{1}, v_{2}, ..., v_{m}$ of $m$ nodes.
2. Accepts if
	1. $v_{1} = s$
	2. $v_{m} = t$
	3. each ($v_{i}, v_{i+1}$) is an edge and no $v_{i}$ repeats.
3. Rejects if any condition falls."

certificate

NP = All languages where can verify membership quickly
P = All languages where can **test** membership quickly