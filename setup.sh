#! /bin/bash

DOTFILES_DIR=`pwd`
echo $DOTFILES_DIR
ln -s $DOTFILES_DIR/.zshrc $HOME/.zshrc
ln -s $DOTFILES_DIR/.vimrc $HOME/.vimrc
