# 如何优雅的使用 CVim

## 0x00 什么是 CVim 呢？

CVim 最早基于 k-vim 进行配置，现基于 skywind3000/vim-init Vim 框架进行二次配置

### 优势

- Vim, not Vim like Plugin
- 更现代化的编辑，如
  - ctrl + p 文件搜索
  - option + p 文件搜索
  - Space 万能命令
- For TypeScript/Python/Golang FullStack Engineer
  - Python
  - Golang
  - TypeScript

## 0x01 基础操作

### 文件定位

- c-p
- m-p + words
- gf

### 文本定位

- h/j/k/l
- ctrl+f/b/u/d
- gg G
- w/W e/E
- `;`   重复上次查找操作
- `gi`  返回上次修改地
- `[[`  跳转到上一个 class or funciton
- `]]`  跳转到上一个 class or function
- `c-o`
- `c-i`
- `10g` 跳转到第十行
- `u`   撤销

- 高亮版 f/F t/T
  - f{char} F{char}
  - t{char} T{char}
- <Leader><Leader>w
- <Leader><Leader>o
- /
- ?

- . 重复上次文本操作
- u 撤销上次文本操作
- ; 重复上次查找操作

### 文本选择

```python
vib- 选框内
vi"- "" 内部
vi'- '' 内部
ggVG
gv 选中上次的 visual 选中区
```

行选择，块选择，扩展块选择

多光标选择

### Mode 转换

- aio AIO

### 插入模式

- c-w 向后删除 word
- c-h 向后删除 char

### 未分类

```
U 恢复单个句子
在命令状态下按 c-d 可以查看所有命令，相当于 bash 下面的 tabtab
EasyMotion 使用这个就可以代替乱七八糟的快速移动了。这是一个可以给当前的文字立即用打上 tag, 这样的话在 normal 情况下输入，,w 然后就可以看到很多 tag, 输入其中的 tag 就可以立即跳转到相应的 tag.
insert 状态进行编辑 c-h c-w 删除一个字，删除一个词。
normal 状态下进行删除 x dd —— 删除一个字，剪切一行。

c-b c-f back forth
c-n c-p 代码补全，tips, 建议标点符号全部半角花，这样就会吧每段连起来的汉字当成一个单词，这样就可以减少输入代码。
indent

< outdent
do it (>)
```

## 0x06 文本处理技能

### 文本对齐

```viml
" Using predefined alignment rules
"   :EasyAlign[!] [N-th] DELIMITER_KEY [OPTIONS]
:EasyAlign :
:EasyAlign =
:EasyAlign *=
:EasyAlign 3\

" Using arbitrary regular expressions
"   :EasyAlign[!] [N-th] /REGEXP/ [OPTIONS]
:EasyAlign /[:;]\+/
:EasyAlign 2/[:;]\+/
:EasyAlign */[:;]\+/
:EasyAlign **/[:;]\+/
```

### 行处理

行排序

```bash
sort r /【.\+】/
sort u
sort n
sort
sort!
g/start/+1,/end/-1 sort n
:%!column -t
:%!sort -k2nr
```

```bash
# 行删除
# 删除 html 标签

:%s/<\_.\{-1,\}>//g
```

```
# 删除空行
:g/^$/d
:g/^\s*$/d
:%s/\n\{3,}/\r\r/e
:g/^[ \t\u3000]*$/d
:g/pattern/d
:g!/pattern/d
:g/pattern/t$
:g/pattern/m$
:s/ \{2,}/ /g
```

## 0x07 代码补全与 Snippet

### 常规补全

- <C-X><C-F> : insert name of a file in current directory
- <C-N><C-P> : word completion in insert mode
- <C-X><C-L> : Line complete SUPER USEFUL

### UltiSnips

## 0x08 编程语言的支持

### 8.1 Python / Django / Flask

### 8.2 JavaScript / Vue / React

### 8.3 Bash / Ngnix / SQL

### 8.4 Markdown / ReStructedText

平日里记笔记主要使用 markdown 和 ReStructedText 来搞。

### 8.5 Go

## 0x09 tips

### profiling startuptime

```bash
vim --startuptime /tmp/startup.log +q && vim /tmp/startup.log
```

## 0xEE 感谢

- skywind3000/vim-init
- SpaceVim
- skywind3000/vim
- rafi/vim-config

## 0xEE 扩展阅读

- [c-vim](https://github.com/twocucao/c-vim)

TODO

---

ChangeLog:

- **2020-08-08** 重修文字
