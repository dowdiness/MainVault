---
title: Zipper
publish: false
tags: [haskell, Structure]
created: 2025-06-09T22:36:48+09:00
modified: 2025-06-09T22:50:44+09:00
---

# Zipper

**Zipper（ジッパー）**は、木構造やリストなどの**データ構造を部分的に効率よく操作するためのテクニック（アルゴリズム）**です。

> **データ構造の「ある位置」に注目して、その場を簡単に編集・移動できるようにする方法。**

通常のツリー構造では難しい、親ノードや兄弟ノードへのアクセスを簡単にするデータ構造です。「注目している場所」＋「それ以外の情報（上下・左右の文脈）」をタプルで持って効率的に操作できるようにする。

[Haskell Wiki](https://wiki.haskell.org/index.php?title=Zipper)

[すごいHaskell たのしく学ぼう！ | zipper](https://learnyouahaskell.com/zippers)
