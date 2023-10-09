set nu
set relativenumber
set autoindent             " indent according to previous line.
set expandtab              " use spaces instead of tabs.
set softtabstop =4         " tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.
set tabstop=4
set clipboard+=unnamedplus
set scrolloff=8
set noswapfile
set nobackup
set ttyfast                " faster redrawing.
set lazyredraw             " only redraw when necessary.
set incsearch              " highlight while searching with / or ?.
set hlsearch               " keep matches highlighted.
set termguicolors
set colorcolumn=80


let mapleader=" "
nnoremap j gj
nnoremap k gk
inoremap <C-L> <Right>
nnoremap H ^
nnoremap L $
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
nnoremap J mzJ`z
nnoremap <leader>j j
nnoremap <leader>/ :noh<return><esc>
nnoremap <leader>gl gt
nnoremap <leader>gh gT
nnoremap <leader>p \"_dP
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<cr>cgn
xnoremap <silent> s* "sy:let @/=@s<cr>cgn
nnoremap <space>[  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap <space>] :<c-u>put =repeat(nr2char(10), v:count1)<cr>
xnoremap <  <gv
xnoremap >  >gv
nnoremap <C-d> <C-d>zz^
nnoremap <C-u> <C-u>zz^
nnoremap n nzzzv
nnoremap N Nzzzv

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})
augroup END

call plug#begin()
Plug 'tpope/vim-surround'
Plug 'rebelot/kanagawa.nvim'
Plug 'RRethy/vim-illuminate'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'lervag/vimtex'
call plug#end()

colorscheme kanagawa-dragon

filetype plugin indent on
syntax enable
let g:vimtex_view_method = 'zathura'

