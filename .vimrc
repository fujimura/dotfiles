filetype plugin on
set hlsearch
set showcmd		" Show (partial) command in status line.
set cmdheight=1
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental searchi
set laststatus=2
set mouse=a		" Enable mouse usage (all modes) in terminals
set ttymouse=xterm2
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
set ambiwidth=double
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set guioptions-=T
set guioptions+=a
set guioptions-=m
set guioptions+=R
set autoindent
set showmatch
set clipboard+=unnamed
set smartindent
set nobackup
set noswapfile
set lines=80

imap <C-Space> <C-x><C-o>
set nocompatible
set number
set whichwrap=4
syntax on
filetype on
filetype indent on
filetype plugin on
colorscheme desert

inoremap { {}<LEFT>
inoremap < <><LEFT>
inoremap % %%<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

if exists('&ambiwidth')
  set ambiwidth=double
endif
