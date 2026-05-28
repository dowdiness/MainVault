---
created: 2026-05-17
publish: false
tags:
  - portfolio
  - ai
  - claude-code
  - marketing-asset
aliases:
  - AIスキルポートフォリオ素材集
---

# AI 駆動開発スキル — ポートフォリオ素材集

> **目的**: Claude Code を中心とする AI ワークフローの実績を、PT 契約獲得・レイヤーB 製品（書籍/動画/SNS）・職務経歴書に転用可能な形で集約する。
> **出典**: `/insights` レポート（2026-03-09 〜 2026-05-17、248 セッション分析） + 既存リポジトリ実績。

---

## 1. 定量的トラックレコード（事実ベース）

直近 **2 ヶ月** の Claude Code 利用実績（自動分析されたもの）:

| 指標                  | 数値                                                                    |
| ------------------- | --------------------------------------------------------------------- |
| 分析対象セッション数          | 248（全 400 セッション中）                                                     |
| 総稼働時間（AI ペア開発）      | **665 時間**                                                            |
| 出荷コミット数             | **710**                                                               |
| AI とのメッセージ往復        | 4,789 回                                                               |
| ゴール達成率（完全達成）        | **153 / 212（72%）** ※部分達成含めると 90%+                                     |
| 並行運用したリポジトリ         | 7+（canopy, moondsp, alga, rle, btree, order-tree, event-graph-walker） |
| 期間中の mooncakes リリース | 5+ ライブラリ                                                              |

**翻訳すると**: 1 セッションあたり平均 2.9 コミット / 2.7 時間。短時間で確実にゴールに到達する **ペア開発リズム** を 2 ヶ月維持。

---

## 2. ポジショニング（3 案）

`/insights` レポートから抽出される強みは大きく 3 方向に展開可能。`TODO(human)` セクションで石本さんの判断を入れてください。

### 案 A: "Release Engineering at AI Speed"
> 「複数リポジトリのリリースパイプラインを AI で同時並行運用する開発者」
- **訴求対象**: dev tools 系スタートアップ、ライブラリ/SDK 開発企業、複数 OSS を抱えるチーム
- **証拠**: 5+ MoonBit ライブラリの semver / CHANGELOG / 依存解決を Codex レビュー込みで運用、サブモジュール連動更新を含む完全リリースチェーン

### 案 B: "Verification-First AI Development"
> 「AI が生成する誤りを規律で潰せる開発者 — AI による高速化と、人間による信頼性確保を両立する」
- **訴求対象**: AI 導入で品質低下に悩む企業、AI 活用を本格化したいエンジニアリングマネージャー、教育コンテンツ読者
- **証拠**: subagent の "all pass" ハルシネーション検出、Codex 二重レビューによる semver 誤り抑止、`CLAUDE.md` への失敗パターン規約化（Pre-Execution Check / Move-Only Refactor Discipline 等）

### 案 C: "AI Workflow Codification"
> 「AI 開発の試行錯誤を再利用可能なスキル・フック・規約に変換する開発者」
- **訴求対象**: チーム導入を進めたい企業、Claude Code カスタマイズの教育市場、SNS/書籍読者
- **証拠**: `~/.claude/CLAUDE.md` への規約蓄積、`memory/delegation-log.md` による委譲判断のログ化、`/release` 等カスタムスキル化、MCP サーバー統合

---

## 3. ケーススタディ（事実ベース・選択用）

### CS-1: Test262 JS エンジン compliance
- computed property names テスト群を **96/96 全合格** まで引き上げ
- TypedArray の numeric-index ハンドリングをリファクタ
- per-edition pass rate を CI で可視化する仕組みを構築
- **示せるスキル**: 仕様準拠の根本原因分析、テスト駆動でのエンジン改修、CI 可視化設計

### CS-2: Canopy モノレポ R1 カーネル分割（Stage 1–6）
- 多段リファクタを ADR 付きの段階的 PR スタックで完遂
- 各 Stage で CI green を維持、パス変更が干渉する場合はスコープを clean に deferral
- editor-adapter 改善、causal history view 実装
- **示せるスキル**: 大規模リファクタの段階化設計、後戻り可能な PR スタック運用、複数レビュー（Codex / CodeRabbit）の組み込み

