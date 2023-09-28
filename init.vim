set autoindent             " indent according to previous line.
set expandtab              " use spaces instead of tabs.
set softtabstop =4         " tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.
set tabstop=4
set clipboard+=unnamedplus
set scrolloff=10
set noswapfile
set nobackup
set ttyfast                " faster redrawing.
set lazyredraw             " only redraw when necessary.
set incsearch              " highlight while searching with / or ?.
set hlsearch               " keep matches highlighted.

let mapleader=" "
nnoremap h ^
nnoremap l $
nnoremap J 5j
nnoremap K 5k
nnoremap <leader>j j
nnoremap <leader>/ :noh<return><esc>
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<cr>cgn
xnoremap <silent> s* "sy:let @/=@s<cr>cgn
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
xnoremap <  <gv
xnoremap >  >gv

call plug#begin()
Plug 'tpope/vim-surround'
call plug#end()

