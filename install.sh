#!/usr/bin/env bash

# Declare a base path for both virtual environments
venv="${XDG_CACHE_HOME:-$HOME/.cache}/vim/venv"

# Try to detect python2/3 executables
if ! hash python2 2>/dev/null; then
	echo "Python2 installation not found."
	exit 1
elif ! hash python3 2>/dev/null; then
	echo "Python3 installation not found."
	exit 1
fi

# Ensure python 2/3 virtual environments
[ -d "$venv" ] || mkdir -p "$venv"
[ -d "$venv/neovim2" ] || python2 -m virtualenv "$venv/neovim2"
[ -d "$venv/neovim3" ] || python3 -m venv "$venv/neovim3"

# Install or upgrade dependencies
echo ':: PYTHON 2'
"$venv/neovim2/bin/pip" install -U neovim PyYAML
echo -e '\n:: PYTHON 3'
"$venv/neovim3/bin/pip" install -U neovim PyYAML
# refer  spf13-vim bootstrap.sh`
BASEDIR=$(dirname $0)
cd $BASEDIR
CURRENT_DIR=`pwd`

# parse arguments
function show_help
{
    echo "install.sh [option]
    --for-nvim       Install configuration files for neovim, default option
    --help          Show help messages
For example:
    install.sh --for-nvim
    install.sh --help"
}
FOR_VIM=true
if [ "$1" != "" ]; then
    case $1 in
        --for-vim)
            FOR_VIM=true
            shift
            ;;
        *)
            show_help
            exit
            ;;
    esac
fi

lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
}

echo "Step1: backing up current vim config"
today=`date +%Y%m%d`

if $FOR_NEOVIM; then
    for i in $HOME/.config/nvim $HOME/.config/nvim/init.vim; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
    for i in $HOME/.config/nvim/init.vim $HOME/.config/nvim; do [ -L $i ] && unlink $i ; done
fi

echo "Step2: setting up symlinks"

if $FOR_NEOVIM; then
    lnif "$CURRENT_DIR/" "$HOME/.config/nvim"
    lnif $CURRENT_DIR/vimrc $CURRENT_DIR/init.vim
fi

echo "Step3: update/install plugins using plug"
system_shell=$SHELL
export SHELL="/bin/sh"

nvim +PlugInstall! +PlugClean! +qall

export SHELL=$system_shell

echo "Install Done!"
