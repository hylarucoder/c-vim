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
brew install neovim --head
mkdir -p ~/Cystem && cd ~/Cystem
git clone https://github.com/twocucao/c-vim.git
ln -sfv `pwd`  ~/.config/nvim
```

## neovim

```bash
brew tap homebrew/cask-fonts
brew search nerd-font
brew install --cask font-victor-mono-nerd-font
brew install --cask font-iosevka-nerd-font-mono
brew install --cask font-hack-nerd-font
brew install --cask font-fira-code

brew install vint shellcheck jsonlint yamllint
brew install tflint ansible-lint tidy-html5 proselint write-good
yarn global add markdownlint-cli eslint jshint stylelint sass-lint
pip3 install --user pycodestyle pyflakes flake8
brew install rg
brew install zoxide
brew install fzf

```


## Credits

- skywind3000/vim-init
- k-vim
- SpaceVim
- skywind3000/vim
- rafi/vim-config

## Debug

```
export NVIM_PYTHON_LOG_FILE=${HOME}/.nvim-python.log
```

---
ChangeLog:
 - **2017-08-10** 修改 YCM 至 NeoComplete
 - **2020-08-04** 迁移配置框架到 skywind3000/vim-init
 - **2020-08-08** 重修文字
 - **2020-11-12** 重修文字
 - **2021-01-11** 重修文字
