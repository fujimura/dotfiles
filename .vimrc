set nocompatible

filetype off
set rtp+=~/.vim/vundle/
call vundle#rc()

Bundle 'vim-ruby/vim-ruby'
Bundle 'thinca/vim-quickrun'
Bundle 'tyru/open-browser.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'tsaleh/vim-align'
Bundle 'tpope/vim-haml'
Bundle 'bbommarito/vim-slim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kchmck/vim-coffee-script'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
"Bundle 'postmodern/vim-yard'
"Bundle 'tpope/vim-rails'
"Bundle 'taq/vim-rspec'

filetype on
filetype indent on
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
autocmd! bufwritepost .vimrc source %
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
"set clipboard=unnamed
set smartindent
set nobackup
set noswapfile
set nofoldenable
set title
set background=dark


imap <C-Space> <C-x><C-o>
set number
set whichwrap=4
syntax on
set t_Co=256
let g:solarized_termcolors=256

set background=dark
colorscheme solarized

inoremap { {}<LEFT>
inoremap [C-c] [Esc][Esc]
inoremap < <><LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
vnoremap [C-c] [Esc][Esc]
nnoremap <Esc><Esc> :<C-u>noh<Return>
inoremap <tab> <c-n>
nnoremap enc O# -*- encoding: utf-8 -*-<esc>
noremap <space> /

command! E Explore

set statusline=%F%m%r%h%w\ %=%l,%v\|%p%%

if exists('&ambiwidth')
  set ambiwidth=double
endif

highlight LineNr                ctermfg=244
highlight StatusLine            ctermfg=237 ctermbg=243
highlight StatusLineNC          ctermfg=237 ctermbg=237

highlight Pmenu                 ctermbg=27  ctermfg=244
highlight PmenuSel              ctermbg=27  ctermfg=0
highlight PmenuSbar             ctermbg=27  ctermfg=0

highlight Todo                  ctermbg=0   ctermfg=232

highlight WideSpace             ctermbg=darkred guibg=red
highlight EOLSpace              ctermbg=darkred guibg=red
highlight WideEisuu             ctermbg=darkred guibg=red
highlight SpaceAndComma         ctermbg=darkred guibg=red
highlight CommaAndNonSpace      ctermbg=darkred guibg=red
highlight HashRocketAndNonSpace ctermbg=darkred guibg=red
highlight NonSpaceAndHashRocket ctermbg=darkred guibg=red

function! s:highlight_general_checkstyles()
 let w:m1=matchadd('WideSpace', '　', -1)
 let w:m2=matchadd('EOLSpace', '\s\+$', -1)
 let w:m3=matchadd('WideEisuu', '[Ａ-Ｚａ-ｚ０-９]', -1)
 let w:m4=matchadd('SpaceAndComma', ' ,', -1)
 "let w:m5=matchadd('CommaAndNonSpace', ',[^(\\n| )]', -1)
endf

au BufRead,BufNewFile *.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile *.scss set filetype=scss
call s:highlight_general_checkstyles()


let g:quickrun_config = {}
let g:quickrun_config['mkd'] = {
      \ 'type': 'markdown/pandoc',
      \ 'outputter': 'browser',
      \ 'cmdopt': '-s'
      \ }

if strlen($rvm_bin_path)
	let g:quickrun_config['ruby'] = {
\		'command': 'ruby',
\		'exec': '$rvm_bin_path/ruby %s',
\		'tempfile': '{tempname()}.rb'
\	}
endif
