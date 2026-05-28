---
created: 2026-05-17
publish: false
tags:
  - planning
  - outreach
---

# 海外契約獲得 — HN投稿 + 直接アウトリーチ10社

## 戦略の核

「React/TSができるエンジニア」ではなく、「**Compiler / PL / 構造エディタ / CRDT / DSP** の領域で動けるエンジニア、TypeScriptも書ける」というポジショニングで攻める。

OSS資産:
- [Canopy](https://github.com/dowdiness/canopy) — MoonBit製の構造エディタ、CRDT(eg-walker論文実装)
- [moondsp](https://github.com/dowdiness/moondsp) — MoonBit製のDSPオーディオエンジン、wasm-gc
- [js_engine](https://github.com/dowdiness/js_engine) — MoonBit製のJSインタプリタ、test262
- [tapl-rescript](https://github.com/dowdiness/tapl-rescript) — TaPL演習をReScriptに移植
- [Lambda Calculus CRDT Editor](https://github.com/dowdiness/...) — ラムダ計算の協調構造エディタ
- [MoonBit エコシステムへの貢献](https://mooncakes.io/user/dowdiness)

時給目安: **$80–150**（ニッチ専門領域）。週10時間で¥120,000–225,000、生活費の主柱として十分。

---

## HN "Who wants to be hired?" 投稿草案（PL/Editor/CRDT版）

**投稿予定日**: 2026-06-01 17:00 JST（= 6/1 00:00 PST、スレが立つ瞬間）

```
Location: Kyoto, Japan
Remote: Yes (Asia / Europe / US time zones all OK)
Willing to relocate: No
Technologies:
  - Compilers, interpreters, type systems (mostly building in MoonBit lately)
  - Structure editors and CRDTs (eg-walker, P2P)
  - WebAssembly, audio DSP, live coding
  - Years of production TypeScript/React work, comfortable as full-stack
  - Other: ReScript, Haskell, Rust (learning)

I'm a frontend engineer transitioning toward language tooling and editors.
Recent OSS work, mostly in MoonBit:
  - Canopy — structure editor with CRDT-based concurrent editing,
    implementing the eg-walker paper. ~1,400 commits.
    https://github.com/dowdiness/canopy
  - moondsp — live-codable DSP engine targeting wasm-gc / AudioWorklet,
    inspired by Strudel/TidalCycles. ~400 commits.
    https://github.com/dowdiness/moondsp
  - js_engine — tree-walking JS interpreter (ES5 + selected ES6+),
    validated against test262.
    https://github.com/dowdiness/js_engine
  - tapl-rescript — TaPL exercises ported to ReScript.
    https://github.com/dowdiness/tapl-rescript

Open to part-time / contract work, 10–20 hrs/week. Especially interested in:
  - developer tools, language tooling, structure editors
  - CRDT / local-first / collaborative editing
  - WebAssembly runtimes, browser-based environments
  - audio / live coding / creative tools
Also happy to take on production React/Next.js work — several years of
professional TS experience.

Portfolio: https://antisatori.pages.dev
GitHub:    https://github.com/dowdiness
MoonBit:   https://mooncakes.io/user/dowdiness
Email:     koji.ishimoto@gmail.com
```

### 投稿当日のチェックリスト

- [ ] 6/1 16:55 JST までにブラウザでHNにログイン
- [ ] 6/1 17:00 JST 直後（スレが立った瞬間）に投稿
  - 早ければ早いほどimpression高い（最初の50コメントが伸びる）
- [ ] 投稿後30分以内に X / Bluesky で告知（"Posted on HN whoishiring, looking for contract work in PL/editor space"）
- [ ] 投稿後3日間はHNのスレを定期チェック、メール返信に即応

---

## 直接アウトリーチ10社 — 個別DM草案

各社向けに「**その会社の何が刺さるか**」を明示したカスタマイズDM。送信前に**直近の採用情報やブログ記事を1つチェック**して、冒頭の一行を更新すること。

### 優先順位（Tier 1: 高返信率・小規模/インディー寄り）

#### 1. Loro (loro.dev)
**理由**: Rust製の新しいCRDT、~5人チーム、CTO Sun Ming に直接届きやすい。Canopyのeg-walker実装は強烈なマッチ。

連絡先: Twitter @loro_dev / [GitHub Issues](https://github.com/loro-dev/loro) / hello@loro.dev (要確認)

```
Subject: Contract availability — engineer with eg-walker / CRDT experience

Hi Sun Ming and the Loro team,

I've been following Loro's work on text/movable-tree CRDTs and I think
what you're building is one of the most interesting projects in the
local-first space right now.

I'm a frontend engineer in Kyoto and I've been building a structure
editor called Canopy (https://github.com/dowdiness/canopy) — about 1,400
commits in MoonBit, implementing the eg-walker paper for truly concurrent
sequence editing. I've also written a JS interpreter (js_engine) and a
DSP engine (moondsp) in MoonBit.

I'm available for ~10 hrs/week contract work and Loro is honestly at the
top of the list of teams I'd most want to collaborate with. If there's
any contract or sponsored OSS work going around — testing real-world
scenarios, writing language bindings, contributing to the editor side —
I'd love to talk.

Portfolio: https://antisatori.pages.dev
GitHub:    https://github.com/dowdiness

Best,
Koji
```

#### 2. Ink & Switch
**理由**: 構造エディタ・ローカルファースト研究所。研究員ベースで採用するため、Canopyのコンセプトが強くマッチ。

連絡先: hello@inkandswitch.com / 研究員の個人Twitter

```
Subject: Contract / collaborative research — structure editor in MoonBit

Hi Ink & Switch team,

Your work on Patchwork, Automerge, and the general "local-first" agenda
has shaped how I think about software. I've spent the last year building
Canopy (https://github.com/dowdiness/canopy), a structure editor with
CRDT-based concurrent editing (eg-walker implementation), written in
MoonBit and targeting wasm-gc.

I'm a frontend engineer in Kyoto, available ~10 hrs/week for contract
work or research collaboration. If there are any open positions —
particularly anything touching structure editing, local-first sync, or
language-aware editor tooling — I'd love to be considered.

Portfolio: https://antisatori.pages.dev
Canopy demo: [URL if you have one, else GitHub README]

Best,
Koji Ishimoto
```

#### 3. Tonk
**理由**: ローカルファースト・指向のインディー開発、小規模で接触しやすい。

連絡先: Twitter / GitHub Issues / 会社のContact

```
Subject: Contract availability — structure editor + CRDT background

Hi Tonk team,

I've been following your work on local-first developer tools and I think
the direction is exactly where editors should be going. I'm a frontend
engineer in Kyoto building Canopy, a structure editor with CRDT-based
concurrent editing (https://github.com/dowdiness/canopy, ~1,400 commits
in MoonBit).

I'm available for ~10 hrs/week contract work. Given the overlap between
what you're building and where my OSS time goes, I'd love to chat if
there's anything I could help with — even small bounty-style work or
short-term contributions.

GitHub:    https://github.com/dowdiness
Portfolio: https://antisatori.pages.dev

Best,
Koji
```

#### 4. Effect TS (Effectful Technologies)
**理由**: 関数型TS、型システム重視。tapl-rescript・型理論ノートが強く刺さる。Michael Arnaldi 中心、小〜中規模。

連絡先: Twitter @MichaelArnaldi / Effect Discord

```
Subject: Contract availability — TS engineer with type-systems background

Hi Michael and the Effect team,

I've been reading Effect's source and example code as part of trying to
deepen my understanding of effect systems beyond the academic papers.
The way Effect threads structured concurrency, dependency injection, and
error tracking through the type system is the cleanest design I've seen
in TypeScript.

I'm a frontend engineer in Kyoto with several years of production TS/React
experience, plus deep interest in type theory (I'm porting TaPL exercises
to ReScript — https://github.com/dowdiness/tapl-rescript — and have been
writing a "TaPL prerequisite reader" as a Zenn Book).

I'm available for ~10 hrs/week contract work. If there's anything around
the Effect ecosystem — docs, examples, integration libraries, or core
work — I'd love to be considered.

Portfolio: https://antisatori.pages.dev
GitHub:    https://github.com/dowdiness

Best,
Koji Ishimoto
```

#### 5. Liveblocks
**理由**: CRDT/realtime collaboration SDK。Canopyの実装経験が直接的にマッチ。Steven Fabre が共同創業者。

連絡先: hello@liveblocks.io / Twitter @stevenfabre

```
Subject: Contract availability — engineer with CRDT / collaborative editor experience

Hi Liveblocks team,

I've been building Canopy (https://github.com/dowdiness/canopy), a
structure editor with CRDT-based concurrent editing, implementing the
eg-walker paper. About 1,400 commits in MoonBit. I've also written
a JS interpreter and DSP engine in the same language.

I'm a frontend engineer in Kyoto with years of production React/TS
experience, available for ~10 hrs/week contract work. Liveblocks
sits right in the overlap between my OSS direction and my day-job
skillset, so if there's anything contract-shaped — particularly on the
text/yjs side or developer experience — I'd love to chat.

Portfolio: https://antisatori.pages.dev
GitHub:    https://github.com/dowdiness

Best,
Koji
```

### Tier 2: 中規模・返信率は普通だがレートが高い

#### 6. Replit
**理由**: オンラインIDE、最近AI寄り。WebContainer・ランタイム周辺で接触可能。

連絡先: careers@replit.com / Twitter @replit / Amjad Masad (CEO) のDM

```
Subject: Contract / freelance — engineer with language tooling background

Hi Replit team,

I've been building tools at the intersection of language design and
collaborative editors:
  - Canopy: structure editor with eg-walker CRDT, in MoonBit
  - js_engine: a tree-walking JS interpreter (ES5+selected ES6+) in MoonBit,
    validated against test262
  - moondsp: live-codable DSP engine for browser AudioWorklet

I'm a frontend engineer in Kyoto, available ~10 hrs/week for contract work.
Replit's environment is one of the few places where my OSS work and
production TS/React experience overlap cleanly. If there's anything
contract-shaped — particularly on Workspace, AI tooling, or language
runtime adjacent work — I'd love to be considered.

Portfolio: https://antisatori.pages.dev
GitHub:    https://github.com/dowdiness

Best,
Koji
```

#### 7. StackBlitz (WebContainer)
**理由**: WebContainerは石本さんの js_engine・MoonBit→Wasm経験と隣接。Eric Simons (CEO)。

```
Subject: Contract availability — engineer with interpreter / Wasm background

Hi StackBlitz team,

WebContainer is one of the most impressive pieces of engineering in the
modern web platform. I've spent significant time building related things
in MoonBit:
  - js_engine — a tree-walking JS interpreter (ES5 + selected ES6+),
    validated against test262
  - Canopy — structure editor with CRDT-based concurrent editing
  - moondsp — Wasm-gc audio DSP for AudioWorklet

I'm a frontend engineer in Kyoto with years of production TS/React,
available ~10 hrs/week for contract work. If anything around the
WebContainer runtime, language tooling, or browser-based development
environments is open, I'd love to talk.

Portfolio: https://antisatori.pages.dev
GitHub:    https://github.com/dowdiness

Best,
Koji
```

#### 8. Wasmer
**理由**: Wasmランタイム企業、MoonBit→Wasmの経験が直接刺さる。Syrus Akbary (CEO)。

```
Subject: Contract availability — frontend / Wasm engineer (MoonBit, JS runtime)

Hi Wasmer team,

I've been building a JavaScript interpreter (js_engine,
https://github.com/dowdiness/js_engine) and a wasm-gc DSP engine (moondsp)
in MoonBit, both targeting Wasm runtimes. I've followed Wasmer for a
long time as the reference Wasm runtime story.

I'm a frontend engineer in Kyoto, available ~10 hrs/week for contract
work. If there's anything around developer tooling, runtime
benchmarking, or browser/Wasm integration, I'd love to be considered.

Portfolio: https://antisatori.pages.dev
GitHub:    https://github.com/dowdiness

Best,
Koji
```

### Tier 3: 採用が読みにくいが応募価値あり

#### 9. Linear
**理由**: 高ブランドのプロダクト企業、CRDT・型ヘビーな開発。返信率は低いが、入れれば最高。

```
Subject: Contract / freelance availability — engineer with editor / CRDT background

Hi Linear hiring team,

I've followed Linear's engineering blog for years — your work on
real-time sync, end-to-end TypeScript, and editor UX has shaped how I
think about product engineering. I've been building related tools in
MoonBit on the side:
  - Canopy — structure editor with CRDT-based concurrent editing
    (eg-walker implementation), ~1,400 commits
  - Lambda Calculus CRDT Editor — earlier exploration of structure +
    CRDT in TypeScript

I'm a frontend engineer in Kyoto with years of production React/TS work,
available ~10 hrs/week for contract or part-time work. If Linear has any
form of contract engagement open, I'd love to be considered.

Portfolio: https://antisatori.pages.dev
GitHub:    https://github.com/dowdiness

Best,
Koji Ishimoto
```

#### 10. Strudel ecosystem (Felix Roos / TidalCycles)
**理由**: moondspはStrudel/TidalCyclesから直接インスパイア。Felix Roosは小規模なコントリビュータベースで開発しており、コラボの可能性が高い。Patreonでファンディングを得ているため、有償案件もあり得る。

連絡先: Felix Roos の Twitter / Strudel Discord

```
Subject: moondsp — live-codable DSP in MoonBit, looking to collaborate

Hi Felix,

I've been building moondsp (https://github.com/dowdiness/moondsp),
a live-codable DSP engine in MoonBit targeting wasm-gc + AudioWorklet,
directly inspired by Strudel and TidalCycles. It's about 400 commits in
and currently has a working pattern engine with mini-notation, polyphonic
voice pool, graph compilation, and the usual DSP primitives.

I'm a frontend engineer in Kyoto, doing this on the side, but I'd love
to find ways to collaborate with the Strudel community or work on related
projects in a contract capacity (~10 hrs/week). If there's anything you'd
like done — bridging, optimization, browser quirks, or even just review
sessions — I'd be glad to help.

Portfolio: https://antisatori.pages.dev
GitHub:    https://github.com/dowdiness
moondsp:   https://github.com/dowdiness/moondsp

Best,
Koji
```

---

## アウトリーチ実行スケジュール

| 週 | アクション |
|---|---|
| Week 1 (5/17–5/23) | 上記10社の最新状況を確認、メールアドレス・DMチャネル特定。1日2社ペースで送信開始 |
| Week 2 (5/24–5/30) | 残り送信完了、HN投稿の最終調整 |
| Week 3 (5/31–6/6) | 6/1 HN投稿、返信対応・面談調整 |
| Week 4 (6/7–6/13) | 面談実施・契約交渉、未返信先へのフォローアップ（1社につき1回のみ） |

### 各社調査チェックリスト（送信前）

- [ ] 直近2週間のブログ記事・X発信を1つ読む（冒頭に言及できる材料を見つける）
- [ ] 採用ページがあれば確認（Contract OK明記の有無）
- [ ] 連絡先（hello@、CEOのDM、Discord等）を特定
- [ ] 自分のOSSの該当箇所のリンクが正しいか確認

### 期待値

| 段階 | 件数 | 確率 |
|---|---|---|
| 送信 | 10 | 100% |
| 返信あり | 3–5 | 30–50% |
| 面談 | 2–3 | 20–30% |
| 契約 | 1–2 | 10–20% |

HN投稿の反応と合わせて、6月中の初契約獲得が現実的なターゲット。

---

## トラッキング

| # | 会社 | 送信日 | 状態 | 時給 | 備考 |
|---|---|---|---|---|---|
| 1 | Loro | | | | |
| 2 | Ink & Switch | | | | |
| 3 | Tonk | | | | |
| 4 | Effect TS | | | | |
| 5 | Liveblocks | | | | |
| 6 | Replit | | | | |
| 7 | StackBlitz | | | | |
| 8 | Wasmer | | | | |
| 9 | Linear | | | | |
| 10 | Strudel (Felix Roos) | | | | |
| HN | 2026-06-01 | | | | |
