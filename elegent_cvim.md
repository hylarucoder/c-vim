# 如何优雅的使用 CVim

## 0x00 什么是 CVim 呢？

- skywind3000/vim-init
- SpaceVim
- skywind3000/vim
- rafi/vim-config

## 0x01 基础操作

### Normal 模式

- hjkl
- ctrl+f/b/u/d
- gg / G
- w / W - e / E

### Insert 模式

## 0x02 浏览代码 - 文件跳转

- gf 依据路径进行跳转
- c-p 依据路径进行跳转
- c-p 依据 Buffer 进行跳转
- c-p 依据具体文本进行跳转
- c-p 依据具体 Tags 进行跳转

## 0x01 快速跳转

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

Python Mode 或者 Markdown 之类的文件

- [[ 跳转到上一个 class or funciton
- ]] 跳转到上一个 class or function

### 2.5 EasyMotion

- <Leader><Leader>w
- <Leader><Leader>o

ref: vim diff

- 按照文件名搜索文件
- 按照文件内容搜索文件

### FZF

| Command           | List                                                                    |
| ---               | ---                                                                     |
| `Files [PATH]`    | Files (similar to `:FZF`)                                               |
| `GFiles [OPTS]`   | Git files (`git ls-files`)                                              |
| `GFiles?`         | Git files (`git status`)                                                |
| `Buffers`         | Open buffers                                                            |
| `Colors`          | Color schemes                                                           |
| `Ag [PATTERN]`    | [ag][ag] search result (`ALT-A` to select all, `ALT-D` to deselect all) |
| `Lines [QUERY]`   | Lines in loaded buffers                                                 |
| `BLines [QUERY]`  | Lines in the current buffer                                             |
| `Tags [QUERY]`    | Tags in the project (`ctags -R`)                                        |
| `BTags [QUERY]`   | Tags in the current buffer                                              |
| `Marks`           | Marks                                                                   |
| `Windows`         | Windows                                                                 |
| `Locate PATTERN`  | `locate` command output                                                 |
| `History`         | `v:oldfiles` and open buffers                                           |
| `History:`        | Command history                                                         |
| `History/`        | Search history                                                          |
| `Snippets`        | Snippets ([UltiSnips][us])                                              |
| `Commits`         | Git commits (requires [fugitive.vim][f])                                |
| `BCommits`        | Git commits for the current buffer                                      |
| `Commands`        | Commands                                                                |
| `Maps`            | Normal mode mappings                                                    |
| `Helptags`        | Help tags <sup id="a1">[1](#helptags)</sup>                             |
| `Filetypes`       | File types

- Most commands support `CTRL-T` / `CTRL-X` / `CTRL-V` key
  bindings to open in a new tab, a new split, or in a new vertical split
- Bang-versions of the commands (e.g. `Ag!`) will open fzf in fullscreen
- You can set `g:fzf_command_prefix` to give the same prefix to the commands

## 0x03 文本编辑之选择

### 3.1 Visual 选择

```python
vib- 选框内
vi"- "" 内部
vi'- '' 内部
ggVG
gv 选中上次的 visual 选中区
```

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

查找基本操作

* /
* ?
- c-[

Far.vim

```
:Far {pattern} {replace-with} {file-mask} [params]
:Farp [params]
```

### 4.4 未分类

```
gi 返回上次修改地点
d% 剪切包含括号的括号内部内容
U 恢复单个句子
在命令状态下按 c-d 可以查看所有命令，相当于 bash 下面的 tabtab
hjkl 左下上右
EasyMotion 使用这个就可以代替乱七八糟的快速移动了。这是一个可以给当前的文字立即用打上 tag, 这样的话在 normal 情况下输入，,w 然后就可以看到很多 tag, 输入其中的 tag 就可以立即跳转到相应的 tag.
insert 状态进行编辑 c-h c-w 删除一个字，删除一个词。
normal 状态下进行删除 x dd —— 删除一个字，剪切一行。
. .. —— 重复操作
< —— 缩进 >G g

c-b c-f back forth
c-n c-p 代码补全，tips, 建议标点符号全部半角花，这样就会吧每段连起来的汉字当成一个单词，这样就可以减少输入代码。
indent

< outdent
do it (>)
repeat (.)
reverse (u)
f{char}
repeat ;
reverse ,
```

## 0x05 文本编辑之窗口 /Tab 管理

* . 重复上次文本操作
* u 撤销上次文本操作
* ; 重复上次查找操作

## 0x06 文本处理技能

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

- <C-X><C-F>  : insert name of a file in current directory
- <C-N><C-P>  : word completion in insert mode
- <C-X><C-L>  : Line complete SUPER USEFUL

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

TODO

---
ChangeLog:
 - **2020-08-08** 重修文字
