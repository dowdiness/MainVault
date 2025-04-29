---
date: 2025-04-26
tags: ["Compiler", "Semantics"]
aliases: [Big-step Operational Semantics]
date created: Saturday,2025 April 26th, 10:13:41 pm
date modified: Saturday,2025 April 26th, 10:58:05 pm
---

# [Big-step Operational Semantics](https://people.csail.mit.edu/feser/pld-s23/semantics.html#big-step-natural)

["Natural Semantics" (Gilles Kahn, 1987)](https://www.cs.tufts.edu/~nr/cs257/archive/gilles-kahn/natural-semantics.pdf) が初出。
元々はNatural Semanticsという名前だったらしい。
# [Coinductive big-step operational semantics](https://xavierleroy.org/publi/coindsem-journal.pdf)

この論文ではcoinductiveな定義と証明によりbig-step意味論でも停止とエラー(diverging)の表現が出来ることを提唱している。

従来は方法論ではsmall-step semanticsでは停止するプログラムとしないプログラムを有限と無限のreductionとして表現することで区別が出来るが、big-stepでは出来ずにまた間違ったプログラムと停止しないプログラムの区別も出来ない。なのでbig-stepコンパイラーの正しさの証明には向いていないが、コンパイラの最適化やトランスパイラの実装に向いているとされていた。
## 構成
1. 論文の紹介
2. Inductionとcoinductionの紹介
3. big-stepの言語と意味論
4. small-stepの意味論とcoinductive big-step definition of divergenceが同値なことの証明
5. 表示的意味論とも同値なことの証明
6. equivalence results to trace semantics?トレース意味論って何？
7. Coevaluation?
8. 型システムの健全性の証明
9. 抽象機械へのコンパイルでのsemantic preservationの証明

どうやら[[Trace Semantics]]というものが存在するらしい。