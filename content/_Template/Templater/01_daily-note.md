---
date: <% tp.file.creation_date() %>
---
tags:: [[+Daily Notes]]

# <% moment(tp.file.title,'YYYY-MM-DD') %>

<< [[Timestamps<% tp.date.now("YYYY", -1) %>/<% tp.date.now("MM", -1) %>/<% tp.date.now("YYYY-MM-DD-dddd", -1) %>|昨日]] | [[Timestamps/<% tp.date.now("YYYY", 1) %>/<% tp.date.now("MM", 1) %>/<% tp.date.now("YYYY-MM-DD-dddd", 1) %>|明日]] >>

---
## 📅 質問

##### 🚀 今日やったこと

- [ ] 

---
## 📝 感想

---
## 今日作ったノート

```dataview
List FROM "" WHERE file.cday = date("<%tp.date.now("YYYY-MM-DD")%>") SORT file.ctime asc
```

## 今日編集したノート

```dataview
List FROM "" WHERE file.mday = date("<%tp.date.now("YYYY-MM-DD")%>") SORT file.mtime asc
```