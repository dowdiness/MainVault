---
created: <% tp.file.creation_date() %>
modified: <% tp.file.creation_date() %>
type: weekly-meal-plan
week_of: <% tp.date.now("YYYY-MM-DD") %>
tags: [meal-plan]
---

# 週間献立 <% tp.date.now("YYYY-MM-DD") %>

## 今週のレシピ候補一覧

```dataview
TABLE nutrients AS "栄養", target AS "対象", cost_yen AS "目安コスト(円)"
FROM "quartz/content/MealPlans/Recipes"
SORT cost_yen ASC
```

## 曜日ごとの献立

`Recipes/` 内のレシピ名をコピーしてリンクにしてください(例: `[[鮭とほうれん草のレンジ蒸し]]`)。

- 月: [[]]
- 火: [[]]
- 水: [[]]
- 木: [[]]
- 金: [[]]
- 土: [[]]
- 日: [[]]

## 買い物リスト(自動集計)

上の曜日欄にレシピを入れた後、このノートを開き直すと下に自動で材料が集計されます。

```dataviewjs
const page = dv.current();
const links = Object.values(page.file.frontmatter ?? {});
// 曜日欄の [[リンク]] をノート本文から拾う
const content = await dv.io.load(dv.current().file.path);
const linkNames = [...content.matchAll(/\[\[([^\]]+)\]\]/g)].map(m => m[1]);

let ingredientSet = new Set();
for (const name of linkNames) {
    const recipe = dv.page(name);
    if (recipe && recipe.ingredients) {
        for (const ing of recipe.ingredients) {
            ingredientSet.add(ing);
        }
    }
}

if (ingredientSet.size === 0) {
    dv.paragraph("曜日欄にレシピを追加すると、ここに買い物リストが表示されます。");
} else {
    dv.list([...ingredientSet].sort());
}
```

## 今週の栄養メモ

- マグネシウム: 豆腐・厚揚げ・ほうれん草・魚介類を意識
- ビタミンB群: 豚肉・鶏むね・玄米を意識
- 首コリ・だるさ対策: 魚(鮭・さば)を週2回以上入れる
