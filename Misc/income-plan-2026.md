---
created: 2026-05-17
publish: false
tags:
  - planning
  - income
aliases:
  - 個人開発者収益計画
---

# 月20万円達成プラン（2026-05開始）

## ゴール
- **2026-08-17 までに月次収益 ¥200,000 を達成・継続**
- **路線: B（並走）** — PT契約で生活費の50–60%を確保しつつ、残り時間をレイヤーB（製品/教育）に投下
- 12ヶ月目に「レイヤーB単体で月10万到達」を中間KPIとして設定

## 時間配分（並走路線の設計）

**前提**: 稼働可能時間 20–30h/週

| 用途 | 週当たり時間 | 月当たり時間 | 月次目標収益 |
|---|---|---|---|
| **PT契約**（即金・生活費保険） | 6–10h | 24–40h | ¥150,000–240,000（時給$60–80） |
| **レイヤーB**（製品/教育・積み上げ） | 12–18h | 48–72h | ¥0→¥50,000→¥150,000（段階的） |
| 学習・OSS発信 | 2–4h | 8–16h | （ファネル投資、直接収益なし） |
| **合計稼働** | 20–30h | 80–120h | **¥200,000以上** |

★ この配分の意図 ─────────────────────────────────────
- ¥200,000はPT単体で達成可能だが、それでは「時間売りの罠」に閉じ込められる
- PTを「最小限の安全網」に抑え、**製品時間を最大化する**のが並走路線の本質
- 製品が10万到達したらPT時間を削る → 製品20万到達でPT離脱、というレールに乗せる
- 注意: 「PT案件が楽しくて時間増やす」は最大の落とし穴。契約時に **週10時間上限を明記**
─────────────────────────────────────────────────

## KPI トラッキング

B-1単体ではZenn Book ¥500本で月¥4,000–13,000程度が現実線（前年Zenn相場調査より）。PT側で大部分を支え、製品はファネル拡大期と位置づける。

| 月 | PT収益目標 | 製品収益目標 | 合計目標 | 実績 | 主要トピック |
|---|---|---|---|---|---|
| 2026-05 | 0 | 0 | 0 | | 応募・基盤整備、第1部執筆 |
| 2026-06 | 80,000 | 0 | 80,000 | | PT 1案件目開始、無料章公開 + 検証 |
| 2026-07 | 140,000 | 13,000 | 153,000 | | 有料章公開（B-1完成・初月） |
| 2026-08 | 160,000 | 9,000 | 169,000 | | B-1減衰、第2弾Book企画開始 |
| 2026-09 | 180,000 | 12,000 | 192,000 | | 第2弾Book執筆 / PT2案件目開始 |
| 2026-10 | 180,000 | 20,000 | 200,000 | | **目標達成**（第2弾Book発売 or 多チャンネル化） |
| 2027-04 | 140,000 | 60,000 | 200,000 | | **中間KPI: 製品6万到達**（Book3冊・英訳・動画コース等） |

★ KPI再設計の重要点 ─────────────────────────────────────
- 当初想定（製品単体で月¥80,000）は ¥3,000本前提だった。¥500フリーミアムに変更すると製品サイドの伸びが鈍化するため、**PT側で月¥160,000–180,000を恒常的に確保する** 構造に修正
- これは並走路線の「PT 6–10h/週」想定よりPT時間が必要（実際は週12–15h相当）
- 「製品が成長したらPTを削る」というスケジュールは **18–24ヶ月** 単位の長期戦になる
- 短期にPT時間を減らしたい場合は、B-2（動画コース）またはB-3（OSSスポンサー）の高単価チャンネルを早期に組み込む必要あり
─────────────────────────────────────────────────

## 即金（PT）チャネル — 並走路線版

並走では「週8–12h案件」が要件。長時間コミット案件は最初から避ける。

1. **海外スタートアップ直接コンタクト**（HN, X, YC Work at a Startup）
   - 時給目安: $60–120
   - **必ず "10 hrs/week" 明記で募集**
   - 着手: 今週から
2. **Toptal**
   - 週10h契約は希少だが交渉可能。時給高い
   - スクリーニング2–4週間、並行で進める
3. **Arc.dev / Lemon.io**
   - 短時間案件多い、登録ハードル低い
4. **既存ネットワーク**
   - 過去の同僚・京都/関西スタートアップに「週10時間スポットで手伝える」と告知
   - 並走路線では **これが一番確度高い**（信頼ベース、ハードルなし）
5. **Upwork**
   - 評価ビルド用、低単価案件、必要に応じて

## レイヤーB（製品/教育）— 1ヶ月で最初の検証

並走路線の核心は「最初の有料ユーザー or 売上を6–8週間以内に得ること」。検証なしで6ヶ月開発する罠を避ける。

