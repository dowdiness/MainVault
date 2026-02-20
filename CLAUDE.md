# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## リポジトリの概要

このリポジトリは2層構造になっている：

1. **ルートディレクトリ**: [Obsidian](https://obsidian.md/) で編集する個人メモ（非公開を含む）
2. **`quartz/`**: [Quartz v4](https://quartz.jzhao.xyz/) による静的サイトジェネレーター。`publish: true` の付いたノートを `quartz/content/` に配置して公開サイト（`antisatori.pages.dev`）を生成する

## Quartz のコマンド（`quartz/` ディレクトリ内で実行）

```bash
# 開発サーバー起動（ホットリロードあり）
npx quartz build --serve

# 本番ビルド
npx quartz build

# 型チェック + フォーマットチェック
npm run check

# コードフォーマット
npm run format

# テスト実行
npm run test

# ドキュメント用ビルド（serve付き）
npm run docs
```

Node.js >= 22、npm >= 10.9.2 が必要。

## Quartz のアーキテクチャ

Quartz はプラグインシステムで動作し、設定は2つのファイルに集約されている：

- **`quartz/quartz.config.ts`**: プラグイン設定・テーマ・ベースURL。プラグインは3種類：
  - `transformers`: Markdown → HTML 変換（frontmatter解析、構文ハイライト、数式、リンク解決など）
  - `filters`: 公開するノートの絞り込み（現在は `ExplicitPublish` のみ → `publish: true` が必須）
  - `emitters`: HTMLページ・サイトマップ・RSS・OGP画像などの出力
- **`quartz/quartz.layout.ts`**: Preactコンポーネントによるページレイアウト。`SharedLayout`（全ページ共通）と `PageLayout`（コンテンツページ・リストページ別）を定義

Quartz本体のソースは `quartz/quartz/` 内：
- `components/`: Preact UIコンポーネント（`Explorer`, `Graph`, `Search` など）
- `plugins/transformers/`, `plugins/emitters/`, `plugins/filters/`: プラグイン実装
- `cfg.ts`: 型定義（`QuartzConfig`, `PageLayout` など）

## ノートの公開フロー

1. Obsidianでルートディレクトリのノートを編集
2. 公開したいノートに frontmatter で `publish: true` を付ける
3. `quartz/content/` に手動またはスクリプトでコピーする
4. Quartzビルドで静的サイトを生成・デプロイ

`ignorePatterns` により `private`、`templates`、`.obsidian`、`.space` ディレクトリはビルドから除外される。

## ノートの構造

- **Frontmatter**: `created`、`modified`（ISO 8601+TZ）、`aliases`、`publish`、`tags` などを使用
- **デイリーノート**: `Timestamps/YYYY/MM/YYYY-MM-DD-曜日.md` に保存。Templaterプラグインで生成
- **テンプレート**: `_Template/` に配置（`_Template/Templater/` 配下にTemplaterテンプレート）
- **Dataviewクエリ**: デイリーノートで当日作成・編集ファイルの一覧表示に使用

## 主要なObsidianプラグイン

- **Templater**: テンプレートからノート生成（デイリーノート等）
- **Dataview**: ノートをデータベースとしてクエリ
- **Smart Composer**: AIによる作文支援
- **obsidian-git**: Gitによる自動バックアップ（コミットメッセージ: `vault backup: YYYY-MM-DD HH:MM:SS`）
- **Tasks**: タスク管理（`quartz/content/Tasks/Tasks` が中心）