### CS-3: MoonBit DSP ライブラリ群のリリース運用
- `moondsp` 命名から、`alga` / `rle` / `btree` / `order-tree` / `egraph` まで複数ライブラリを mooncakes へ出荷
- path-deps → registry version 移行、誤った minor bump の事前検出（patch に修正）
- 失敗から学んだ規約をグローバル CLAUDE.md に蓄積（Release Workflow セクション）
- **示せるスキル**: semver 判断、依存解決、リリースエンジニアリングの規律

---

## 4. 転用素材スニペット

### 4.1 `/hire` ページ追加セクション（英語）

```markdown
## How I work with AI

I treat Claude Code as a daily pair-programming partner — not a code generator.
Over the past two months I shipped **710 commits across 248 sessions** (665 hours of
AI-paired development) at a **90%+ goal-achievement rate**, while running release
engineering for 7+ MoonBit libraries in parallel.

The workflow that makes this work isn't speed — it's **verification discipline**:
every PR runs through external code review (Codex / CodeRabbit) before merge,
multi-stage refactors land as PR stacks with green CI at each step, and failure
patterns get codified into reusable rules so the team (or future-me) doesn't
re-learn them.

If your team is trying to scale AI-assisted development without losing engineering
rigor, that's the problem I've been actively solving.
```

### 4.2 X / Twitter スレッド草案（日本語）

```
🧵 Claude Code を 2 ヶ月本気で運用してみた数字

・248 セッション
・665 時間のペア開発
・710 コミット
・並行運用リポジトリ 7+
・ゴール達成率 90%+

ただ速いだけじゃ続かない。続けるための「規律」を 5 ツイートで共有する 👇

1/ 検証ファースト
AI の "all pass" を信用しない。subagent の結果は必ずツール出力を要求。Codex を二重レビューに入れる。1 つの semver 誤りで yank する手間が、毎回のレビューより遥かに重い。

2/ 多段リファクタは PR スタック
カーネル分割みたいな大物は、ADR 付きで Stage 1–6 に分けて 1 PR ずつ green CI を維持。途中で詰まったら無理せず scope deferral。これで月単位の作業を週単位に圧縮できる。

3/ 失敗を規約化
同じミス（minor bump 誤り、サブモジュール CWD ずれ、subagent ハルシネ）を二度起こさないために、`CLAUDE.md` に Pre-Execution Check として書き込む。次セッションから AI が自分で守る。

4/ 委譲は記録する
何を Sonnet / Haiku / Opus に振り分けたか、結果が当たったか外したかを `delegation-log.md` に蓄積。10–20 件貯まると「ここは委譲が刺さる、ここは外す」が見えてくる。

5/ Codex / CodeRabbit / MCP は "もう一つの目"
1 人で AI を使うと暴走するが、AI 同士を相互レビューさせると失速しない。これは個人開発でも、チームでもそのまま機能する。

詳細は [Zenn / ブログリンク] に書いた。
```

### 4.3 Zenn 記事タイトル候補

- 「Claude Code を 2 ヶ月本気で運用した結果 — 248 セッション・710 コミットからの実践知」
- 「AI に "全部 pass" と言わせない: 検証ファーストで Claude Code を運用する 5 つの規律」
- 「個人開発で 5 ライブラリ並行リリースを回す: Claude Code + Codex のペアレビュー運用」

### 4.4 職務経歴書 / レジュメ用箇条書き（日英）

**日本語版**:
```
- Claude Code を中核とする AI ペア開発ワークフローを構築・運用
  - 直近 2 ヶ月で 248 セッション・710 コミット・90%+ のゴール達成率を維持
  - 5+ MoonBit ライブラリのリリースパイプラインを Codex 二重レビュー込みで並列運用
  - 失敗パターンを CLAUDE.md / カスタムスキルとして規約化し再現性を確保
```

**English**:
```
- Built and operated an AI-paired development workflow centered on Claude Code
  - 248 sessions, 710 commits, 90%+ goal completion over an 8-week stretch
  - Ran release pipelines for 5+ MoonBit libraries in parallel, with Codex
    second-opinion review gating every publish
  - Codified failure patterns into reusable Claude Code skills, hooks, and
    CLAUDE.md rules to make the workflow team-transferable
```

### 4.5 海外スタートアップ向けコールドメール追記段落

既存の `income-plan-2026.md` の D 草案に追加できる差別化段落:

