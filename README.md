基于hexo搭建的个人博客
--------
# 说明
基于hexo搭建的个人博客
# 文档链接

# 常用命令
1. 运行本地服务
> yarn hexo s
2. 新建文章
> yarn hexo new xxx
3. 重新编译(生成)
> yarn hexo g
4. 向github提交代码
> yarn hexo d
5. 向aliyun提交代码
> ./publish.sh

# 部署相关

github和aliyun

1. 建立aliyun的子模块
> git submodule add git@47.94.141.225:/home/git/blog/blog.git .deploy_aliyun

# hexo使用
## hexo配置文件(_config.yml)

# 额外配置
## 语法高亮

[采用的库](https://github.com/ele828/hexo-prism-plugin)

主题：
* defalut
* coy
* dark
* funky
* okaidia
* solarizedlight
* tomorrow
* twilight
* atom-dark
* base16-ateliersulphurpool.light
* cb
* duotone-dark
* duotone-earth
* duotone-forest
* duotone-light
* duotone-sea
* duotone-space
* ghcolors
* hopscotch
* pojoaque
* vs
* xonokai

支持的语言：

<http://prismjs.com/#languages-list>

常用：

* Markdown - `markdown`
* CSS - `css`
* JavaScript - `javascript`
* Markdown - `markdown`
* Bash - `bash`
* Batch - `batch`
* C - `c`
* Git - `git`
* JSON - `json`
* Java - `java`
* HTTP - `http`
* PowerShell - `powershell`
* Python - `python`
* TypeScript - `typescript`
* vim - `vim`
* YAML - `yaml`