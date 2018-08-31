"-----------------------
"文字エンコーディング
"-----------------------
set encoding=utf-8
set ambiwidth=double

"-----------------------
"検索関連
"-----------------------
"インクリメンタルサーチ
set incsearch
"検索時に文字列の大文字小文字を区別しない
set ignorecase
set smartcase
"検索文字列の強調表示
set hlsearch

"-----------------------
"インデントの設定
"-----------------------
set expandtab
set tabstop=2
set shiftwidth=2

"-----------------------
"表示設定
"-----------------------
"起動時のメッセージを表示しない
set shortmess+=I

"行番号を表示する
set number

"自動的にインデントする
set autoindent
"ハイライトを有効にする
syntax on
"---------------------
"キー設定
"---------------------
"バックスペースを行頭で押したときに行の連結をする。
set backspace=eol
"-----------------------
"補完機能
"-----------------------
"コマンドラインモードにおける補完機能
set wildmenu wildmode=list:full
"----------------------
"ステータスライン
"---------------------
"ステータスラインに表示するものを設定
set laststatus=2
set statusline=%F%r%=l
"---------------
"" Vim-LaTeX
"---------------
let tex_flavor='latex'
set grepprg=grep\ -nH\ $*
set shellslash
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_dvi='platex --interaction=nonstopmode $*'
let g:Tex_FormatDependency_pdf='dvi,pdf'

let g:Tex_ViewRule_pdf='open -a Preview.app'

"-------------------------------
"dein.vim
"-------------------------------

if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=~/.vim/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/.cache/')
  call dein#begin('~/.vim/.cache/')
  
  let s:toml_dir = expand('~/.config/dein')
  call dein#load_toml(s:toml_dir . '/plugins.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})
  call dein#load_toml(s:toml_dir . '/elixir.toml', {'lazy': 1})
  call dein#load_toml(s:toml_dir . '/python.toml', {'lazy': 1})
  call dein#load_toml(s:toml_dir . '/go.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

"-------------------------------
"Unite.vim
"-------------------------------
"" unite.vim{{{
""The prefix key
let mapleader=","
noremap \ ,
nnoremap [unite] <Nop>
nmap <Leader>f [unite]

"unite.vim keymap
nnoremap [unite]u :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>Buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>Bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]r :<C-u>UniteUniteWithBufferDir<CR>
nnoremap <silent> ,vr :UniteResume<CR>

"vinarise
let g:vinarise_enable_auto_detect=1

"unite build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>
"" }}}
"-------------------------------
"空白文字、タブの表示設定
"-------------------------------
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" 全角スペース・行末のスペース・タブの可視化
if has("syntax")
  syntax on
    " PODバグ対策
  syn sync fromstart
  function! ActivateInvisibleIndicator()
   " 下の行の"　"は全角スペース
    syntax match InvisibleJISX0208Space "　" display containedin=ALL
    highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
  endfunction

  augroup invisible
    autocmd! invisible
    autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
  augroup END
endif
"-------------------------------
"neosnippetの設定
"-------------------------------
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
 
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
 
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
