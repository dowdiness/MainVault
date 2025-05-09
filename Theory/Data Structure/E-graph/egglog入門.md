---
title: "egglog入門"
source: "https://zenn.dev/hatoo/articles/5c4df054704999"
author:
  - hatoo
published: 2023-10-08
created: 2025-04-19T16:47:12+09:00
description: zenn
tags: ["clippings"]
aliases: [はじめに]
modified: 2025-04-29T19:36:42+09:00
---

# はじめに

[egglog](https://github.com/egraphs-good/egglog) は [Datalog](https://en.wikipedia.org/wiki/Datalog) [^1] っぽいプログラミング言語で、 [e-graph](https://en.wikipedia.org/wiki/E-graph) によって実行されます。
汎用的なプログラミング言語ではありませんが [^2] 、数式とかプログラムの最適化が得意で [herbie](https://github.com/herbie-fp/herbie) [^3] でも使われたりしています。

以下は有向グラフの2点間の最短距離を求める `egglog` のサンプルプログラムです。
ちなみにこれだけなら別にめちゃめちゃ最適なアルゴリズムで実行されるというわけでもなくそんなに有用ではないですが、雰囲気はわかると思います。

[webデモ](https://egraphs-good.github.io/egglog/?program=XQAAgABGAwAAAAAAAAAdiAknUrVWHTpuepG6fZxuMYQtKTWhZDDf6ZFAoDnc7Chyo2eDG4UrHP9r_DH4IHF3zIzHRE8bNDUpsITa64QNXRyXBMDBibPDvF0RsetlakuCMuYoeOxc_NNTGtNkhCriX3cfZfP3MBAWrXCcmtjx2j4urhdGFCdTNwa2nauxxKIQQH3R9NcHNeNPD4x4TXEwVY6IEAnNi3TBhYlerGgeQeLsVUoudYh6RGaDXMoPEWXmDvom2iO2yd_kwOaLZIgfnyM-gqFVK8Ks-qtty3UAkirggJ16SNhbIKRuy5U3ktt8HcfE-ZlP05RoDqy1CrMYPREq0oF00sl63yALImgH9uedz5HF9ZkhMAlxQ85F48FXXaqPsnz_MuhrPzRoXJidWhQxZFRGpTTTUYwraw3gdh-DpL6Tn1WQaTQcYB1OGsxj9tjRMSGvUiMdUC2z2N5rN9VYQ8R9pSCz57s64-xS6Q-dqmR0RXcwOK-x6A9rt9G1itFY32NgE4d5GbxJfWeTpuPxKm1yjzoFt46XVhaJH8ammNCT4IOGuKNnlTs5ipzrIg2gLoILCP0JvPJD5TgiDuo-4pW1QAq_I-acUGqUoNa8ix3hlDdJ2_KxkW3_rUXxpw%253D%253D)

path.egg

```lisp
; ;から行末まではコメント
; egglogの文法はLispっぽいが見た目がそうなだけ

; 二点間の距離を定義する
(function edge (i64 i64) i64)
; 二点間の最短距離
(function path (i64 i64) i64 :merge (min old new))

(rule ((= (edge x y) d))
    ((set (path x y) d)))

(rule ((= (path x y) d1) (= (edge y z) d2))
    ((set (path x z) (+ d1 d2))))

; 辺のデータを入れていく
(set (edge 1 2) 1)
(set (edge 2 3) 2)
(set (edge 3 4) 3)
; EqSat実行
(run 100) ; 最大100回までイテレーションする。正直100という数字は適当だが文法上必要なので入れている。別に1000とかでも良い
; 1-4間の最短距離を出力
(extract (path 1 4)) ; 6

; 1-4間にもっと短い経路があることを入力
(set (edge 1 4) 5)

; EqSat実行
(run 100)

; 1-4間の最短距離を出力
(extract (path 1 4)) ; 5
```

# Equality Saturationとe-graph

`egglog` 自体 `e-graph` をうまく使うためのインターフェースといった感じがあり、 `Equality Saturation` と `e-graph` の理解は外せないのでここで説明します。

# Equality Saturationが解く問題

手元にあるS式 [^4] があり、それをあらかじめ決めたルールに従って書き換えていってより良い形 [^5] にするという問題を考えます。このとき書き換える前と後はなにかの基準で同じ意味を持つようにルールを作ります。

例えば、数式を表すS式 `(/ (* a 2) 2)` を以下のルールに従って書き換えていきます。
ご存知の通り $(a \times 2) / 2 = a$ [^6] なので、最終的には `a` に書き換えられればOKです。

## ルール

`x`, `y`, `z` は任意のS式を表します。

1. `(* x 2)` を `(<< x 1)` に書き換える。 `<<` は左シフトの意味
2. `(* x 1)` を `x` に書き換える。
3. `(/ (* x y) z)` を `(* x (/ y z))` に書き換える。
4. `x` が `0` でない場合、 `(/ x x)` を `1` に書き換える [^7] 。

上のルールを適切な順番で適用していくと、 `(/ (* a 2) 2)` を `a` に書き換えられますが、 **順番が重要です** 。

- ルール1を最初に選んだ場合 `(/ (* a 2) 2)` ➡️ `(/ (<< a 1) 2)`...これ以上適用できるルールがない
- ルール3を最初に選んだ場合 `(/ (* a 2) 2)` ➡️ `(* a (/ 2 2))` ルール4を適用 ➡️ `(* a 1)` ルール2を適用 ➡️ `a`...これはOK🎉

つまり適当にルールを適用していく(そして元の式を消す [^8])だけでは最適な結果になるとは限らないのです。

これは最適化問題の頻出系なのでとりあえずビームサーチすればどうにかなりそうに見えますが、この問題に対してはもっと良いアルゴリズム(Equality Saturation)とそれを可能にするデータ構造(e-graph)があります。

# Equality Saturation

Equality Saturationはこの問題を次のように解きます。

1. 手元のS式に対して適用できるルールを全部適用して適用前、適用後の情報を全部覚えておく
2. 1を繰り返す。そのうちどのルールをどう適用しても新しい情報を得られなくなる(Saturationする😎) [^9] ので、そしたら次に行く
3. 手元にあるS式の中から(なにかの基準で)一番良いものを選んでそれを出力する

![Equality saturation takes an input terms, rewrites it using an e-graph, and extracts the best equivalent term.](https://res.cloudinary.com/zenn/image/fetch/s--S5WgUfL4--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_1200/https://storage.googleapis.com/zenn-user-upload/deployed-images/10a53a37d1c7f59f619970de.png%3Fsha%3D1f174a042ce03e3aee84c95e534a40e63f72b00d)
*[https://blog.sigplan.org/2021/04/06/equality-saturation-with-egg/](https://blog.sigplan.org/2021/04/06/equality-saturation-with-egg/) から引用した図*

実質すべての可能性を探索しているので必ず最適な解が得られます💪
ただ、過程で出てきたすべての情報を覚えなければいけないのでデータ構造を工夫しなければなりません。それが `e-graph` です。

# e-graph

`e-graph` は上で言うS式とその合同 [^10] 関係をグラフにして保存します。グラフの表現力はすごいので、指数関数的に増えていくS式を効率的に表すことができます。

`e-graph` は `node` と `e-class` を保存します。 `node` の子は `e-class` で、 `e-class` は合同な `node` の集合です。また、 `node` は常にただ一つの `e-class` に属します。
上の例でいうと `node` はS式を表し、 `e-class` は合同なS式の集合を表します。例えば `(* a 1)` と `a` はルール2によって合同だとみなせるので同じ `e-class` に属すはずです。

`e-graph` に対してルールを適用していくと、効率的に空間を使いながら、今までの情報を失うことなく新しい情報を `e-graph` に足していくことができます。

![e-graph figure](https://res.cloudinary.com/zenn/image/fetch/s--MaUk6cIi--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_1200/https://storage.googleapis.com/zenn-user-upload/deployed-images/09b1dfbff8d6ebeaea03eaee.png%3Fsha%3D0a20da7064dd1a19399f233ae9dbc7504f307cf5)
*[`egg` のサイト](https://egraphs-good.github.io/) にある図. `(/ (* a 2) 2)` を書き換えていく様子を表している*

図の実線で囲われている四角は `node` を表し、点線で囲われている四角は `e-class` を表しています。
`node` から伸びている線はすべて `e-class` につながっていることに注意してください。

上の例でいうと `(/ (* a 2) 2)` は図の左端のように表現できます。例えば `2` はそれ自体が `node` で `2` と合同な `node` は今のところ存在していないので `2` 一つで一個の `e-class` です。 `(/ (* a 2) 2)` には2回 `2` が出てきますがどちらも同じ `node` を指しているので同じ `e-class` に線が来ています。

`(* a 2)` を `(<< a 1)` に書き換えたのが左から二番目です。 `(* a 2)` と `(<< a 1)` はルール1によって合同なので同じ `e-class` に属しています。

そういう具合に `e-graph` にルールを適用していくと最終的にこれ以上ルールを適用できなくなり図の右端のようになります。 `(/ (* a 2) 2)` と `a` が同じ `e-class` に属しているので、 `(/ (* a 2) 2)` は `a` になりました🎉。

`e-graph` を具体的にどう実装するかは本記事では触れませんが [egg: Fast and extensible equality saturation](https://dl.acm.org/doi/10.1145/3434304) によく書いてあるので興味があれば読んでみてください。

# egg

[egg](https://github.com/egraphs-good/egg) は `e-graph` のライブラリです。 `egglog` 自体は `egg` に依存していませんが実質同じようなものが `egglog` に入っていると考えていいです。

`egg` の特徴は、ユーザーが明示的にEquality Saturationを実行するように設計されていることです。
古典的な `e-graph` の実装ではユーザーがe-graphになにか操作するたびに自動的にEquality Saturationを実行するのですが、 `egg` ではユーザーのタイミングでまとめてEquality Saturationを実行するのでより効率的になっています。詳しくは [egg: Fast and extensible equality saturation](https://dl.acm.org/doi/10.1145/3434304) 。

なので `egglog` でも上の方にあるサンプルコードのように、Equality Saturationを明示的に `(run 100)` みたいなやつで実行する必要があります。

# egglog

前置きが終わったので `egglog` の話に入ります。

# 環境構築

手軽に試したい場合はWeb上で動く [デモ](https://egraphs-good.github.io/egglog/) があります。

ローカルで実行する場合は特にバイナリ等はまだ配布されていないので、 `cargo` をでビルドします。
`cargo` はRustの開発環境についてきます。

```shell
cargo install --git https://github.com/egraphs-good/egglog
```

自作ですがVSCodeの拡張もあるので入れておくと便利です。公式の拡張も一応ありますが全然更新されてないのでおすすめしません。
[egglog-language](https://marketplace.visualstudio.com/items?itemName=hatookov.egglog-language)

# 実行方法

他の言語処理系と同じように、 `egglog` にソースコードを渡すと実行されます。拡張子は`.egg` にするのが慣習です。

```shell
egglog ${file}
```

`egglog -h` で他に何が出来るかわかりますが、特に重要なのは以下です。

- `egglog --desugar ${file}`: 糖衣構文を展開して出力する
- `egglog --to-dot ${file}`: 実行結果の `e-graph` のグラフを出力する

VSCodeの拡張を入れている場合は糖衣構文の展開結果をマウスオーバーで見ることができます。
![Screenshot of VSCode's extension is desugaring](https://res.cloudinary.com/zenn/image/fetch/s--MMNg7OWi--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_1200/https://storage.googleapis.com/zenn-user-upload/deployed-images/dfb2e5cbb93de22b6cb59a23.png%3Fsha%3D56f51e5b28677e545b1b37ad5ad57751dcfb3af0)
*`(datatype BDD (ITE i64 BDD BDD))` は `(sort BDD) (function ITE (i64 BDD BDD) BDD)` に展開されることがわかる*

![egglog --to-dot path.egg](https://res.cloudinary.com/zenn/image/fetch/s--ZSilrpUJ--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_1200/https://storage.googleapis.com/zenn-user-upload/deployed-images/7b1e379b8de877acc5278da4.png%3Fsha%3D59cc1b4bc9e4ee4c4fad4022656ac7e7258c8289)
*`egglog --to-dot path.egg` の結果。わかりやすい*

# リファレンス

[rustdoc](https://egraphs-good.github.io/egglog/docs/egglog/ast/enum.Command.html) にあるドキュメントが実質リファレンスとして使えます。

`egglog` のサンプルコードが読みたい場合は [tests](https://github.com/egraphs-good/egglog/tree/main/tests) を読むと良いです。

以下では重要かと思われる機能を紹介します。
上の方で `egglog` 自体 `e-graph` をうまく使うためのインターフェースといった感じがあると書きましたが、以下で説明する機能はすべて `egglog` 処理系がグローバルに持っている `e-graph` になにか操作するものだと思うとわかりやすいです。

## 文法

`egglog` のパーサーは [lalrpop](https://github.com/lalrpop/lalrpop) で実装されているので比較的短い [BNFっぽいDSL](https://github.com/egraphs-good/egglog/blob/main/src/ast/parse.lalrpop) を見れすべての文法がわかります。

## 組み込みのデータ型と関数

[src/sort](https://github.com/egraphs-good/egglog/tree/main/src/sort) に組み込み型と関数が定義されています。例えば `i64` って何ができたっけ？となった場合には [src/sort/i64.rs](https://github.com/egraphs-good/egglog/blob/main/src/sort/i64.rs) に目を通すと良いです。

以下に現在サポートされている組み込み型を列挙します。これで全てです。

- `Unit` いわゆるユニット型。リテラルは `()`
- `bool` 真偽値。リテラルは `true` と `false`
- `i64` 符号付き64bit整数 今のところ符号なしの整数型はない
- `f64` 64bitの浮動小数点数
- `Rational` 有理数 `(rational 1 2)` とかで作る(この例は `1/2` を作る)
- `String` 文字列
- `set` 集合 本記事では扱わない
- `map` 連想配列 本記事では扱わない
- `vec` 配列 本記事では扱わない。再帰的なデータ構造を使えばそれで足りる場面も多い。

`egglog` にはジェネリクスのような機能がまだないので `set` 、 `map` 、 `vec` の使い方は少し特殊になっています。 [テストコード](https://github.com/egraphs-good/egglog/blob/main/tests/vec.egg) を見ると使い方がわかります。

# Sort

`Sort` は `e-class` の識別子のような概念です。たぶん数学的に意味のある用語なのでしょう。同じ `Sort` を持つ `node` は同じ `e-class` に属します。組み込み型も `Sort` ですが、後述する `union` ができないという制限があります。
`Sort` は以下のように宣言します。

```lisp
(sort NameofSort)
```

# function

`Sort` だけあってもしょうがないので、 `function` で `Sort` を持つ `node` を定義できます。

他のプログラミング言語の関数とはだいぶ違います。単に引数の `Sort` 列をキーに、返り値の `Sort` を値に持つ連想配列を宣言していると考えるほうが近いです。そういう意味では後述する `rule` が関数の本体に近いです。

例

```lisp
(sort Math)
(function Const (i64) Math) ; (Const 123)とかでMathのnodeを作れる
```

例えば、ある2つの `Const` があったとき、引数が同じ `e-class` なら結果も常に同じ `Sort` (`Math`)になります。つまり、 `(Const 0)` と `(Const 0)` は同じ `Sort` を指します。

# union

`union` を使うと2つの `Sort` をマージすることができます。
組み込み型には使えません。例えば `0` と `1` を `union` して同じ `Sort` になってしまうとめちゃくちゃになってしまいます。

例

```lisp
(sort Math)
(function Const (i64) Math) ; 定数
(function Var (String) Math) ; 変数

(union (Var "x") (Const 123))
```

![e-graph for simple math egglog 1](https://res.cloudinary.com/zenn/image/fetch/s--jRUnbBpm--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_1200/https://storage.googleapis.com/zenn-user-upload/deployed-images/001a23348d77e06e068dfd63.png%3Fsha%3D1b87849c58e2cc3ad6c5f5651a8b268525e65de0)
*上のコードのe-graph*

# set

`set` は `node` に値をセットします。 `set` を使うと組み込み型を返す `function` に値をセットすることができます。これは `union` ではできません。

```lisp
(function F (i64) i64)

(set (F 0) 1)
; (union (F 0) 1) はエラーになる
```

`union` と `set` の使い分けはごちゃごちゃしている部分がありますが、間違えたら適切なエラーメッセージが出てくるのでそれに従って書き換えればだいたいなんとかなります。

# rule

正直これまでに説明した機能だけだと、だから何なんだ？って感じですが、 `rule` を使うと面白くなってきます。

`rule` は上で説明した `e-graph` のルールに相当します。

`rule` は `e-graph` にパターンマッチしてなにかアクションを起こす機能です。
そして `union` と `set` はアクションです。

後述する `run` コマンドを実行すると `e-graph` に繰り返し `rule` を適用していきます。

文法の該当部分を抜粋するとこんな感じです。

```
LParen "rule" <body:List<Fact>> <head:List<Action>> <ruleset:(":ruleset" <Ident>)?> <name:(":name" <String>)?> RParen => ...
...
pub Fact: Fact = {
    LParen "=" <mut es:Expr+> <e:Expr> RParen => ...
    <CallExpr> => ...
}
...
NonLetAction: Action = {
    LParen "set" LParen <f: Ident> <args:Expr*> RParen <v:Expr> RParen => ...
    LParen "delete" LParen <f: Ident> <args:Expr*> RParen RParen => ...
    LParen "union" <e1:Expr> <e2:Expr> RParen => ...
    LParen "panic" <msg:String> RParen => ...
    LParen "extract" <expr:Expr> RParen => ...
    LParen "extract" <expr:Expr> <variants:Expr> RParen => ...
    <e:CallExpr> => ...
}

pub Action: Action = {
    LParen "let" <name:Ident> <expr:Expr> RParen => ...
    <NonLetAction> => <>,
}
```

例

```lisp
(sort Math)
(function Const (i64) Math) ; 定数
(function Var (String) Math) ; 変数
(function Add (Math Math) Math) ; 足し算

(rule
    ((= expr (Add (Const x) (Const y)))) ; 文法上はFactのリスト。\`=\`でマッチした対象を変数に束縛している
    ((union expr (Const (+ x y)))) ; Actionのリスト ; \`+\`はi64の足し算
)

; 式を定義する
; e-graphにこの式を追加するというような意味合いもある。知らないものはEquality Saturationできないので。
(let e (Add (Var "a") (Add (Const 1) (Add (Const 2) (Const 3))))) ; a + (1 + (2 + 3))

; Equality Saturationを実行
(run 100)

(extract e) ; (Add (Var "a") (Const 6)). a + 6
```

![e-graph for simple math egglog 2](https://res.cloudinary.com/zenn/image/fetch/s--G-h3Atwi--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_1200/https://storage.googleapis.com/zenn-user-upload/deployed-images/ea7c526cf83c27fbbe79f14d.png%3Fsha%3De5f4b495199688a53465d6d49c16243e6213dac4)
*上のコードのe-graph*

上の例では `rule` を使って `Add` の引数がどちらも `Const` の場合にはそれを事前に計算してしまうようにしています。 `rule` にない `Var` とかは無視して出来るところだけやってくれるのでコンパイラで言う [Const Propagation](https://ja.wikipedia.org/wiki/%E5%AE%9A%E6%95%B0%E7%95%B3%E3%81%BF%E8%BE%BC%E3%81%BF) みたいなことを実質やっています。

実際これはすごいことです！例えばこれを拡張していけばきれいに [sympy.simplify](https://docs.sympy.org/latest/tutorials/intro-tutorial/simplification.html#simplify) や [TI-Nspire™ CX II](https://education.ti.com/en/products/calculators/graphing-calculators/ti-nspire-cx-ii-cx-ii-cas) についてる [CAS](https://ja.wikipedia.org/wiki/%E6%95%B0%E5%BC%8F%E5%87%A6%E7%90%86%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0) のようなものを作ることができます(破綻しないようにルールを追加していくのは非常に難しいですが😰)。しかも計算が間に合えば常に最適な結果を出力してくれます。

# :merge

`:merge` によって `function` に違う値が設定されたときの挙動を変化できます。`:merge` は `function` の宣言のときに指定します。

```lisp
(function F (i64) i64 :merge (min old new)) ; :mergeの中では\`old\`と\`new\`が使えるので複数の値がある場合にどうするかを指定できる。この場合は小さい方を採用する

(set (F 0) 0)
(set (F 0) 1) ; (min 0 1) => 0　なので意味ない
```

# let

もう上で使ってしまいましたが、 `let` は変数に値を束縛します。再代入はできません。
この文法じゃあグローバルな名前空間がぐちゃぐちゃになってしまうじゃないかと思うかもしれませんが回避策もあります。

それが、 `push` と `pop` です。この2つのコマンドでスコープを作ることができます。スコープを作るときには `push` を、スコープから抜けるときには `pop` を使います。

```lisp
(push) ; スコープを作る
(let x 0)
(pop) ; スコープから抜ける

(let x 1) ; 上でxを定義したスコープはすでにないのでOK
```

# run

`run` はEquality Saturationを実行します。 `run` を実行すると `rule` に従って `e-graph` を書き換えていきます。 `run` は最大で引数にいれた回数だけ実行されます。saturateしたらその時点で終わります。

他にも色々オプションがありますが、とりあえず適当に `(run 100)` とかやっておけばいいです。

# extract

`extract` は `e-graph` から引数の `e-class` の中で一番低コストな `node` を出力します。何をもって低コストかをコントロールする方法もあるのですが本記事では触れません。

# 糖衣構文

いくつか便利な糖衣構文を紹介します。

## datatype

`datatype` は `sort` と `function` まとめた糖衣構文です。

```lisp
(datatype Math
    (Const i64)
    (Var String)
    (Add Math Math)
)
```

は

```lisp
(sort Math)
(function Const (i64) Math)
(function Var (String) Math)
(function Add (Math Math) Math)
```

に展開されます。

## rewrite

`rewrite` は `rule` の糖衣構文です。
簡単な `rule` は `rewrite` で書くことができます。

```lisp
(rule
    ((= expr (Add (Const x) (Const y))))
    ((union expr (Const (+ x y))))
)
```

と

```lisp
(rewrite
    (Add (Const x) (Const y))
    (Const (+ x y))
)
```

は同じ意味です。

実際には機械的に

```lisp
(rule ((= v2___ (Const x))
       (= v4___ (Const y))
       (= rewrite_var__ (Add v1___ v3___))
       (= v2___ v1___)
       (= v4___ v3___))
      ((let v6___ (+ x y))
       (let v5___ (Const v6___))
       (union rewrite_var__ v5___))
         :name "(rewrite (Add (Const x) (Const y)) (Const (+ x y)))")
```

と展開されます

## relation

`function` は連想配列のようなものだと書きましたが、 `relation` は値がユニット型の連想配列、つまりセットのようなものを宣言する糖衣構文です。

```lisp
(relation Prime (i64)) ; 素数かどうかを表したいとする。単純に素数かそうでないかを表すだけなので返り値の意味はない。ユニット型でいい。
```

は

```lisp
(function Prime (i64) Unit :default ())
```

に展開されます

```lisp
(Prime 5) ; :default ()が設定されているので、これでPrimeのnodeを作ることができる
(set (Prime 2) ()) ; :default ()が設定されていないとこうしなければならない
```

ちなみにユーザーが定義した `sort` は `e-graph` にないものが必要になった場合新しい `sort` が自動で作られますが、ユニット型はそうはいかないので`:default` が必要になっています。

```lisp
(sort S)
(function F () S)

(F) ; 自動で新しいSが作られる
```

## declare

`declare` は新しい `Sort` を変数に割り当てます。

```lisp
(sort S)
(declare x S)
```

は

```lisp
(sort S)
(function v1___ () S)
(let x (v1___))
```

に展開されます。

ただ、現状可視化したときには関数名しか出てこず `x` がどこにあるかわからないのであまりおすすめしません。

```lisp
(sort S)
(function x () S)
(x)
```

![function x](https://res.cloudinary.com/zenn/image/fetch/s--ptLHLHJI--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_1200/https://storage.googleapis.com/zenn-user-upload/deployed-images/80abc2b3a4974cf6264a02e2.png%3Fsha%3D783edae658060f59dcb4cca82974e38ac46bcaab)
*現状上のように書かないとこの図はでてこない*

# おわりに

本記事では `egglog` にある機能の一部を紹介しました。
もっと色々知りたい方はソースコードや [テストコード](https://github.com/egraphs-good/egglog/tree/main/tests) を読んでみてください。

# 宣伝

`egglog` でコンパイラの最適化パスを実装してみたい方は一旦 [CFG](https://ja.wikipedia.org/wiki/%E5%88%B6%E5%BE%A1%E3%83%95%E3%83%AD%E3%83%BC%E3%82%B0%E3%83%A9%E3%83%95) を [RVSDG](https://arxiv.org/abs/1912.05036) に変換するとやりやすいです。
個人的に [brilt](https://github.com/hatoo/brilt) で実験しているので興味のある方はぜひ🙇

脚注

[GitHubで編集を提案](https://github.com/hatoo/zenn-content/blob/master/articles/5c4df054704999.md)

4

[^1]: Datalogについてはよくわからないので本記事では触れません🙇
[^2]: チューリング完全ではあると思うが例えばwebサーバーを書くといったことには適さないという意味
[^3]: 浮動小数点数の演算をより誤差が少なくなるように書き換えるプログラム
[^4]: S式みたいな雰囲気のもの。 `(x . y)` みたいなやつは考えない
[^5]: 例えば葉の数が少ないとか
[^6]: $a \times 2$ は絶対にオーバーフローしないとします
[^7]: $x=0$ の場合、 $0/0=1$ となってしまいとても危ないので明示的に禁止している。 [ゼロ除算#ゼロ除算に基づく誤謬](https://ja.wikipedia.org/wiki/%E3%82%BC%E3%83%AD%E9%99%A4%E7%AE%97#%E3%82%BC%E3%83%AD%E9%99%A4%E7%AE%97%E3%81%AB%E5%9F%BA%E3%81%A5%E3%81%8F%E8%AA%A4%E8%AC%AC) のようなことがそのまま起きる。え、じゃあルールを作るのってめっちゃ難しくない！？と思ったあなた、その通りです。ルールを自動で導出しようという研究もあるので興味のある方は [Rewrite Rule Inference Using Equality Saturation](https://www.mwillsey.com/papers/ruler) がおすすめです
[^8]: ASIAN KUNG-FU GENERATIONの名曲が思い出されます
[^9]: 実用的にはSaturateしなくてタイムアウトで終了することもある
[^10]: congruence。"等しい(equal)"とは少し意味合いが違うがとりあえず特に気にしなくて良い
