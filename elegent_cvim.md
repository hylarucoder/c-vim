# 如何优雅的使用 CVim

## 0x00 什么是 CVim 呢？

其实就是另一个 vim 配置。

话说，这个项目本身起源于 https://github.com/wklken/k-vim

随着我的技术栈越来越有针对性，则非常有必要自己梳理一套编辑器配置，这就是这个项目诞生的原因。

k-vim 做的很棒，我通读了几遍，针对我日常的一些小习惯做了一些只满足于我个人的开发配置。

## 0x01 那这篇文章的内容是什么？

首先，先回答这篇文章不是什么。

* 不是 Vim 的基础帖（尽管我会提及部分基础知识）。所以，如果连 vim 的基本常识都不明白，赶紧速度刷 vim 的教程去。
* 不是 VimScript 的编写以及 Vim Plugin 的开发设计。

那这篇文章是什么呢？

* 是我整理 Vim 配置和常见之后的编辑器快捷键。
* 是我整理处理不同文件的思路优化。

## 0x02 文本编辑之跳转

### 2.1 定位文件

文件名称

* :e you/path/file.py
* c-p
* nerdtree

文件内容

* ag / grep

### 2.2 文件内跳转

Insert Mode

* c-o
* c-i

Normal Mode

* hjkl
* f{char} F{char}
* t{char} T{char}
* aio AIO
* gi 返回上次修改地点
* gf 在当前 window 打开光标下路径
* 10g 跳转到第十行
* u 撤销
* EasyMotion 这是一个可以给当前的文字立即用打上 tag, 这样的话在 normal 情况下输入，,w 然后就可以看到很多 tag, 输入其中的 tag 就可以立即跳转到相应的 tag.

### 2.3 文件间跳转

* vim-rails 选中当前文本直接 Go To Path

## 0x03 文本编辑之选择

### 3.1 Visual 选择

* vib- 选框内
* vi"- "" 内部
* vi'- '' 内部
* ggVG
* gv 选中上次的 visual 选中区

行选择，块选择，扩展块选择

多光标选择

## 0x04 文本编辑之编辑

### 4.1 文本编辑操作

* c-w 向后删除一个 word
* c-h 向后删除一个 char

### 4.2 文本编辑元操作？

* . 重复上次文本操作
* u 撤销上次文本操作
* ; 重复上次查找操作

### 4.3 文本编辑查找替换

* /
* ?

## 0x05 文本编辑之窗口 /Tab 管理

* . 重复上次文本操作
* u 撤销上次文本操作
* ; 重复上次查找操作

## 0x07 代码补全与 Snippet

## 0x08 编程语言的支持

### 8.1 Python / Django / Flask

### 8.2 JavaScript / Vue / React

### 8.3 Bash / Ngnix / SQL

### 8.4 Markdown / ReStructedText

平日里记笔记主要使用 markdown 和 ReStructedText 来搞。

## 0xFF CheatSheet

| 快捷键  | 作用                                                                                               |
| ------- | -------------------------------------------------------------------------------------------------- |
| **F1**  | 废弃不用                                                                                           |
| **F2**  | 用于重命名？                                                                                       |
| **F3**  | 用于开启 NerdTree                                                                                  |
| **F3**  | **F4**                                                                                             |
| **F3**  | **F4**                                                                                             |
| **F3**  | **F4**                                                                                             |
| **F3**  | **F4**                                                                                             |
| **F8**  | 消除多余行，去掉多余字符                                                                           |
| **F9**  | 消除多余行，去掉多余字符                                                                           |
| **F10** | 用于最常见格式化，防止 F11 出现过度格式化                                                          |
| **F11** | 用于针对不同的文件执行最优格式化，Markdown 就调用 Pangu , 消除多余行，消除多余空格，并 TableFormat |
| **F12** | TagbarToggle, 查看 Tags                                                                            |

## 0xEE 扩展阅读

* [c-vim](https://github.com/twocucao/c-vim)
