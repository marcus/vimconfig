source ~/.vim/autotag.vim
" Change swap file directory
set directory=/tmp

set nocompatible
set ts=2
set sw=2
set sts=2
set autoindent
set smartindent
set expandtab
set smarttab

set wildmenu
set wildchar=<Tab> wildmenu wildmode=full

:filetype on
:filetype plugin on
:filetype indent on

:syntax on

" For python, modify for Ruby
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufWritePre *.py :%s/\s\+$//e

" Project
:let g:proj_flags="imstvcg"

" F1 to auto-complete, not working
imap <F1> <i_Ctrl-N>
" Emacs moving in insert mode
imap <C-b> <Left>
omap <C-b> <Left>
imap <C-f> <Right>
omap <C-f> <Right>
imap <C-p> <Up>
omap <C-p> <Up>
imap <C-n> <Down>
omap <C-n> <Down>
inoremap <M-f> <C-o>e<Right>
onoremap <M-f> e<Right>
inoremap <M-b> <C-Left>
onoremap <M-b> <C-Left>
imap <C-a> <Home>
omap <C-a> <Home>
imap <C-e> <End>
omap <C-e> <End>
inoremap <C-d> <Del>
inoremap <silent> <C-k> <C-r>=<SID>KillLine()<CR>

vmap <C-x> ylpr

" Insert a new line with shift-enter in insert mode
map <S-Enter> o<Esc>

map <C-p> :Project<CR>
