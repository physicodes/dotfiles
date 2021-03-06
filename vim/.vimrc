" Basic Behaviour
set autoread
set clipboard=unnamed,unnamedplus
set encoding=utf-8
set mouse=a
set nu rnu
" UI
filetype plugin indent on
set listchars=eol:¶,trail:•,tab:▸\
syntax on
" General Editing
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=60
set expandtab
set autoindent
set fileformat=unix
" Python & Rust
au BufNewFile,BufRead *.py *.rs
  \ set tabstop=4
  \ set softtabstop=4
  \ set shiftwidth=4
  \ set textwidth=79
" External Plugins
call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
call plug#end()
