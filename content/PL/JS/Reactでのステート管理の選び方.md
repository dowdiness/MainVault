---
aliases: [useState]
created: 2024-12-23T10:15:51+09:00
modified: 2025-04-29T20:17:32+09:00
---

|                       | 再レンダーの実行 | 変数の変更 | データの保存場所 |
| --------------------- | -------- | ----- | -------- |
| useState \| useReduce | 出来る      | 出来ない  | コンポーネント  |
| useRef                | 出来ない     | 出来る   | コンポーネント  |
| モジュールスコープ変数           | 出来ない     | 出来る   | モジュール    |

状態のライフタイム
# useState

## 使う基準

`dispatch関数(use何とか)` を使ってHTMLの変更をしたい

[レンダーとコミット](https://ja.react.dev/learn/render-and-commit)

[react-dom-bindings](https://github.com/facebook/react/tree/main/packages/react-dom-bindings) で
https://github.com/facebook/react/tree/main/packages/react-dom

# useRef

```ts
function useRef(initialState) {
	const [state, _] =  useState({ current: initialState })
	return state
}
```

paintの描画とペイントでの表記揺れを修正



ドキュメント内でbrowser renderingの意味で使われているペイントを全て描画に変更しました。このPRによりペイントという単語はドキュメント内に出現しなくなります。

renderとpaintはこのドキュメントにおいて意識的に使い分けられている重要な用語だと思います。しかし日本語版では `ドキュメント全体を通して「ペイント」と呼ぶことにします` という記述があるにも関わらず、実際には描画という用語が全体として使われていてペイントは出てこなくなります。

過去の議論を見る限り、renderの訳はレンダー、paintの訳は描画に決まっているようなので、browser renderingとしての意味で使われているpaintは全て描画に統一した方が分かりやすくなるはずです。
https://github.com/reactjs/ja.react.dev/pull/243#issuecomment-532097112

wikiの訳語の統一にもpaintの項目を追加したほうが良いかもしれません。


修正のPRを送っておいてなんですが、実は自分も描画ではなくペイントにした方が分かりやすいんじゃないかなと感じています。

レンダリングという言葉が映像やCG、ブラウザの歴史もあり、日本語の中で英語とは少し違う意味を持ち始めているのもあって、描画＝レンダリングと脳内で無意識に変換している人が多いんじゃないかと思います。

実際にreactの日本語情報を検索してみると描画がレンダリングと同義語で使われているものが多くあります。

そういう日本語の資料を今まで読んだきた人がこのドキュメントで描画という単語に出会った時に勘違いしないためにも、カタカナでペイントにしたほうが明確な意図があってこの言葉を選んでるんだなというのが分かって混乱が起きにくい気がします。

# Context

グローバルなステート管理ではない

# 外部にステートを持ちたい場合