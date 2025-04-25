# これは何？

[The Simple Essence of Algebraic Subtyping](https://lptk.github.io/programming/2020/03/26/demystifying-mlsub.html)を読んだ簡単なまとめです。読んだ時に書いたメモなので内容の正確性や読みやすさへの保証は持てません。詳しくは元論文と[Githubの実装](https://github.com/LPTK/simple-sub)に当たってください。

Algebraic SubtypingのMLsubでは、biunificationというbisubstitutionとpolar typesという新しい概念に依存していて抽象代数に関する深い知識がないと難しいアルゴリズムが使われている。この論文ではMLsub相当の機能を持った代替であるSimple-subというアルゴリズムを提唱している。MLsubに比べSimple-subは500以内のScalaコードで書かれていて抽象代数の知識が無くとも理解がしやすく簡単である。
## 1 INTRODUCTION

参考
[Safely typing algebraic effects](http://gallium.inria.fr/blog/safely-typing-algebraic-effects)
Algebraic Effectsのある言語にMLsubの型推論アルゴリズムを組み込む話。
パリでの[MPRI](https://wikimpri.dptinfo.ens-cachan.fr/)というプログラムの中の[Functional programming and type systems](https://gitlab.inria.fr/fpottier/mpri-2.4-public/tree/978160d262d503714e212fc2d28c9451c63fe714)というレクチャーで作った言語らしい。
### この論文の構成
2. MLsubとalgebraic subtypingの理論背景の説明
3. Simple-sub型推論のアルゴリズム
4. Simple-subによって推論された型を単純化する手法
5. 安全性(soundness)と完全性(completeness)の定理を使ったSimple-subの正しさの証明。証明に必要な最低限の部分型関係の形式化。
6. 大量のランダム生成されたプログラムに対して、Simple-subとMLsubの型推論が同じ結果を返すことの検証。
## 2 ALGEBRAIC SUBTYPING AND MLSUB

### 2.1 Background on Algebraic Subtyping

部分型付けの形式化の手法には少なくとも三種類の派閥があるらしい。
- Syntactic approaches
	- この論文で使われている手法。
	- 直接的な仕様(普通は推論規則)を元に部分型関係を定義する。
	- 型の構文に従う?(closely following the syntax of types)
- Semantic approaches
	- 型を型を持つ値の集合として見る。
	- 部分型関係を集合同士の包含関係として定義する。
	- 参考： [Semantic subtyping: Dealing set-theoretically with function, union, intersection, and negation types](https://dl.acm.org/doi/10.1145/1391289.1391293)
	- https://arxiv.org/pdf/2306.06391
- Algebraic approaches
	- 型を[分配束](https://en.wikipedia.org/wiki/Distributive_lattice)の抽象的な要素として定義する。
	- 型の代数的要素を注意深く選ぶことにより、拡張性や主要型の生成などを実現出来る。
	- 参考： [Polymorphism, subtyping, and type inference in MLsub](https://dl.acm.org/doi/10.1145/3093333.3009882)

#### Syntactic approaches
型システムの設計者に全ての推論規則の結果とインタラクションを考慮させることに強制させることによって、シンプルさを保てる手法。
部分型関係が望まれた代数的要素になっているか手動で確認する必要がある。
#### Semantic approaches
おそらく一番直感的で強力な手法。ただし多相性に関する難しさのせいで、ground types?が含まれているとパラドックスが簡単に生まれてしまい、拡張性が無くなってしまう。詳しくは[Algebraic Subtyping](https://www.cs.tufts.edu/~nr/cs257/archive/stephen-dolan/thesis.pdf)を参照。
#### Algebraic approaches
代数が型システムが
型システムの拡張性というコンセプトを強調していて、新しい型が追加されても既存のプログラムがwell-typedになるべきだとしている。
部分型の束を分配束にすることにより、型を単純化出来て、包摂をチェックするアルゴリズムを効率的に構築出来る。

### 2.2 Basics of MLsub

### 2.3 Informal Semantics of Types

#### 2.3.1 Set-Theoretic Types
#### 2.3.2 Recursive Types

#### 2.3.3 Typing Surprises
### 2.4 Expressiveness

#### 2.4.1 Polarity of Type Positions

Positive Positionはoutput
Negative Position はinput

| Positive | Negative      |
| -------- | ------------- |
| Unions   | Intersections |
|          |               |
|          |               |
#### 2.4.2 Consequence of the Polarity Restriction
### 2.5 Essence of MLsub Type Inference

## 3 THE SIMPLE-SUB TYPE INFERENCE ALGORITHM
### 3.1 Simple-sub Syntax

### 3.2 Basic Type Inference

### 3.3 User-Facing Types Representations
### 3.4 Examples

### 3.5 Let Polymorphism and Recursion
### 3.6 Summary
Simple-subではbiunificationと違い伝統的な型推論アルゴリズムに似たアルゴリズムで同じ結果になる実装を簡単に実現出来る。
MLsubの主要型と部分型を含む型推論にはbisubstitutionとpolar typesは必須ではない。
## 4 SIMPLIFYING TYPES
推論される型は冗長な部分があったり、単一化や除去の出来る型変数を含んでいることがある。コンパクトで理解しやすい型にするためにも、部分型の含む型推論では推論された型の単純化が重要になる。もし単純化をしなければ推論される型の量は線形に増加してしまう。
### 4.1 Type Simplification Tradeoffs
### 4.2 Type Simplification in MLsub
型の集合をfinite-state automataとして表現できる。
automata theoryのtype automataという手法を使ってType Simplificationが実現できるらしい。難しいので今回は使わない。
### 4.3 Type Simplification in Simple-sub
co-occurrence analysis

hash consing

## 5 FORMALIZATION OF SIMPLE-SUB

### 5.1 A Syntax-First Definition of Subtyping

## 6 EXPERIMENTAL EVALUATION
Simple-subとMLsubの実装で、ランダムに生成された1,313,832件の式を評価した結果、515,509件がwell-typedと、798,321件がill-typedと判断されたらしい。

Subsumption checking

Generated expressions

Bugs found in MLsub
MLsubのシャドーイングのバグが見つかった。
## 7 CONCLUSIONS AND FUTURE WORK