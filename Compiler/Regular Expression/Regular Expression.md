---
created: 2025-04-19T16:26:11+09:00
modified: 2025-05-14T16:14:46+09:00
---

# Regular Expression

VM法とNFAをDFA

## Implementing Regular Expressions

Russ cox の正規表現の実装法を解説したシリーズ

[Regular Expression Matching Can Be Simple And Fast](https://swtch.com/~rsc/regexp/regexp1.html)

```C
struct State
{
	int c;
	State *out;
	State *out1;
	int lastlist;
};
```

Rustでの実装
https://github.com/BurntSushi/rsc-regexp

![NFA state](https://swtch.com/~rsc/regexp/fig13.png)
有限状態オートマトンを使った実装の解説と、バックトラッキングの良くないところの解説。

## [Pike VMとEarley法の関係についてRubyで実装して考えてみる](https://makenowjust-labs.github.io/blog/post/2023-08-06-pike-earley/)

```
type IS =
	| Eps(to)
	| Branch(to1, to2)
	| Char(char, to)
	| Match

type Program = NFA(initial, transition)

type RE =
	| Cat(left, right)
	| Alt(left, right)
	| Rep(node)
	| Lit(char)
	
// /a*|ab/
let _re = Alt[Rep[Lit['a']], Cat[Lit['a'], Lit['b']]]
```
## [GoでシンプルなDFA型正規表現エンジンを実装した](https://blog.8ay.ac/articles/2019-12-16/implement-simple-dfa-regex-engine-in-golang)


Building a Regex Engine - Introduction
https://www.abstractsyntaxseed.com/blog/regex-engine/introduction

[正規表現技術入門を読んだ](https://keens.github.io/blog/2015/05/10/seikihyougengijutsunyuumonwoyonda/)

[An Analysis of On-the-fly Determinization of Finite-state Automata](https://www.researchgate.net/publication/373450646_An_Analysis_of_On-the-fly_Determinization_of_Finite-state_Automata)

[Regex engine internals as a library](https://burntsushi.net/regex-internals/)

[DFA minimization](https://en.wikipedia.org/wiki/DFA_minimization)

https://nickdrane.com/build-your-own-regex/

OCaml
https://github.com/yallop/ocaml-re-nfa
# Theory of átomata[☆](https://www.sciencedirect.com/science/article/pii/S0304397514002953#aep-article-footnote-id3)

[moonbit-automata-demo](https://github.com/bobzhang/moonbit-automata-demo)
[moonbit-regex-demo](https://github.com/bobzhang/moonbit-regex-demo)
[Quick Subset Construction](https://iris.unibs.it/retrieve/79c39ad2-3fa9-4dce-9e3d-74360cab62ee/paper.pdf)

## 論文

[Verified invertible lexer using regular expressions and DFAs](https://arxiv.org/pdf/2412.13581)
[Is Reuse All You Need? A Systematic Comparison of Regular Expression Composition Strategies](https://arxiv.org/abs/2503.20579)[Regular Expressions with Backreferences and Lookaheads Capture NLOG](https://arxiv.org/abs/2404.17492)
[A Coq Mechanization of JavaScript Regular Expression Semantics](https://arxiv.org/abs/2403.11919)
[An Evaluation of N-Gram Selection Strategies for Regular Expression Indexing in Contemporary Text Analysis Tasks](https://arxiv.org/abs/2504.12251)