---
title: shift/reset プログラミング入門
publish: true
tags: [continuation, cps, redex]
aliases: [shift and reset]
created: 2025-05-27T19:40:01+09:00
modified: 2025-06-03T04:18:20+09:00
---

# Introduction to Programming with Shift and Reset

下記の論文の読書メモです

- [英語](http://pllab.is.ocha.ac.jp/~asai/cw2011tutorial/main-e.pdf): Introduction to Programming with Shift and Reset
- [日本語](http://pllab.is.ocha.ac.jp/~asai/cw2011tutorial/main-j.pdf): shift/reset プログラミング入門

## この記事に必要な前提知識

- 関数型言語についての一般的な知識
- 継続についての事前知識はいりません
## 1 Introduction

shift/resetを使って継続を実装している例を紹介しています。

- [Representing Monads*](https://dl.acm.org/doi/pdf/10.1145/174675.178047): call/cc と reference cell を使ってエミュレートする例
- Scheme48: エミュレートではなく直接実装した例[^1]
- [Racket](https://racket-lang.org/)
- Delimited control in OCaml, abstractly and concretely
- [MinCaml](https://esumii.github.io/min-caml/)

このチュートリアルでは[OchaCaml](http://pllab.is.ocha.ac.jp/~asai/OchaCaml/)を使って説明しています。

## 2 Programming with Shift and Reset

### 2.1 継続とは

`Continuations represent the rest of the computation.`

継続とは、一言でいうと「その後の計算」のことである。

プログラムの実行には、プログラム中の一部を次に実行するべき式(redex)として選んで実行し、そのredexを評価した結果をその後の計算(“the rest of the computation”)に使って計算を進める。この“rest of the computation”を***継続***と呼ぶ。継続はどのようなプログラムの実行にも現れる基本的な概念です。

これから実行しようとしている部分を [ . . . ]（hole と呼ばれる）で表す。
継続は、「hole の値を受け取ったら、その後の計算を行う」という意味である。
継続は「例外が発生したときに捨てられる部分」という理解もできる。
holeに raise Abortという式を入れて例外を発生させるとに捨てられる計算が継続である。
継続というのは、現在、どこに着目しているかによって時々刻々と変わっていく。
#### 練習問題 1

次のプログラムに [ · ] を入れて、「次に実行すべき式」と「その継続」に分解せよ。前者の型は何か。 その型の値を渡されたら、継続は最終的に何型の値を返すか。

(1) 5 * (2 * 3 + 3 * 4)
(2) (if 2 = 3 then "hello" else "hi") ^ " world"
(3) fst (let x = 1 + 2 in (x, x))
(4) string_length ("x" ^ string_of_int (3 + 1))

### 2.2 限定継続とは

限定継続というのは「その後の計算」の中でもその範囲が定まっている（限定さ れている）もののことである。限定子 ⟨· · ·⟩ によって継続の区切り方を指定出来る。
例: `⟨3 + [5 ∗ 2]⟩ − 1` の継続は `⟨3 + [ · ]⟩`となり `− 1` は含まれない。

### 2.3 継続を限定する命令 reset

継続を区切るには `reset` を使う。

```ocaml
reset (fun () -> M)
```

`reset` を使うと `⟨3 + [5 ∗ 2]⟩ − 1` を

```ocaml
reset (fun () -> 3 + [5 * 2]) - 1
```

として表せれる。

限定継続は「`reset` を `try ... with Abort -> ...` で置き換え、現在の式を `raise Abort` で置き換えたとき に捨てられる部分」と理解することもできる。

上記の `reset` を使った限定継続は、

```ocaml
(try 3 + [raise Abort] with Abort -> 0) - 1
```

とも理解できる。
#### 練習問題 2

次のプログラムにおける限定継続とその型は何か

(1) 5 * reset (fun () -> [2 * 3] + 3 * 4)
cont: [・] + 3 * 4
Type: int -> int

(2) reset (fun () -> if [2 = 3] then "hello" else "hi") ^ " world"
if [・] then "hello" else "hi"
bool -> string

(3) fst (reset (fun () -> let x = [1 + 2] in (x, x)))
 let x = [・] in (x, x)
 int -> (int, int)
 
(4) string_length (reset (fun () -> "x" ^ string_of_int [3 + 1]))
"x" ^ string_of_int [・]
int -> string

### 2.4 限定継続をとって来る命令 shift

限定継続を取って来るには `shift` を使う。

```ocaml
shift (fun k -> M)
```

このshiftは、

1. 現在の限定継続を取り除き、 
2. それを関数にして k に束縛し、 
3.  M を実行する。

を意味する。
### 2.5 継続の破棄

継続を破棄する、例外に当たる処理。

```ocaml
shift (fun _ -> M)　 (* _ は他にどこにも現れない変数 *)
```

#### 練習問題 3
次の式の [ · ] に shift (fun _ -> M) の形の式を入れてその時点での継続を破棄して適当な値を返そう

(1) 5 * reset (fun () -> [·] + 3 * 4) 
shift (fun _ -> 1) -> 5 * 1 -> 5

(2) reset (fun () -> if [·] then "hello" else "hi") ^ " world"
shift (fun _ -> "Hello") -> "Hello" ^ " world" -> "Hello world" 

(3) fst (reset (fun () -> let x = [·] in (x, x)))
shift (fun _ -> (3, 5)) ->  fst (3, 5) -> 3

(4) string_length (reset (fun () -> "x" ^ string_of_int [·]))
shift (fun _ -> "string") -> string_length "string" -> 6
#### 練習問題 4

```ocaml
(* times : int list -> int *)
let rec times lst = match lst with
	[] -> 1
	| 0 :: rest -> shift (_ -> 0)
    | first :: rest -> first * times rest

(* timesの呼び出し方 *)
reset(fun () -> times [2; 3; 5])
```

### 2.6 継続の取り出し

```ocaml
shift (fun k -> k)

# let f x = reset (fun () -> 3 + shift (fun k -> k) - 1) x ;;
f : int => int = <fun>
# 
# f 10 ;;
-: int = 12
# 
```


#### 練習問題 5
次の式の [ · ] に shift (fun k -> k) を入れて、継続を取り出してみよ。得られた継続はどのような 関数か。その継続にいろいろな値を渡して実行してみよ。これらの継続の型は何か。

(1) reset (fun () -> 5 * ([·] + 3 * 4)) 
(2) reset (fun () -> (if [·] then "hello" else "hi") ^ " world") 
(3) reset (fun () -> fst (let x = [·] in (x, x))) 
(4) reset (fun () -> string_length ("x" ^ string_of_int [·]))

### 2.7 継続の保存

継続を自由に切り出して使うことができるようになると、実行を一時的に中断して取っておくことができる。この継続の保存によりコルーチンを実装することができる。

```ocaml
type tree_t = Empty
	        | Node of tree_t * int * tree_t ;;
```

```ocaml
(* print_int を使ったバージョン *)
let rec walk tree = match tree with
	Empty -> ()
	| Node (t1, n, t2) ->
		walk t1
		print_int n
		walk t2

(* yield を使ったバージョン *)
let rec walk tree = match tree with
	Empty -> ()
	| Node (t1, n, t2) ->
		walk t1
		yield n
		walk t2
		
(* yield の定義 *)
(* yield : int => unit *)
let yield n = shift (fun k -> Next (n, k)) ;;

let start tree = 
	reset (fun () -> walk tree; Done) ;;
	
type ’a result_t = Done
	| Next of int * (unit / ’a -> ’a result_t / ’a) ;;
```
### 2.8 継続の包み込み： printf

副作用のある処理？

```ocaml
shift (fun k -> fun () -> k "hello")
(* fun () -> k "hello" が thunk（0 引数関数）*)
```

このように継続を関数で包んで関数を返すようにすると、reset の内側にいながら reset の外側で渡される () にアクセス出来る。要するにreset の外側の情報にアクセスすることができるようになる。

#### 練習問題 8

```ocaml
reset (fun () -> "hello " ^ shift (fun k -> fun str -> k str) ^ "!")
```
### 2.9 答の型の変化

```ocaml
reset (fun () -> [...] ^ " world")
```

「答の型」とは、着目している式を取り囲む reset が返すものの型のこと。

### 2.10 継続の包み込み：状態モナド

### 2.11 継続を使った実行順序の変更（発展）

### 2.12 継続の複製

バックトラックの実現。例えば[充足可能性問題](https://ja.wikipedia.org/wiki/%E5%85%85%E8%B6%B3%E5%8F%AF%E8%83%BD%E6%80%A7%E5%95%8F%E9%A1%8C)を解けるようになる。

[Choice](https://github.com/c-cube/choice)
## 3 限定継続命令の基礎理論

多相の let 文が入った leftto-right2 で値呼び (call by value; CBV) の λ-計算を限定継続命令で拡張した言語を扱う。

### 3.1 構文

```
(値) V ::= x | λx. M
(項) M ::= V | M M | let x = M in M| Sk. M | ⟨M⟩
(純評価文脈) F ::= [ ] | F M | V F | let x = F in M
(評価文脈) E ::= [ ] | E M | V E | let x = E in M | ⟨E⟩
```

shift (fun k -> M) は Sk. M と書き、reset (fun () -> M) は ⟨M⟩ と書く。通常の評価文脈はふたつにわか れている。純評価文脈というのは hole [ ] が reset で囲まれていないような評価文脈を示す。 

### 3.2 簡約規則

```
      (λx. M) V → M[x := V ]
 let x = V in M → M[x := V ]
 　　　     ⟨V ⟩ → V
      ⟨F[S V ]⟩ → ⟨V (λx.⟨F[x]⟩)⟩ x is fresh
```

### 3.3 実行規則と実行順序

### 3.5 Answer Type

Answer type というのは「現在のコンテキストの型」のこと。

[^1]: [Final Shift for Call/cc: Direct Implementation of Shift and Reset](https://www.deinprogramm.de/sperber/papers/shift-reset-direct.pdf)