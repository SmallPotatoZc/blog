---
title: interview-js
date: 2018-01-10 09:34:18
tags: 面试
---
# 文章来源
> [JavaScript 权威面试指南]()
# 类型及其转换

# 基础知识
1. JavaScript 中 this 是如何工作的
```js
var x = 0;
var foo = {
  x: 1,
  bar: {
    x: 2,
    baz: function() {
      console.log(this.x);
    }
  }
}

var a = foo.bar.baz;
foo.bar.baz(); // 2
a(); // 0
```

* 函数调用的位置会决定this的绑定

**this到底是什么？**
