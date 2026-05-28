---
created: 2026-05-17
publish: false
---

# GitHub プロフィール README — PL/CRDT/MoonBit 中心版

`github.com/dowdiness/dowdiness/README.md` にコピペできるMarkdown。

---

```markdown
### Hi, I'm Koji Ishimoto (@dowdiness)

Frontend engineer based in Kyoto, Japan.
Working at the intersection of **language tooling, structure editors,
and live-coding environments** — mostly in MoonBit lately.

**Currently available for ~10 hrs/week remote contract work.**
Especially interested in: developer tools, language tooling, CRDT /
local-first, WebAssembly, audio / creative tools. Also happy to take on
production React/Next.js work — several years of professional TS experience.

→ Reach me at: **koji.ishimoto@gmail.com**

#### What I'm building

🌿 **[Canopy](https://github.com/dowdiness/canopy)** — A structure editor with
CRDT-based concurrent editing, implementing the eg-walker paper.
~1,400 commits, written in MoonBit, targeting wasm-gc.
*"Write. It structures itself."*

🎵 **[moondsp](https://github.com/dowdiness/moondsp)** — A live-codable
DSP audio engine in MoonBit, targeting browser AudioWorklet via wasm-gc.
Inspired by Strudel / TidalCycles. ~400 commits.

🦷 **[js_engine](https://github.com/dowdiness/js_engine)** — A tree-walking
JavaScript interpreter (ES5 + selected ES6+) in MoonBit. Validated against
test262.

📘 **[tapl-rescript](https://github.com/dowdiness/tapl-rescript)** —
*Types and Programming Languages* exercises ported to ReScript.

✏️ **[antisatori.pages.dev](https://antisatori.pages.dev)** — Public notes
on compilers, type systems, and PL theory (built with Quartz).

#### Stack

- **Daily:** MoonBit, TypeScript, React/Next.js
- **Comfortable:** ReScript, Haskell, Rust, WebAssembly
- **Interested in:** CRDTs, structure editors, type theory, audio DSP,
  live coding, local-first software

📦 [My MoonBit packages on mooncakes.io](https://mooncakes.io/user/dowdiness)
```

---

## 適用手順

1. https://github.com/dowdiness/dowdiness リポジトリを作成（既存なら飛ばす）
2. README.md を上記内容で作成
3. プッシュ
4. プロフィールトップ（github.com/dowdiness）に表示されることを確認

未作成の場合の作成コマンド:
```bash
mkdir dowdiness && cd dowdiness
git init
# README.md を作成（上記内容をコピペ）
git add README.md
git commit -m "Initial profile README"
git remote add origin git@github.com:dowdiness/dowdiness.git
git push -u origin main
```

## カスタマイズ要否

そのままでもOKですが、以下を確認:
- [ ] 「~10 hrs/week」の数字は実際の希望と一致しているか
- [ ] 各リポジトリのリンクが正しいか
- [ ] 「years of professional TS experience」の年数を入れたいか（"5+ years of"等）
- [ ] X/Twitterのリンクを追加するか
