let mapleader=" "
nnoremap H ^
nnoremap L $
nnoremap J 5j
nnoremap K 5k
nnoremap <Leader>j J
nnoremap <Leader>/ :noh<return><esc>
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

set shiftwidth=4
set tabstop=4
set clipboard+=unnamedplus
set scrolloff=10
set noswapfile
set nobackup
set incsearch
set hlsearch

call plug#begin()
Plug 'tpope/vim-surround'
call plug#end()

