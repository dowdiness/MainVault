---
title: Moonbitで作る簡易正規表現v1
publish: true
tags: [moonbit, 正規表現]
aliases: [MoonBitで作る簡易正規表現, Moonbitで作る簡易正規表現v1]
created: 2025-06-09T18:28:51+09:00
modified: 2025-06-10T16:01:25+09:00
---

# Moonbitで作る簡易正規表現v1

下書きのバージョン

## MoonBit良いよね☺️

MoonBitは新しいプログラミング言語として、現在もコア機能の更新が頻繁に行われています。言語仕様が完全に固まった安定版のリリースまでには、まだ時間がかかるかもしれません。

しかし、現段階でも既にMoonBitは現代的な言語として、開発者の「痒いところに手が届く」使いやすく便利な言語です。言語側でテストやドキュメント、ベンチマークなどはサポートされていて、文法も素直で直感的なものになっています。WebAssemblyにコンパイルされる言語として宣伝されていますが（されていた？）、実際には出力先としてはJavaScriptとC言語、また実験的ですがLLVMが選べます。どこのプラットフォームでも動くポータブルなコードとして、アプリのコアロジックを書くのに適した言語ではないでしょうか？

## 正規表現について

新しい言語を覚えるとしたら取り敢えずそれで何か作ってみたいですよね？ということで、今回はMoonBitに慣れるためにも試しに正規表現エンジンをMoonbitで作ることにしましょう。[^1]

今回作る正規表現は言語に組み込みで付いてくるような本格的なものではなく機能を削った簡易的なものです。実装方法は再帰呼び出しを使用したバックトラッキング方式のオーソドックスなものになります。REからNFAに、NFAからDFAに変換するとか、VM使ってどうのこうのみたいな話は出てきません。[^2] (なんのコッチャ？と思ったそこのあなた！君こそが理想の想定読者です。そういう話が知りたくて来たのになーと思ったそこのあなた！あなたは既に私より詳しいのでさっさと帰ってください[^3])

また正規表現とは何か？という根本的な話はしません。知らない読者はWikipediaやMDNなどを参考にするかLLMにでも聞いてみてください。[^4]

## 記事の構成

まず最初に完成形のコードを示します。

```moonbit
fn regex_match(
  pattern : String,
  text : String,
  anchoredStart~ : Bool = false,
  anchoredEnd~ : Bool = false
) -> Bool {
  // 行の最初 (^) と 最後に ($) マッチする処理
  if pattern.length() > 0 && pattern.has_prefix("^") {
    regex_match(
      // 先頭の文字 (^) をスキップ
      pattern.substring(start=1),
      text,
      anchoredStart=true,
      anchoredEnd~,
    )
  } else if pattern.length() > 0 && pattern.has_suffix("$") {
    regex_match(
      // 最後の文字（$）をスキップ
      pattern.substring(start=0, end=pattern.length() - 1),
      text,
      anchoredStart~,
      anchoredEnd=true,
    )
  } else {
    // Define a helper that matches pattern at the beginning of 't',
    // requiring end of text if anchoredEnd
    fn inner_Match(p : String, t : String, end_anchor : Bool) -> Bool {
      match (p.view(), t.view()) {
        // If anchored end, text must be empty. Otherwise success.
        (p, t) if p.length() == 0 => not(end_anchor) || t.length() == 0
        // Handle ? quantifier: preceding char is optional (optional)
        ([p0, '?', ..], [t0, ..]) =>
          // Try skipping the char (0 occurrences)
          if inner_Match(p.substring(start=2), t, end_anchor) {
            true
          } else {
            // Try using it once
            match (t.length() > 0 && p0 == t0) || p0 == '.' {
              true =>
                inner_Match(
                  p.substring(start=2),
                  t.substring(start=1),
                  end_anchor,
                )
              false => false
            }
          }
        // Handle * quantifier (zero or more)
        ([p0, '*', ..], [t0, ..]) =>
          // Zero occurrences: if pattern is "a*bc", it becomes "bc" after skipping the first two characters
          if inner_Match(p.substring(start=2), t, end_anchor) {
            true
          } else {
            // One or more: check if we have at least one character that matches
            // For example: if pattern is "b*c" and text is "bbbc",
            // after one loop the text becomes "bbc" but the pattern stays the same
            match (t.length() > 0 && p0 == t0) || p0 == '.' {
              true => inner_Match(p, t.substring(start=1), end_anchor)
              false => false
            }
          }
        (_, t) if t.length() == 0 => false
        ([p0, ..], [t0, ..]) if p0 == t0 || p0 == '.' =>
          inner_Match(p.substring(start=1), t.substring(start=1), end_anchor)
        (_, _) => false
      }
    }
    // If anchored start, only try at position 0
    if anchoredStart {
      return inner_Match(pattern, text, anchoredEnd)
    }
    // Otherwise, try each starting position
    for i = 0; i <= text.length(); i = i + 1 {
      if inner_Match(pattern, text.substring(start=i), anchoredEnd) {
        return true
      }
    }
    return false
  }
}

test {
  assert_eq!(regex_match("hello", "hello"), true)
  assert_eq!(regex_match("hello", "hell"), false)
  assert_eq!(regex_match("h.llo", "hello"), true)
  assert_eq!(regex_match("h.llo", "hllo"), false)
  assert_eq!(regex_match("colou?r", "color"), true)
  assert_eq!(regex_match("colou?r", "colouur"), false)
  assert_eq!(regex_match("ab*c", "abbbc"), true)
  assert_eq!(regex_match("lo$", "hello"), true)
  assert_eq!(regex_match("^hi", "ahihi"), false)
  assert_eq!(regex_match("ab*c", "abc"), true)
}
```

