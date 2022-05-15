let g:writermode = 0

function Writermode()
    if g:writermode == 0
        let g:writermode = 1
        set nonumber
        set tw=0
    else
        let g:writermode = 0
        set number
        set tw=65
    endif
endfunction

" Good light-colored scheme
" colorscheme morning
" My favorite colorscheme
colorscheme shine

set shell=/usr/bin/fish

set dictionary=/usr/share/dict/american-english

" Set folders for backup files
set backupdir=~/.vim-temp//
set directory=~/.vim-temp//
set undodir=~/.vim-temp//

" Set search path
set path+=/home/cpif/**

" Set the C Compiler as the program for `make`
set makeprg=gcc\ %

" Wrapping and text display
set encoding=utf-8
set linebreak
set tw=65
set autoindent
set number
set rnu

" Settings related to the tab key
set expandtab
set tabstop=4
set shiftwidth=4

" Arrow mapping to windows
nnoremap <UP> <C-w>k
nnoremap <DOWN> <C-w>j
nnoremap <LEFT> <C-w>h
nnoremap <RIGHT> <C-w>l

" Mapping function keys to window generation
nnoremap <F2> <C-w>v
nnoremap <F3> <C-w>s

" Print word count
nnoremap <F4> :w<CR>:read!wc -w %<CR>

" Print an outline
nnoremap <F5> ggO<CR><ESC>:1!sed -n '/^\#/p' %<CR>

" Enter and leave writermode
nnoremap <F6> :exec Writermode()<CR>

" Escape mapping from an online guy
inoremap jk <ESC>

" Kill backspace
inoremap <BS> "
inoremap <DEL> '

" Question mark
inoremap <ESC> ?

" Meta keys for stuff!
inoremap <M-p> ()<ESC>i
inoremap <M-i> **<ESC>i
nnoremap <M-i> hea*<ESC>bi*<ESC>
inoremap <M-b> ****<ESC>hi
" Get out of the block
inoremap <M-;> <ESC>A

cnorea myvimrc $MYVIMRC

" File-specific settings
augroup wrapless
    au!
    au Filetype html,awk,fish   setlocal tw=0
    au Filetype html,awk,fish   setlocal nowrap
augroup END

augroup spreadsheets
    au BufEnter *.tsv  setlocal noexpandtab tw=0
    au BufEnter *.csv  setlocal noexpandtab tw=0
augroup END

au Filetype yaml   setlocal tabstop=2 shiftwidth=2
