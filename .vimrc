filetype plugin on
set hlsearch
set showcmd	
set cmdheight=1
set showmatch		
set ignorecase	
set smartcase		
set incsearch		
set laststatus=2
set mouse=a		
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

imap <C-Space> <C-x><C-o>
set nocompatible
set number
set whichwrap=4
syntax on
filetype on
filetype indent on
filetype plugin on
colorscheme elflord

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

hi Pmenu ctermbg=lightcyan ctermfg=black
hi PmenuSel ctermbg=lightcyan ctermfg=white
hi PmenuSbar ctermbg=lightcyan ctermfg=black
