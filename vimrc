" turn off strict vi compatibility
set nocompatible

" vundle {
	filetype off                  " required
	" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

	" let Vundle manage Vundle, required
	Plugin 'gmarik/Vundle.vim'
	" colors
	"Plugin 'altercation/vim-colors-solarized'
	" open files
	Plugin 'kien/ctrlp.vim'
	" commenting
	Plugin 'scrooloose/nerdcommenter'
	" syntax
	Plugin 'scrooloose/syntastic'
	" python
	Plugin 'klen/python-mode'
	" git integration
	Plugin 'tpope/vim-fugitive'

	" All of your Plugins must be added before the following line
	call vundle#end()            " required
	filetype plugin indent on    " required
"}

" colors and font
"let g:solarized_termcolors=256
"color solarized
color desert
set background=dark
set guifont=Menlo:h13,Monospace

" syntax highlighting
syntax on

" spell checking
set spell

" search
set incsearch	" find as you type
set hlsearch	" highlight search terms
set ignorecase  " ignore case in search
set smartcase   " unless there is some case

" fold
set foldenable

" formatting
set autoindent
set shiftwidth=4	" indents are 4 spaces
set tabstop=4	" tabs are at 4 spaces
set softtabstop=4	"  backspace indents
set expandtab	" tabs are actually spaces

" ui
set ruler   " always show cursor position
set number  " show line number
set linebreak   " wrap at word
set splitright  " split right with vsplit
set splitbelow  " splitbelow with split

" key mappings
" <leader> key
let mapleader = ','
" Y consistent with C and D
nnoremap Y y$
" toggle search highlight
nmap <leader>/ :set hls!
" find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>
" visual shifting (don't exist visual mode)
vnoremap < <gv
vnoremap > >gv

" fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gi :Git add -p<CR>
nnoremap <silent> <leader>ga :Git add .<CR>

" utilities
"save and make
nnoremap <silent> <leader>mk :w<CR>:make<CR>
"close windows
nnoremap <silent> <leader>wc :close

" disable rope in python-mode
let g:pymode_rope = 0
