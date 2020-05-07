"###############################################################################
"# File Name	: 	init.vim
"# Author 	:	Masroor Rasheed
"# Created	:	Sat 18 Apr 2020 21:10:18 BST
"###############################################################################
call plug#begin('~/.config/nvim/plugged')
	Plug('itchyny/lightline.vim')
call plug#end()
"
" Mode Settings for Cursor
" 1 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical block
let &t_SI.="\e[5 q" 	"SI = INSERT mode
let &t_SR.="\e[3 q"	"SR = REPLACE mode
let &t_EI.="\e[1 q"	"EI = NORMAL mode

set nocompatible		" No Backward compatibility

" Syntax highlighting
filetype plugin indent on	
" General Set up
set path+=**			" Search current directory recursively
set wildmenu			" Display all matches
set incsearch			" Incremental search
set nobackup			" No auto backup
set noswapfile			" No swap
set t_Co=256			" Set if term support 256 colours
syntax on			" Syntax highlighting
set mouse=nicr			" Enabling mouse scrolling
set nu rnu 			" Line numbering
set cursorline			" Highlight current line
setlocal spell spelllang=en_gb	" British Dictionary
set spell 
set clipboard=unnamedplus
set nohlsearch
set smartindent
set showmatch
set incsearch
set encoding=utf-8
set laststatus=2
" Text, Tab and indent related
set smarttab
set shiftwidth=4
set tabstop=4

" Splits and Tabbed Files
"
set splitbelow splitright
" Remap slip Navigations
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Make adjusting split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>
" Change 2 split windows from vertical to horizontal and vice versa
map <Leader>th	<C-w>t<C-w>H
map <Leader>tk	<C-w>t<C-w>K

" Removes pipes | that act as separators on splits
set fillchars+=vert:\

colorscheme murphy

" File type specific 
autocmd BufNewFile,BufRead *.md set filetype=markdown


