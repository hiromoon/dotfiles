if &compatible
  set nocompatible
endif

set runtimepath+=/Users/hiromu/.vim/bundle/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundle/')
  call dein#begin('~/.vim/bundle/')
  
  let s:toml_dir = expand('~/.config/dein')
  call dein#load_toml(s:toml_dir . '/plugins.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})
  
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

set number
colorscheme molokai
set t_Co=256
set termguicolors
set background=dark

let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
let g:airline_theme = 'molokai'

