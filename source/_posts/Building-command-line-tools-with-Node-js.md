---
title: Building command line tools with Node.js
date: 2018-04-06 14:35:07
tags:
---

> [原文链接](https://developer.atlassian.com/blog/2015/11/scripting-with-node/)

# 步骤

1. `npm init / yarn init` 初始化工程
2. 添加命令

  ```json
    {
      "bin": {
        "test": "./test.js"
      }
    }
  ```

3. 测试命令，`npm install -g / yarn global add file:${Path}`
  开发阶段使用 `npm link / yarn link`

4. 取消测试链接 `yarn unlink`