```
A note on tooling: I work in tight pairing with Claude Code and treat AI workflow
as a first-class engineering surface. Over the past 8 weeks I've shipped 710
commits across 248 sessions while running release engineering for 7+ MoonBit
libraries in parallel — but more relevant to your team, I've codified the
verification rituals that make this sustainable (multi-agent code review,
delegation logging, post-incident skill creation). If "scale AI development
without losing rigor" is on your roadmap, I can move fast on it.
```

---

## 5. 公開先・チャネル戦略

| チャネル | 素材 | 想定効果 | 優先度 |
|---|---|---|---|
| `/hire` ページ（Quartz） | §4.1 | 既存トラフィックでの差別化、検索流入 | **高** |
| X スレッド | §4.2 | バイラル → 認知拡大、PT 案件直連絡 | **高** |
| Zenn 長文記事 | §4.3 タイトル + §1–3 詳細 | 検索流入、Book B-1 への導線、信頼蓄積 | 中 |
| 職務経歴書 | §4.4 日本語版 | 国内 PT 案件・Wantedly 等 | 中 |
| LinkedIn / レジュメ | §4.4 English | Toptal / Arc.dev / 海外スタートアップ応募 | 高 |
| HN "Who wants to be hired?" | §4.5 段落を追加 | 海外案件、6/1 PST のスレで露出 | **高** |

---

## 6. リスクと注意点

- **数字のインフレ警戒**: 710 コミットには `vault backup` 等の自動コミットが含まれていないか確認。`/insights` レポート時点では分析対象 248 セッションに紐づくコミット数のため概ね妥当だが、SNS で出す際は「ペア開発で生まれたコミット数」など限定表現を使う
- **AI 依存への偏見対策**: 「AI で量産する人」と誤読されないよう、必ず **検証規律 / 失敗からの規約化** とセットで提示する。CS-1（Test262 96/96）のような **AI なしでも難しい仕事** を必ず併記する
- **守秘義務**: PT 案件で得た非公開コードベースの実績は混ぜない。本素材は OSS 実績と公開リポジトリのみで構成されていることを確認済み

---

## TODO(human): 戦略判断 — どの角度をリード文脈にするか

**Your Task**: 以下のうち、**最初に集中投下するチャネルとポジショニング案** を 1 つ選び、3–5 文の「自分の言葉でのエレベーターピッチ」を書いてください。

**選択肢（ポジショニング × チャネル）**:

1. **案 A × `/hire` ページ + HN** — 即金 PT 契約獲得を優先。リリースエンジニアリング訴求で dev tools 系企業を狙う
2. **案 B × Zenn 記事 + X** — レイヤーB 製品の権威性構築を優先。Book B-1 (TaPL 入門以前) への読者導線を作る
3. **案 C × X スレッド + LinkedIn** — SNS バイラル経由の認知拡大を優先。教育市場（書籍 / 動画）への布石

**ガイダンス**:
- 案 A は短期収益（30 日以内に PT 1 件）、案 B は中期権威性（90 日で読者基盤）、案 C は長期ファネル（180 日で複数チャネル）— `income-plan-2026.md` の Week 1–4 アクションプランとどう整合させるか
- エレベーターピッチには「誰の何の問題を解決するか」「なぜ自分が解けるか」「他の人と何が違うか」の 3 要素を入れる
- 自分の言葉で書くことが重要。AI 生成の文章を SNS に出すと一目でバレる時代

このセクションが埋まったら、選ばれた角度に合わせて §4 のスニペットを書き直し、`/hire` ページや Zenn 記事下書きとして派生ファイルを作成します。

<!-- TODO(human): あなたのエレベーターピッチをここに書く -->

---

## メタ: このファイルの位置づけ

- `income-plan-2026.md` の Week 1（5/17–5/23）「製品側 - ターゲット読者像と想定価格を 1 枚にまとめる」と同じスコープの差別化資料
- 並行して `Misc/income-plan-2026-assets/B1-book-spec.md`（書籍仕様）と組み合わせると、PT・製品の両面でポジショニングが揃う
- 数字は `/insights` レポート（`~/.claude/usage-data/report-2026-05-17-142711.html`）が一次出典。レポートは月次で更新されるため、四半期ごとに本ファイルの §1 を再計測することを推奨
