---
created: 2025-01-22T23:04:40+09:00
modified: 2025-04-29T20:17:28+09:00
---

native code
https://github.com/tc39/ecma262/issues/1114

https://github.com/pmndrs/valtio/issues/430

DOMにおける「Illegal Invocation」エラーの一例とその原因・対処法
https://qiita.com/uhyo/items/a41cf51399de6f3fbd60

Valtioではrefを使う
https://valtio.dev/docs/api/advanced/ref

```js
const rect = new DOMRect()
const rectProxy = new Proxy(rect, {})
rectProxy.x // Uncaught TypeError: Illegal invocation
```