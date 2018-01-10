---
title: 'Promises, Async/Await'
date: 2017-12-13 12:42:25
tags:
---
> 文章来源：https://javascript.info/callbacks

# JavaScript 中的callbacks
在javascript中大多数的行为都是异步的。如下：loadScript(src)
```js
function loadScript(src) {
  let script = document.createElement('script');
  script.src = src;
  document.head.append(script);
}
```

上述函数的目的是加载个新的script元素。在document增加`<script src="...">`后，浏览器将要加载并执行它。
我们可以向下面所示使用它：
```js
// loads and executes
loadScript('/my/script.js');
```

这个函数被称为“asynchronous”，因为script的加载是在函数执行之后完成的。
