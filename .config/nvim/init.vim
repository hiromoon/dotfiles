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

set tabstop=2 shiftwidth=2 expandtab
set number
colorscheme molokai
set t_Co=256
set termguicolors
set background=dark

let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
let g:airline_theme = 'molokai'
let g:indent_guides_enable_on_vim_startup = 1

"============================
"NERDTree
"============================
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

"============================
"ALE
"============================
let g:ale_sign_error = '☓'
let g:ale_sign_warning = '△'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_column_always = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

let g:ale_linters = {
      \  'javascript': ['eslint'],
      \}
let g:ale_fixers = {
      \  'javascript': ['prettier', 'eslint'],
      \}

nmap [ale] <Nop>
map <C-k> [ale]
nmap <silent> [ale]<C-P> <Plug>(ale_previous)
nmap <silent> [ale]<C-N> <Plug>(ale_next)