### 候補プロダクト軸（dowdinessさんの強みベース）

| 軸 | 形態 | 想定価格 | 検証コスト | 到達速度 |
|---|---|---|---|---|
| **B-1. TaPL入門以前（フリーミアム書籍）** | Zenn Book | ¥500（無料章 + 有料章） | 低（既存資産活用） | 速（4–8週） |
| **B-2. MoonBit / ReScript系チュートリアル動画** | Udemy or 自前販売 | ¥3,000–10,000 | 中 | 中（8–12週） |
| **B-3. CRDT/構造エディタ用のライブラリ + Pro機能** | OSS + Sponsorware | ¥1,000–5,000/月 | 高 | 遅（6–12ヶ月） |
| **B-4. Quartzの拡張テンプレート販売** | Gumroad one-time | ¥1,500–3,000 | 低（自分が使っている） | 速（4–8週） |
| **B-5. ニッチB2B開発者ツール** | SaaS | $20–100/月 | 高 | 遅（12ヶ月+） |

**確定: B-1**（フリーミアム書籍）。詳細は `income-plan-2026-assets/B1-book-spec.md` 参照。

### 6週スプリント（B-1: フリーミアム版）

- **Week 1–2**: 第1部（第1〜3章 + はじめに）を執筆 = 無料章
- **Week 3**: Zenn Book に無料章公開 + 告知（X / Zenn記事 / コミュニティ）
- **Week 4**: **検証ゲート**: いいね30+ / X言及5+ / コメント2+ をすべて満たせば続行
- **Week 5–10**: 有料章（第4章以降、¥500）を順次公開

**売上見通し（B-1単体）**:

| 月 | B-1売上 |
|---|---|
| 完成直後 | ¥12,750（30冊） |
| 翌月以降 | ¥4,000–9,000（月10–20冊） |
| 12ヶ月累計 | ¥60,000–80,000 |

**重要**: B-1単体では製品サイドKPI（月¥30,000）に届かない。B-1の延長線で2〜4冊（PFPL入門、HM型推論を作る、TaPL章別ガイド単独版）出すか、多チャンネル展開（Gumroad英訳、動画コース）が必要。これは Week 5 以降の判断ポイント。

## 30日アクションプラン（並走路線）

PT準備と製品検証を **並列に走らせる**。

### Week 1（5/17–5/23）：両側の基盤整備

PT側:
- [ ] GitHub プロフィール README を「Available for ~10h/week contract」に更新（草案↓）
- [ ] X/Twitter bio 更新（"10h/week contract OK"明記）
- [ ] LinkedIn プロフィール最新化、"Open to work - Contract" 有効化
- [ ] 既存ネットワーク（過去同僚・関西スタートアップ）に **声かけ3–5件**

製品側:
- [ ] B-1（TaPL有料解説書）/ B-4（Quartz拡張販売）を最終決定 → このファイル末尾に記載
- [ ] 決めた案について、**ターゲット読者像と想定価格**を1枚にまとめる（後述の検証シート）

### Week 2（5/24–5/30）：PT露出量 + 製品Week 1着手

PT側:
- [ ] HN "Who wants to be hired? (June 2026)" 投稿（6/1 0:00 PST 開始の最初のスレ） — 草案↓
- [ ] Toptal / Arc.dev 登録
- [ ] YC Work at a Startup でPT/Contract案件に5件応募（量より質、週10h案件のみ）

製品側:
- [ ] 製品検証スプリント Week 1: サンプル章 or プロトタイプ着手

### Week 3（5/31–6/6）：PT面談 + 製品Week 2

PT側:
- [ ] 面談実施
- [ ] 契約交渉（**週10時間上限**を必ず明記）
- [ ] Wise / Payoneer アカウント開設

製品側:
- [ ] 製品検証 Week 2: サンプル完成、告知文を準備

### Week 4（6/7–6/13）：PT開始 + 製品告知（最重要）

PT側:
- [ ] 案件開始（週10h・週次レビュー）

製品側:
- [ ] **Week 3の検証ゲート**: Zenn無料記事 or プロダクト告知ツイートを公開
- [ ] 興味表明（リアクション・予約フォーム）20件未満なら **6/15に別案へピボット**

---

## 応募テンプレート集

### A. GitHub プロフィール README 草案

````markdown
### Hi, I'm Koji Ishimoto (@dowdiness)

Frontend engineer based in Kyoto, Japan.
Building things at the intersection of **language design, structure editors, and CRDTs**.

**Currently available for ~10 hrs/week remote contract work** — React/TypeScript, full-stack, dev tools.
I run my own product/research projects half-time, so I'm only taking small but well-defined engagements.
Reach me at: koji.ishimoto@gmail.com

#### What I work on
- 🧮 [Lambda Calculus CRDT Editor](https://github.com/dowdiness/...) — collaborative structure editor for lambda calculus
- 📘 [tapl-rescript](https://github.com/dowdiness/tapl-rescript) — Types and Programming Languages, ported to ReScript
- ✏️ [antisatori.pages.dev](https://antisatori.pages.dev) — public notes (built with Quartz)

#### Stack
TypeScript · React · Node.js · Rust (learning) · ReScript · Haskell · MoonBit
````

### B. X/Twitter bio 草案

```
Frontend engineer (React/TS) in Kyoto · CRDT / structure editors / type systems
Available for remote contract work → DM or email
github.com/dowdiness · antisatori.pages.dev
```

### C. Hacker News "Who wants to be hired?" 投稿草案

毎月1日 0:00 PST にスレが立つ。Format厳守。

```
Location: Kyoto, Japan
Remote: Yes (Asia / Europe / US time zones all OK)
Willing to relocate: No
Technologies: TypeScript, React, Node.js, full-stack web. Comfortable with Rust, ReScript, Haskell, MoonBit. Interested in compilers, type systems, CRDTs, structure editors.
Résumé/CV: [link]
Email: koji.ishimoto@gmail.com

I'm a frontend engineer with several years of production React/TypeScript experience, currently building open-source projects around collaborative structure editors and applied PL theory (Lambda Calculus CRDT Editor, a ReScript port of TaPL).

Looking for part-time / contract work, ~10 hrs/week. Particularly interested in dev tools, collaborative editors, or anything language-tooling adjacent — but happy to take on general product work in React/Next.js too.

Portfolio: https://antisatori.pages.dev
GitHub:    https://github.com/dowdiness
```

### D. 海外スタートアップへのコールドメール草案

```
Subject: Frontend contractor (React/TS) — available 20–30 hrs/wk

Hi [Name],

I came across [Company] via [where] and your work on [specific product/feature] caught my attention — [one specific, genuine thing].

I'm a frontend engineer based in Kyoto, available for part-time contract work (~10 hrs/week, remote, any time zone). My core stack is TypeScript + React + Node, and I've shipped production work on [specific past projects if NDA allows, else describe domain].

A few things I've built in the open that might be relevant:
- Lambda Calculus CRDT Editor — a collaborative structure editor exploring CRDTs over ASTs
- tapl-rescript — ReScript port of Types and Programming Languages

If you're hiring contractors or know someone who is, I'd love to chat. 30-min intro call?

Best,
Koji
github.com/dowdiness · antisatori.pages.dev
```

### E. Quartz サイトに追加する /hire ページ草案

```markdown
---
title: Hire me
publish: true
---

I'm available for **remote contract / part-time work**, 20–30 hours per week.

## What I do best
- React / TypeScript / Next.js front-end engineering
- Full-stack web apps (Node.js, Postgres)
- Developer tools, editors, language tooling

## Recent open-source work
- **Lambda Calculus CRDT Editor** — collaborative structure editor over lambda calculus, exploring CRDTs at the AST level
- **tapl-rescript** — port of *Types and Programming Languages* exercises to ReScript
- **antisatori.pages.dev** — this site, built with Quartz

## How to reach me
- Email: koji.ishimoto@gmail.com
- GitHub: [@dowdiness](https://github.com/dowdiness)
- X: [@...](https://x.com/...)

Time zone: JST (UTC+9). Comfortable with async-heavy workflows; can overlap a few hours/day with US-West or Europe.
```

---

## 契約交渉メモ

### 時給の最低ライン
- ¥200,000 / 20h = ¥10,000/h ≈ $65/h ← 下限
- 目標: $80–100/h
- 「最初の1案件は経験/評価のために $60/h まで譲歩可」とするか、最初から$80未満は断るかは判断要

### 契約形態
- Independent Contractor で発行（個人事業主開業届を出していなければ要検討）
- 支払い: 月次 or 半月次 / Wise or USDC受取り
- 著作権・NDAの条項は確認

### 税務
- 月20万 × 12 = 240万 → 個人事業主として開業届・青色申告がほぼ必須
- 課税売上1000万円超の場合のみインボイス検討
- 海外取引は消費税非課税扱い

---

## 次の判断ポイント

| トリガー   | 判断内容                           |
| ------ | ------------------------------ |
| 1案件目開始 | Bレイヤー（製品/教育）の最初の小さな検証を開始するか決める |
| 月20万達成 | PT案件の時間を削って製品時間を増やす移行計画        |
| 6ヶ月時点  | レイヤーA継続 / B移行 / 路線変更 を再評価      |

