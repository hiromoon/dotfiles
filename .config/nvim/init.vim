"============================
"Dein
"============================
if &compatible
  set nocompatible
endif

set runtimepath+=~/.vim/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/.cache/dein')
  call dein#begin('~/.vim/.cache/dein')
  
  let s:toml_dir = expand('~/.config/dein')
  call dein#load_toml(s:toml_dir . '/plugins.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})
  call dein#load_toml(s:toml_dir . '/vue.toml', {'lazy': 1})
  call dein#load_toml(s:toml_dir . '/elixir.toml', {'lazy': 1})
  call dein#load_toml(s:toml_dir . '/python.toml', {'lazy': 1})
  call dein#load_toml(s:toml_dir . '/go.toml', {'lazy': 1})

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

"============================
"基本設定
"============================

filetype plugin indent on
syntax enable

set tabstop=2 shiftwidth=2 expandtab
set number
colorscheme molokai
set t_Co=256
set termguicolors
set background=dark
set ambiwidth=double
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
let g:airline_theme = 'molokai'
let g:indent_guides_enable_on_vim_startup = 1
let g:deoplete#enable_at_startup = 1

tnoremap <Esc> <C-\><C-n>


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
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_python_flake8_executable = 'pipenv'
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_ruby_rufo_executable = 'bundle'

let g:ale_linter_aliases = {
      \  'vue': ['vue', 'javascript'],
      \  'tsx': ['css', 'typescript'],
      \}

let g:ale_linters = {
      \  'javascript': ['eslint'],
      \  'typescript': ['eslint'],
      \  'tsx': ['eslint', 'stylelint'],
      \  'vue': ['eslint', 'vls'],
      \  'elixir': ['credo'],
      \  'python': ['flake8'],
      \  'ruby': ['rubocop'],
      \  'go': ['go_vet', 'golint']
      \}
let g:ale_fixers = {
      \  'javascript': ['prettier-eslint', 'eslint'],
      \  'typescript': ['prettier-eslint', 'eslint'],
      \  'vue': ['eslint'],
      \  'elixir': ['mix_format'],
      \  'python': ['yapf', 'autopep8'],
      \  'ruby': ['rufo', 'rubocop'],
      \  'go': ['gofmt', 'goimports']
      \}

nmap [ale] <Nop>
map <C-k> [ale]
nmap <silent> [ale]<C-P> <Plug>(ale_previous)
nmap <silent> [ale]<C-N> <Plug>(ale_next)

"============================
"Denite
"============================
nnoremap <silent> <C-k><C-f> :<C-u>Denite file_rec<CR>
nnoremap <silent> <C-k><C-g> :<C-u>Denite grep<CR>
nnoremap <silent> <C-k><C-l> :<C-u>Denite line<CR>
nnoremap <silent> <C-k><C-u> :<C-u>Denite file_mru<CR>
nnoremap <silent> <C-k><C-y> :<C-u>Denite neoyank<CR>

"============================
"vim-jsx-typescript
"============================
" dark red
hi tsxTagName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic
