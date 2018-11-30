execute pathogen#infect()
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vader.vim'
Plug 'scrooloose/nerdcommenter'

set paste
verbose set autoindent

syntax on
filetype plugin indent on
" show existing tab with 4 spaces width
 set tabstop=2
" when indenting with '>', use 4 spaces width
 set shiftwidth=2
" On pressing tab, insert 4 spaces
 set expandtab

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif


" Show full line path
set statusline+=%F

