---
title: Hoisting In JavaScript
date: 2017-12-12 16:18:22
tags:
---
> 文章来源：https://scotch.io/tutorials/understanding-hoisting-in-javascript#toc-order-of-precedence

JavaScript中的变量提升
# undefined vs ReferenceError
```
// 未声明的变量在执行时会被赋值undefined
console.log(typeof variable); // Output: undefined
// 在调用未赋值的变量时，会抛出ReferenceError
console.log(variable); // Output: ReferenceError: variable is not defined
```
# Hoisting variables(变量提升)
JS生命周期图
<img src="/img/hoisting-variable.png" style="width:50%;" />
```
// 包含变量的生命和变量的初始化
var a = 100;

function hoist() {
  a = 20;
  var b = 100;
}

hoist();

console.log(a); // Output: 20

console.log(b); // Output: ReferenceError: b is not defined
/*
var b ; b 在 hoist() 的scope中
不能在hoist()之外打印b
*/
```