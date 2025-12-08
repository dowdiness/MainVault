---
title: JavaScript modules
publish: false
tags: [module, scope]
aliases: [ES Module, ESM]
created: 2025-05-09T22:54:29+09:00
modified: 2025-05-10T01:34:38+09:00
---

# JavaScript modules

[JavaScript モジュール](https://developer.mozilla.org/ja/docs/Web/JavaScript/Guide/Modules)

https://tc39.es/ecma262/multipage/ecmascript-language-scripts-and-modules.html#sec-ecmascript-language-scripts-and-modules


Import した変数も記事内で解説されている参照の値渡し、JSの関数にオブジェクトを渡したときと同じ挙動になるはずです。

```Typescript:a.ts
let num = 10;

setTimeout(() => {
  console.log(num);
}, 1000);

export default { num };
```

```TypeScript:main.ts
import a from './a.ts';
// プロパティへの代入は可能
a.num = 20;
// ただし、A自体を再代入することはできない
// a = { num: 10 }; エラー! Cannot assign to 'a' because it is an import.ts(2632)

console.log(a.num);
```