初めにそのままの文字列にマッチングするリテラルマッチングから初めていき、少しずつ対応する特殊文字を増やしていきます。

今回対応する特殊文字は下記の５つです。

| 特殊文字 | 意味                   |
| ---- | -------------------- |
| .    | 任意の1文字               |
| ?    | 直前の文字は省略可能(0か1)      |
| *    | 直前の文字の0回以上の繰り返し(0..) |
| ^    | 行の先頭                 |
| $    | 行の最後                 |

エスケープなどもありません。（だって記事が長くなるから...）

MoonBitは公式のブラウザで動く [Playground](https://try.moonbitlang.com/) を用意しています。手元で開発環境を用意するのが億劫な場合にはこちらのサイトでサンプルコードを実行しながらお読みください。

## リテラルマッチングの対応

正規表現パターン(以下パターンと呼ぶ)と対象文字列(以下テキストと呼ぶ)を引数に取り、一致したら `true` を、しなかった場合は `false` を関数になります。

```moonbit
fn regex_match(pattern : String, text : String) -> Bool {
  match (pattern.view(), text.view()) {
    // パターンが空文字列だった場合, テキストが空文字列かどうかでBoolを返す
    (p, t) if p.length() == 0 => t.length() == 0
    // パターンが空文字列でなくテキストが空文字列だった場合、falseを返す
    (_, t) if t.length() == 0 => false
    // ２つの文字列(String)の先頭の文字(Char)が同じだった場合
    ([p0, ..], [t0, ..]) if p0 == t0 =>
      // 先頭の文字を削除して再帰呼び出し
      regex_match(pattern.substring(start=1), text.substring(start=1))
    // どのパターンにも一致しなかった場合、falseを返す
    (_, _) => false
  }
}

fn main {
  println(("hello", "hello"))
  println(regex_match("hello", "hello"))

  println(("hello", "hell"))
  println(regex_match("hello", "hell"))

  println(("hello", "hello!"))
  println(regex_match("hello", "hello!"))
}

test {
  // Literal match: exact equality
  assert_eq!(regex_match("hello", "hello"), true) // identical strings match
  assert_eq!(regex_match("hello", "hell"), false) // text shorter than pattern fails
  assert_eq!(regex_match("hello", "hello!"), false) // extra text fails
}
```

パターンマッチング

```
match パターンマッチングする対象 {
  pattern
}
```


[Array Pattern](https://docs.moonbitlang.com/en/latest/language/fundamentals.html#array-pattern) viewという他の言語でいうsliceに当たるものがあります。配列のような連続したデータへに対して可変長なポインターのようなものです。

`(pattern.view(), text.view())` により [tuple](https://docs.moonbitlang.com/en/latest/language/fundamentals.html#tuple) を作り、

整礎関係
文字列が

## ワイルドカード(.)への対応

##  0 か 1 回(?)への対応

## 0回以上の繰り返し(\*)への対応

## 境界アサーション(^, $)への対応

[^1]: 本当は [Theory of Computation](https://ocw.mit.edu/courses/18-404j-theory-of-computation-fall-2020/) の授業を見たからと、 [Russ Cox](https://swtch.com/~rsc/regexp/) の記事を読んで正規表現を自作してみたくなったからです。もちろん私は新しい言語を覚えるなら最初にやることはやっぱり [JSON パーサ](https://zenn.dev/mattn/articles/3b01651b7a42b3) か [ Lisp インタプリタ](https://github.com/kanaka/mal) だよね～などと言いだすような狂人ではありません。本当です。

[^2]: 何故なら解説出来るほど詳しくないので😢。詳しくは [Russ Cox](https://swtch.com/~rsc/regexp/) の記事を読んでください。

[^3]: というか正直難しくて分からないことが大量にあるので教えてほしい。誰か[正規表現](https://gihyo.jp/book/2015/978-4-7741-7270-5)や [オートマタの本](https://michaelblondin.com/automata/) を一緒に読んでくれませんか？

[^4]: どうやら正規表現とは何かを簡潔に説明するのは難しいらしく、検索すると奥歯に物が挟まったようなふにゃふにゃした正規表現の説明を沢山見つけることが出来ます。可愛いね。

[^5]: 先読みや後方参照をサポートしたものは正確には正規表現ではなく、[NLOG](https://cyberagent.ai/blog/research/19391/)と呼ばれているらしいです。
