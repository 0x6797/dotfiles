set nocompatible
filetype off
filetype plugin off
filetype indent off

" -------------------------------------
"  Reset augroup
" -------------------------------------
augroup MyAutoCmd
  autocmd!
augroup END

" -------------------------------------
"  Disable default plugins
" -------------------------------------
let g:loaded_gzip              = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_rrhelper          = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1

" -------------------------------------
"  Setup dein
" -------------------------------------
" dein settings {{{
" Install dein.vim if not exists
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" }}}

" Begin configurations
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Set the default git protocol to https
  let g:dein#types#git#default_protocol = "https"

  " TOML file with plugin list to install
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " Cache the pre-loaded TOML file
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " End configurations
  call dein#end()
  call dein#save_state()
endif

" Install plugins to be not installed
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype on
filetype plugin on
filetype indent on
syntax on

" -------------------------------------
"  Set SPACE key to <Leader>
" -------------------------------------
let mapleader = "\<Space>"

" -------------------------------------
"  Set Mouse enabled
" -------------------------------------
set mouse=a

" -------------------------------------
"  Highlight ZenkakuSpace
" -------------------------------------
scriptencoding=utf-8
highlight ZenkakuSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
match ZenkakuSpace /　/

" -------------------------------------
"  Highlight columns over 80
" -------------------------------------
set textwidth=80
highlight ColorColumn ctermbg=237 guibg=#2c2d27
let &colorcolumn=join(range(81,9999),",")

" -------------------------------------
"  Set BackSpace enabled in insert mode
" -------------------------------------
set backspace=indent,eol,start

" -------------------------------------
"  Enable clipboard
" -------------------------------------
set clipboard+=unnamedplus

" -------------------------------------
"  Recursive search for ctags
" -------------------------------------
if has("path_extra")
  set tags+=tags;
endif

" -------------------------------------
"  Set <Esc> to switch terminal mode
"  to normal mode
" -------------------------------------
tnoremap <Esc> <C-\><C-n>

" -------------------------------------
"  Move cursor on display lines always
" -------------------------------------
setlocal wrap nolinebreak nolist
set virtualedit=
setlocal display+=lastline
noremap  k gk
noremap  j gj
noremap  <Up>   gk
noremap  <Down> gj
noremap  <Home> g<Home>
noremap  <End>  g<End>
inoremap <Up>   <C-o>gk
inoremap <Down> <C-o>gj
inoremap <Home> <C-o>g<Home>
inoremap <End>  <C-o>g<End>

