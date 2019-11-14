execute pathogen#infect()
call plug#begin('~/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'
Plug 'udalov/kotlin-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-python/python-syntax'
Plug 'vimwiki/vimwiki'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1

let g:pymode_options_colorcolumn = 0
let g:jedi#force_py_version = 3

"set paste
verbose set nonumber
verbose set autoindent
set nocompatible
syntax on
filetype plugin indent on
" show existing tab with 2 spaces width
 set tabstop=2
" when indenting with '>', use 2 spaces width
 set shiftwidth=2
" On pressing tab, insert 2 spaces
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

"temporay python-mode"
let g:pymode_virtualenv = 0
let g:pymode_breakpoint = 0
let g:pymode_folding = 0
let g:pymode_rope = 0
let g:pymode_run = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_lint_on_write = 1
"set the complexity check high to essentially disable it
let g:pymode_lint_options_mccabe = {'complexity': 30}

call plug#end()
