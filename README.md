# c-vim

按个人需求对 vim-init 做少许改动

## Feature

### Code Completion

### Language

1. Python
2. Rust
3. Golang
4. Markdown

## 安装

```
brew install macvim
mkdir -p ~/Cystem && cd ~/Cystem
git clone https://github.com/twocucao/c-vim.git
chmod a+x ~/Cystem/c-vim/scripts/markdown2ctags.py
chmod a+x ~/Cystem/c-vim/scripts/rst2ctags.py
```

## Credits

- skywind3000/vim-init
- k-vim
- SpaceVim
- skywind3000/vim
- rafi/vim-config

## ChangeLog

* **20170810** 修改 YCM 至 NeoComplete
* **20171007** 解决部分快捷键冲突
* **20180509** 修改 NeoComplete 至 Deplete, 删除非常用的插件，补充一些代码模板
* **20180719** 迁移 vim8 配置到 neovim 0.3
* **20180908** 把大部分配置用 rafi vim-config 里面的配置替换掉
* **20200804** 迁移配置框架到 skywind3000/vim-init

