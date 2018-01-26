---
title: learn-typescript(译)
date: 2018-01-26 15:09:03
tags:
---

> 原文链接[Learn TypeScript In 30 Minutes](https://tutorialzine.com/2016/07/learn-typescript-in-30-minutes)

今天我们将要看一下 TypeScript，它被设计为想要构建大型和复杂应用的会被编译成 JavaScript 的一种语言。它继承了大量像 C# 和 Java 语言里面科学的概念，是它更加的轻松和成为了自由类型的 JavaScript。

从技术上说，你不必去学习 TypeScript 也会成为一位很好的开发者。然而采用 TypeScript 也会有很多的好处：

* 由于这个静态类型，在 TypeScript 中的代码更加的具有可预测性，和更加容易查找漏洞。
* 由于这个 模块、命名空间和完全的面向对象支持，可以在大型和复杂项目中更加容易组织代码。
* TypeScript 编译成 JavaScript 有复杂的步骤，这可以在运行代码前捕获各种类型的错误。
* 这 Angular2 采用 TypeScript，它告诉我们使用在项目中使用这个语言更优。

# 静态类型
一个非常独特的功能是 TypeScript 支持静态类型。着意味着你可以为变量指明类型，并且编译器会确保它们会被赋予正确类型的值。如果变量没有被指明类型，它们将会从代码中推断类型。

下面是一个例子。每一个变量，函数参数或者是函数的返回值在初始化时可以被定义类型：

```typescript
var burger: string = 'hamburger', // 字符串
    calories: number = 300,  // 数值
    tasty: boolean = true; // 布尔类型

// 另外，币可以忽略这个类型的声明
// var burger = 'hamburger';

// 函数期望参数是一个字符串和整型
// 函数自身的类型是 void ，因为它不会返回任何值
function speak(food: string, energy: number): void {
  console.log('Our ' + food + " has" + energy + 'calories');
}

speak(burger, calories);
```

因为 TypeScript 被编译成了 JavaScript ，所以之后不会看到他们是什么类型，它们会被完全移除：

```javascript
// 上面 ts 编译成的 JavaScript 的代码
var burger = 'hamburger',
    calories = 300,
    tasty = true;

function speak(food, energy) {
  console.log('Our ' + food + ' has' + energy + ' calories');
}

speak(burger, calories);
```

然而，如果我们尝试去做一些不合规范的事情，编译器`tsc`将会警告我们，在我们的代码中也会有错误提示。例如：

```typescript
// 变量的类型是布尔值，但是赋予的值确实一个字符串
var tasty: boolean = "I haven't tried it yet";
```

> main.ts(1, 5): error TS2322: Type 'string' is not assignable to type 'boolean'.

如果我们在函数参数中出现上述类似的情况，也会给出警告的：

```typescript
function speak(food: string, energy: number): void {
  console.log("Our " + food + " has" + energy + " calories");
}

// 赋予参数的值不能匹配定义参数的类型
speak("tripple cheesburger", "a ton of");
```

> main.ts(5, 30): error TS2345: Argument of type 'string' is not assignable to parmeter of type 'number'.

下面是一些常用的数据类型：
* 数值(number) - 所有数字通过`number`类型来定义，它包括整型，浮点型和其它的数值类型。
* 字符(string) - 这个文本类型，就像被单引号和双引号包裹的字符串。
* 布尔(boolean) - `true`或者`false`，使用 0 和 1 将会造成编译错误。
* 任意(any) - 用这个类型的变量，可以被赋值字符串，数字，等等其它任何类型的值。
* 数组(Array) - 有两种声明的方法：`my_arr: number[]`或者`my_arr: Array<number>`。
* 空(void) - 使用在函数没有任何值返回时。

想看到所有类型，请点击直达[点我](http://www.typescriptlang.org/docs/handbook/basic-types.html) 

# 接口

接口用来进行类型检测，即一个对象是否符合结构。通过定义接口，我们可以命名特定变量的组合，确保它们总是在一块的。当转化成 JavaScript ，接口会消失 - 它们仅有的目的就是在开发中提供帮助。

在下面的例子中，我们定义了一个简单的为了函数参数的类型检测：

```typescript
// 下面我们定义了我们的 Food 接口，它的属性和类型。
interface Food {
  name: string;
  calories: number;
}

// 我们告诉我们的函数期望到接口结构的参数
// 我们可以知道我们需要的属性将要总是会得到
function speak(food: Food): void {
  console.log("Our " + food.name + " has" + food.calories + " calories");
}

// 我们定义一个对象，这个对象将会有 Food 中定义的所有属性。
// 注意类型将会自动的识别
var ice_cream = {
  name: "ice cream",
  calories: 200
}

speak(ice_cream);
```

这个属性的顺序无关紧要。我们仅仅需要被要求的属性值能够传入并有正确的类型。如果丢失一些东西，或者是错误类型参数值，更或者属性名错误，这个编译器将要警告我们。

```typescript
interface Food {
  name: string;
  calories: number;
}

function speak(food: Food): void {
  console.log("Our " + food.name + " has" + food.calories + " grams.");
}

// 我们做了一个故意的错误，这个 name 被错误拼写成了 nmae。
var ice_cream = {
  nmae: "ice cream",
  calories: 200
}

speak(ice_cream);
```

> XX.ts(nn, nn): error TS2345: Argument of type `{nmae: string; calories: number; } is not assignable to parameter of type type 'Food'. property 'name' is missing in type '{nmae: string; calories: number; }'`.

这只是一些入门的基础，所以我们没有涉及更多接口的细节。然而，这有比我们这提到的还要多的多的东西，所以我们建议你出门右转到 TypeScript 官方的文档 - [interfaces](http://www.typescriptlang.org/docs/handbook/interfaces.html)

# 类
当构造有个大型的应用时，程序的面向对象成为了大多数开发者的首选，特别是在 Java 或者 c# 。TypeScript 提供类的系统和它们是相似的，包括继承，抽象类，接口实现，setters/getters，等等。

在最近的 JavaScript 版本(ECMAScript 2015)中也同样提到了这一点，类可以不借助 TypeScript 直接在 JavaScript 中使用。TypeScript 和 JavaScript 中类的实现是相似的但是也略有不同，TypeScript 更加的严格。

接着上述采用 Food 为主题的思路，下面是一个简单的 TypeScript 的类：

```typescript
class Menu {
  // 属性
  // 默认的它们都是公共的，但是也可以设置为私有的。
  items: Array<string>;
  pages: number;

  // 一个明确的构造
  constructor(item_list: Array<string>, total_pages: number) {
    // 这个 this 关键字是强制的
    this.items = item_list;
    this.pages = total_pages;
  }

  // 方法
  list(): void {
    console.log("Our menu for today");
    for(var i = 0; i < this.items.length; i ++) {
      console.log(this.items[i]);
    }
  }
}

// 实例化这个 Menu 的类
var sundayMenu = new Menu(["pancakes", "waffles", "orange juice"], 1);

// 调用这个实例的方法
sundayMenu.list();
```

任何一个最近在写 Java 或者 C# 的人都应该发现这个语法是很相似的。这个相同体现在继承上：

```typescript
class HappyMeal extends Menu {
  // 属性被继承
  
  // 一个新的构造必须被定义
  constructor(item_list: Array<string>, total_pages: number) {
    // 在这个例子中，我们想要和父级(Menu)一样的结构
    // 为了自动拷贝这个，我们可以调用 super() - 一个指向父级 constructor 的引用
    super(item_list, total_pages);
  }

  // 就像属性，方法也会继承父级的
  // 然而，我们想要覆盖父级 list() 函数，所以我们重新定义了它
  list(): void {
    console.log("Our special menu for children");
    for(var i = 0; i < this.items.lengthl i ++) {
      console.log(this.items[i]);
    }
  }
}

// 实例化 HappyMeal 类
var menu_for_children = new HappyMeal(["candy", "drink", "toy"], 1);

// 这次的这个日志信息将会以特殊的介绍开始
menu_for_children.list();
```

对于在 TS 更加深层次的类，你可以读这个文档 - [走这](http://www.typescriptlang.org/docs/handbook/classes.html)

# 泛型

泛型是允许函数接受各种不同类型参数的模板。用泛型来创建重复使用的组件比使用`any`类型的数据类型更加好，泛型保留了变量的类型，既有它们已有的也有它们没有的。

```typescript
// 函数名字后面跟着的这个 <T> 是一个泛型函数
// 当我们调用这个函数时，每一个 <T> 的实例将会被当前提供的类型所替代。

// 接收一个类型 T 的参数，
// 返回一个类型 T 的数组。

function genericFunc<T>(argument: T): T[] {
  var arratOfT: T[] = []; // 创造空的类型 T 的数组。
  arrayOfT.push(arguments); // Push, 现在 arrayOfT = [argument]。
  return arrayOfT;
}

var arrayFromString = genericFunc<string>("beep");
console.log(arrayFromString[0]); // "beep"
console.log(typeof arrayFromString[0]); // String

var arrayFromNumber = genericFunc(42);
console.log(arrayFromNumber[0]); // 42
console.log(typeof arrayFromnumber[0]); // number
```

我们调用这个函数时，我们先手动设定了这个字符类型。编译器并不会得知，参数已经通过了和自动地匹配了类型，就像第二次被调用。既然不是强制的，每次提供类型是一个好的做法，这样在更加复杂的场景中编译器也不会推断正确的类型。

这个 TypeScript 确实提供了一些包含泛型类的好例子，有结合接口实现的，还有等等其它的类型。你可以找到他们在这[探寻](http://www.typescriptlang.org/docs/handbook/generics.html)

# 模块

在构建大型应用的另一个重要的概念便是模块。相比较拥有 10000 行的代码来说，把你的代码分割成很多小的可复用的组件，可以帮助你的项目有组织性和可理解。

TypeScript 介绍了一种导入和导出模块的语法，但是不能够操作文件之间的衔接。为了能够让可扩展的模块，TS依赖第三方的模块：浏览器端的[require.js](http://requirejs.org/) 和 Node.js 端的[CommonJS](https://en.wikipedia.org/wiki/CommonJS)。让我们看一下依赖于 require.js 的 TypeScript 简单例子。

我们有两个文件。一个导出一个函数，另一个导入它并调用它。

**export.ts**

```typescript
var sayzHi = function(): void {
  console.log("Hello!");
}

export = sayHi;
```

**import.ts**

```typescript
import sayHi = require('./exporter');
sayHi();
```

现在我们需要下载 require.js 并在 `\<script\>` 标签中引入它 - [怎么玩看这里](http://requirejs.org/docs/start.html)。这个最后一步就是编译我们的两个 ts 文件了。需要增加一个额外的参数去告诉 TypeScript ，我们构建模块用的是 require.js (当然也可以参数 AMD)，而不是 CommonJS。

```bash
tsc --module amd *.ts
```

模块确实是复杂的和在这个教程是不涉及的。如果你想要继续了解他们请看 TS 的文档 - [这](http://www.typescriptlang.org/docs/handbook/modules.html)

# 第三方声明文件

当使用之前设计的标准的 JavaScript 时，我们需要去应用一个声明文件去做 TypeScript 的兼容。声明文件有后缀 .d.ts 和包含各种关于库和它的 API 的信息。

TypeScript 声明文件通常是手动去书写的，但是如果选择的库已经有人写了这个 .d.ts 文件，那会是一个很好的机会。[DefinitelyTyped](http://definitelytyped.org/)是这个最大的公共知识库，包含了一千多个库。还有一个最受欢迎的 Node.js 模块，它管理的是 TypeScript 的定义，它叫 [Typings](https://github.com/typings/typings)。

如果你需要持续写一个你自己的声明文件，点击这个[地址](http://www.typescriptlang.org/docs/handbook/declaration-files/introduction.html)将会帮助你开始。

# 总结

这只是对 TypeScript 基础的介绍。