---
title: abused_css(译)
date: 2018-02-08 14:32:04
tags: 'crooked css'
---

> 原文链接: [CSS Code Can Be Abused to Collect Sensitive User Data](https://www.bleepingcomputer.com/news/security/css-code-can-be-abused-to-collect-sensitive-user-data/)

# 滥用 CSS 来收集敏感的用户数据

利用最近更新的 CSS 语言，CSS 代码已经变成非常强大的工具，它的滥用能够在网站上跟踪用户，从 web 页面中提取和偷盗数据，收集填写在表单中的数据(包括密码)，甚至在一些场景中对黑网站用户实现匿名。

在过去的一个月中，有三个有趣的研究项目已经将 CSS 作为攻击的媒介，显示出曾经被认为对用户良好的语言是如何开始转向供给用户的。

## 使用 CSS 跟踪网站中的用户

第一个发布是由 Jan Böhmer 写的名为["Crooked Style Sheets"](https://github.com/jbtronics/CrookedStyleSheets)的工程，这个工程提供了一种不需要 JavaScript 的，只使用 CSS 代码的，跟踪用户的在页面中元素交互的分析解决方案。

作者表明他可以跟踪当用户在元素上滑过时，当用户点击链接时，当用户预计要写入表单中文本时的时间戳，以及他如何收集大量的真实用户代理人的信息，忽略由欺骗用户代理字符串广告的数据。

## 使用 CSS 盗取 CSRF 的 token

与 Böhmer 的工作相互独立地，安全研究者 Dylan Ayrey(提出 [XSSJacking](https://www.bleepingcomputer.com/news/security/new-attack-xssjacking-combines-clickjacking-pastejacking-and-self-xss/))上周也发表了新的研究，提出攻击者如何滥用 CSS 去偷盗 CSRF 标识 (用户认证)。

Ayrey 提出的供给只针对含有大量的在 HTML 页面元素的属性中存储了 CSRF 标记的错误网站和应用，所以它有一个非常受限的范围。网站或应用拥有者可以容易地打败这个攻击，他们可以找到更加安全的在页面中源代码中不使用抛弃的 CSRF 标记的认证用户方法。

Ayrey 的技术依赖在页面中注入的 CSS 代码和使用 CSS 属性选择器一次去猜测 CSRF 标记一个字母。

这个攻击需要十秒去完成和甚至不需要 iframe 或者不需要向远程服务器发送的持续流量，这都可以警告用户哪些事情发生了错误。此解决方法意味着，从攻击者取回它将数据存储在本地的 Service Worker中，

## 知识扩展

> 1. [CSRF](https://zh.wikipedia.org/wiki/%E8%B7%A8%E7%AB%99%E8%AF%B7%E6%B1%82%E4%BC%AA%E9%80%A0)