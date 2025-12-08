---
aliases: [What is predicativity?]
created: 2024-06-21T01:47:57+09:00
modified: 2025-04-29T20:19:51+09:00
---

非叙述性 ([impredicativity](https://en.wikipedia.org/wiki/Impredicativity "en:Impredicativity"))

**自己言及**のパラドックスを起こしているもの

[ラッセルのパラドックス](https://ja.wikipedia.org/wiki/%E3%83%A9%E3%83%83%E3%82%BB%E3%83%AB%E3%81%AE%E3%83%91%E3%83%A9%E3%83%89%E3%83%83%E3%82%AF%E3%82%B9 "ラッセルのパラドックス"): 「自身を[元](https://ja.wikipedia.org/wiki/%E5%85%83_(%E6%95%B0%E5%AD%A6) "元 (数学)")として含まないあらゆる[集合](https://ja.wikipedia.org/wiki/%E9%9B%86%E5%90%88 "集合")の集合」は矛盾する。
[Curry's paradox](https://counterexamples.org/currys-paradox.html#currys-paradox): [素朴集合論](https://ja.wikipedia.org/wiki/%E7%B4%A0%E6%9C%B4%E9%9B%86%E5%90%88%E8%AB%96 "素朴集合論")や素朴[論理学](https://ja.wikipedia.org/wiki/%E8%AB%96%E7%90%86%E5%AD%A6 "論理学")で見られる[パラドックス](https://ja.wikipedia.org/wiki/%E3%83%91%E3%83%A9%E3%83%89%E3%83%83%E3%82%AF%E3%82%B9 "パラドックス")であり、自己言及文といくつかの一見問題ない論理的推論規則から任意の文が派生されることを示す

https://plato.stanford.edu/entries/curry-paradox/

https://drops.dagstuhl.de/storage/00lipics/lipics-vol175-types2019/LIPIcs.TYPES.2019.9/LIPIcs.TYPES.2019.9.pdf

**叙述的**　**predicative**

A type system is _predicative_ if definitions can never be referred to, even indirectly, before they are defined. In particular, polymorphic types ∀𝛼.…∀α.… are predicative only if 𝛼α ranges over types not including the polymorphic type being defined. Predicative systems usually have restricted polymorphism (in ∀𝛼.…∀α.…, 𝛼α may range only over types that do not themselves use ∀∀, or there may be a system of stratified levels of ∀∀-usage). One hallmark of impredicative systems is unrestricted ∀∀ (present in e.g. System F)

# [What is predicativity?](https://proofassistants.stackexchange.com/questions/326/what-is-predicativity)

[Proof Assistants Beta](https://proofassistants.stackexchange.com/)の叙述性に関するスレッドで参考になる