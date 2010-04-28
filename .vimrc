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


highlight WideSpace ctermbg=darkred guibg=red
highlight EOLSpace ctermbg=darkred guibg=red
highlight WideEisuu ctermbg=darkred guibg=red
highlight SpaceAndComma ctermbg=darkred guibg=red
highlight CommaAndNonSpace ctermbg=darkred guibg=red
highlight HashRocketAndNonSpace ctermbg=darkred guibg=red
highlight NonSpaceAndHashRocket ctermbg=darkred guibg=red

function! s:highlight_general_checkstyles()
 let w:m1=matchadd('WideSpace', '　', -1)
 let w:m2=matchadd('EOLSpace', '\s\+$', -1)
 let w:m3=matchadd('WideEisuu', '[Ａ-Ｚａ-ｚ０-９]', -1)
 let w:m4=matchadd('SpaceAndComma', ' ,', -1)
 let w:m5=matchadd('CommaAndNonSpace', ',[^(\\n| )]', -1)
endf
au BufRead,BufNewFile *.js set ft=javascript syntax=jquery
call s:highlight_general_checkstyles()
