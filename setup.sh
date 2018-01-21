#! /bin/bash

CONFIGS=(.zshrc .vimrc .tmux.conf .config .peco)
DOTFILES_DIR=`pwd`
for c in ${CONFIGS[@]}
do
  ln -s $DOTFILES_DIR/$c $HOME/$c
done

