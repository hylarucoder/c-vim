#!/bin/bash

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
