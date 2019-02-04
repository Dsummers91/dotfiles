execute pathogen#infect()
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vader.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'



let g:go_fmt_command = "goimports"

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

map <C-o> :NERDTreeToggle<CR>
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
call plug#end()
