---
created: 2026-07-04
publish: false
tags:
  - planning
  - outreach
---

# アウトリーチ送信可能版（2026-07-04 更新）— Tier 1 五社

[[overseas-outreach]] の 2026-05-17 草案をベースに、各社の**2026年6月〜7月時点の直近動向**を調査して冒頭を更新し、プレースホルダーを解消した送信可能版。

**使い方**: 読んで、自分の言葉に直したい箇所だけ直して、送る。1日1通で十分。送信したら下部のトラッキング表に日付を記入。

**共通の変更点**（5/17草案からの差分）:
- 冒頭の一行を各社の直近の動き（リリース・記事）への言及に更新 — 「テンプレ送信ではない」ことが最初の2秒で伝わるように
- 「I've spent the last year building」→ Canopy開発開始は2025年12月なので「since late 2025」に修正（誇張は面談で必ずバレる）
- Canopy demo URLのプレースホルダー → GitHub READMEリンクに確定
- 6月のCanopy開発日誌（antisatori.pages.dev）への言及を追加できる箇所に追加

---

## 1. Loro (loro.dev)

**直近動向（2026-06時点）**: v1.13.6 を6月21日にリリース。6月14日にPythonバインディング公開。Rust / JS(WASM) / Swift 対応を拡大中。エコシステム（言語バインディング）拡大期 = 外部コントリビュータの手が欲しい時期。
出典: [npm loro-crdt](https://npmx.dev/package/loro-crdt), [PyPI loro](https://pypi.org/project/loro/), [loro-dev/loro releases](https://github.com/loro-dev/loro/releases)

**連絡先**: X @loro_dev / GitHub Discussions。メールは loro.dev フッターで最終確認（5月草案の hello@loro.dev は未確認のまま）

```
Subject: Contract availability — engineer with eg-walker / CRDT experience

Hi Sun Ming and the Loro team,

Congrats on the recent 1.13 releases and the new Python bindings — it's
great to see Loro expanding beyond Rust/JS while keeping the core moving.

I'm an engineer in Kyoto building Canopy
(https://github.com/dowdiness/canopy), a structure editor with CRDT-based
concurrent editing implementing the eg-walker paper — 1,400+ commits in
MoonBit since late 2025, targeting wasm-gc. I write monthly dev logs —
June's is in English at
https://antisatori.pages.dev/Blog/Canopy-Devlog-June-2026 if you want to
see how the work actually goes.

I'm available for ~10 hrs/week contract work, and Loro is at the top of
the list of teams I'd most want to work with. Language bindings, editor
integrations, real-world stress-testing — if there's any contract or
sponsored-OSS-shaped work, I'd love to talk.

GitHub:    https://github.com/dowdiness
Portfolio: https://antisatori.pages.dev

Best,
Koji Ishimoto
```

---

## 2. Ink & Switch

**直近動向（2026年前半）**: Patchwork（ローカルファーストの共同編集・バージョン管理環境）のlab notesを研究員個人の声で継続公開中。ラボ全体がPatchworkの中で日常的に暮らす段階。新プロジェクト Jacquard（実証研究のためのバージョン管理と来歴）も公開。
出典: [Patchwork](https://www.inkandswitch.com/project/patchwork/), [Dispatch 017](https://www.inkandswitch.com/newsletter/dispatch-017/), [Jacquard notebook](https://www.inkandswitch.com/jacquard/notebook/)

**連絡先**: hello@inkandswitch.com

```
Subject: Contract / research collaboration — structure editor + CRDT in MoonBit

Hi Ink & Switch team,

I've been enjoying the Patchwork lab notes this year — the shift to
notes in each researcher's personal voice makes the process visible in
a way most labs never manage, and it's the same spirit I try to keep in
my own monthly dev logs.

Your work on Automerge, Patchwork, and local-first software has shaped
how I think about editors. Since late 2025 I've been building Canopy
(https://github.com/dowdiness/canopy), a structure editor with
CRDT-based concurrent editing (an eg-walker implementation), written in
MoonBit targeting wasm-gc — 1,400+ commits, with monthly dev logs
(June's in English: https://antisatori.pages.dev/Blog/Canopy-Devlog-June-2026).

I'm based in Kyoto and available ~10 hrs/week for contract work or
research collaboration. If anything is open around structure editing,
local-first sync, or language-aware editor tooling, I'd love to be
considered.

GitHub:    https://github.com/dowdiness
Portfolio: https://antisatori.pages.dev

Best,
Koji Ishimoto
```

---

## 3. Tonk (tonk-labs)

**⚠️ 方向性が5月草案から変化**: 現在は「a portable data substrate for humans and their tools to think together」— 中核は **Dialog DB**（ローカルファーストの組み込みDB、(entity, attribute, value) のセマンティックトリプル、追記専用・内容アドレス方式で衝突なし同期）。malleable software と「AI時代のinfinite software」を掲げる。CLIツール Carry（ローカルLLMワークフローの永続メモリ層）も開発。旧草案の「local-first developer tools」framingは古いので全面書き換え済み。
出典: [tonk-labs/tonk](https://github.com/tonk-labs/tonk), [Tonk Docs](https://tonk-labs.github.io/tonk/)

**連絡先**: GitHub / X。小規模チームなのでGitHub Discussionsか創業者DMが現実的

```
Subject: Contract availability — CRDT / structure editor background, drawn to Dialog

Hi Tonk team,

Dialog's design — everything as append-only, content-addressed claims —
is one of the more genuinely novel takes on local-first sync I've seen
this year, and the "data substrate for humans and their tools" framing
matches where I think software is heading.

I'm an engineer in Kyoto working in an adjacent space: Canopy
(https://github.com/dowdiness/canopy) is a structure editor that treats
code as structured, collaboratively-editable data rather than text —
CRDT-based (eg-walker implementation), 1,400+ commits in MoonBit since
late 2025.

I'm available ~10 hrs/week for contract work. Given how much your
substrate and my editor work overlap conceptually, I'd love to help
with anything — sync layers, editor/tooling integrations, or
bounty-style contributions to Dialog or Carry.

GitHub:    https://github.com/dowdiness
Portfolio: https://antisatori.pages.dev

Best,
Koji Ishimoto
```

---

## 4. Effect TS (Effectful Technologies)

**直近動向（2026-04〜）**: **Effect v4 beta** リリース — fiber runtimeの完全書き直し（メモリ削減・バンドル縮小）、パッケージ体系の統一、17のunstableモジュール（AI, HTTP, Schema, SQL, RPC, CLI, workflows, clustering）。2026年は「core改善・エコシステム拡大・production支援」の年と宣言。ドキュメント・例・移行ガイドの需要が高まっている時期。
出典: [InfoQ: Effect v4 Beta](https://www.infoq.com/news/2026/04/effect-v4-beta/), [@EffectTS_ 2026 roadmap](https://x.com/EffectTS_/status/2006692247585305020)

**連絡先**: Effect Discord / X @MichaelArnaldi

```
Subject: Contract availability — TS engineer with type-systems background

Hi Michael and the Effect team,

Congrats on the v4 beta — I've been reading through the rewritten
runtime, and the move to a unified package system with unstable modules
looks like exactly the right call for where the ecosystem is now.

I originally started reading Effect's source to understand effect
systems beyond the academic papers, and it's still the cleanest design
I've seen in TypeScript. My background sits in that overlap: several
years of production TS/React, plus type theory as a serious hobby — I'm
porting TaPL's exercises to ReScript
(https://github.com/dowdiness/tapl-rescript) and writing a "TaPL
prerequisites" book for Japanese readers on Zenn.

I'm available ~10 hrs/week for contract work. With v4 migration ahead,
if there's anything around docs, examples, migration guides, or
ecosystem libraries, I'd love to be considered.

GitHub:    https://github.com/dowdiness
Portfolio: https://antisatori.pages.dev

Best,
Koji Ishimoto
```

---

## 5. Liveblocks

**直近動向（2026-01〜）**: Liveblocks 3.0で **AI Copilots**（製品内でユーザーがAIと協働する既製機能）を主力化。1月にはナレッジベース強制参照設定、コメントへのカスタムメタデータ（Slack双方向同期などの用途）を追加。「multiplayer apps **and agents** のためのrealtime infrastructure」へポジションを拡大中。
出典: [What's new January 2026](https://liveblocks.io/blog/whats-new-in-liveblocks-january-edition-2026), [AI Copilots](https://liveblocks.io/ai-copilots)

**連絡先**: hello@liveblocks.io / X @stevenfabre

```
Subject: Contract availability — engineer with CRDT / collaborative editor experience

Hi Liveblocks team,

The expansion into AI Copilots is a smart move — "humans and agents
collaborating in the same room" is exactly the problem shape that makes
realtime infrastructure interesting again.

I'm an engineer in Kyoto building in the same space from the editor
side: Canopy (https://github.com/dowdiness/canopy) is a structure
editor with CRDT-based concurrent editing, implementing the eg-walker
paper — 1,400+ commits in MoonBit since late 2025. Before that I spent
several years doing production React/TypeScript work.

I'm available ~10 hrs/week for contract work. Liveblocks sits right in
the overlap between my OSS direction and my day-job skillset — if
there's anything contract-shaped on the text-editor / Yjs side, DX, or
integrations, I'd love to chat.

GitHub:    https://github.com/dowdiness
Portfolio: https://antisatori.pages.dev

Best,
Koji Ishimoto
```

---

## 送信前の最終チェック（1通あたり5分以内）

- [ ] 会社のサイト/Xで「今週の動き」がないか一目確認（あれば冒頭一行だけ差し替え）
- [ ] メールアドレス/DMチャネルの最終確認（Loroのメールは未確認）
- [ ] リンク4つ（GitHub, Portfolio, Canopy, 会社固有）をクリックして生存確認

## トラッキング

| # | 会社 | 送信日 | チャネル | 状態 | 備考 |
|---|---|---|---|---|---|
| 1 | Loro | | | | メールアドレス要確認 |
| 2 | Ink & Switch | | hello@inkandswitch.com | | |
| 3 | Tonk | | | | Dialog DBに方向転換済み・草案書き換え済み |
| 4 | Effect TS | | Discord / X | | v4移行期＝docs/例の需要期 |
| 5 | Liveblocks | | hello@liveblocks.io | | |
