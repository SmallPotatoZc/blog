---
title: 实用的CSS片段
date: 2018-02-27 09:46:59
tags:
---

> 原文链接[30 Seconds of CSS](https://atomiks.github.io/30-seconds-of-css/#shape-separator)

# 清除浮动

确保元素自行清除其子级元素。

> 只适用于采用 layout 构建布局的情况。可以考虑采用一个现推出 flexbox 或者 grid 布局方式。

**HTML**

```html
<div class="clearfix">
  <div class="floated">float a</div>
  <div class="floated">float b</div>
  <div class="floated">float c</div>
</div>
```

**CSS**

```css
.clearfix::after {
  content: '';
  display: block;
  clear: both;
}
.floated {
  float: left;
}
```
