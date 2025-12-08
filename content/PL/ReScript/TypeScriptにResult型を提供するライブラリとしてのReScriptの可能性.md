---
aliases: [型の変換について]
created: 2024-09-29T23:16:37+09:00
modified: 2025-04-29T20:18:37+09:00
---

[HM type inference](https://en.wikipedia.org/wiki/Hindley%E2%80%93Milner_type_system)が採用されており、型推論により基本的に。部分型がありません

ReScriptの優れている場面

ビジネスロジック

TypeScriptの優れている場面



# 型の変換について

ReScriptを使うときに問題になるのが既存のJS/TSで書かれたコードとの互換性や連携でしょう。型システムの健全性を諦める代わりに、anyなどを使って実質的に型を付けずに書くことが可能です。

型安全(Type Safety)

## ReScriptの型をTypeScriptの型へ

[gentype](https://rescript-lang.org/docs/manual/latest/typescript-integration)
## TypeScriptの型をReScriptへ

[ts2ocaml](https://github.com/ocsigen/ts2ocaml/blob/main/docs/rescript.md)

ドメインモデリング



https://dev.to/cometkim/when-and-where-to-use-rescript-the-rescript-happy-path-47ni