set nocompatible

filetype off
set rtp+=~/.vim/vundle/
call vundle#rc()

Bundle 'vim-ruby/vim-ruby'
Bundle 'thinca/vim-quickrun'
Bundle 'tyru/open-browser.vim'
"Bundle 'plasticboy/vim-markdown'
Bundle 'tsaleh/vim-align'
Bundle 'tpope/vim-haml'
Bundle 'bbommarito/vim-slim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kchmck/vim-coffee-script'
Bundle 'ervandew/supertab'
"Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Shougo/vimproc'
Bundle 'juvenn/mustache.vim'
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'vim-pandoc/vim-markdownfootnotes'
Bundle 'Shougo/neocomplcache'
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:neocomplcache_enable_at_startup = 1

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
set number
set whichwrap=4

syntax on
set background=dark
set term=xterm-256color
let g:solarized_termcolors = 256
"TODO back to solarized
colorscheme elflord

imap <C-Space> <C-x><C-o>
inoremap { {}<LEFT>
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
vnoremap ` "zdi`<C-R>z`<ESC>
vnoremap [C-c] [Esc][Esc]
nnoremap <Esc><Esc> :<C-u>noh<Return>
inoremap <tab> <c-n>
nnoremap enc O# -*- encoding: utf-8 -*-<esc>
noremap <space> /

" Emacs in insert mode
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-h> <Backspace>
inoremap <C-d> <Del>
inoremap <C-u> <C-o>d0
inoremap <C-k> <C-o>D
"

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

highlight Todo                  ctermbg=0   ctermfg=22

highlight WideSpace             ctermbg=darkred
highlight EOLSpace              ctermbg=darkred
highlight WideEisuu             ctermbg=darkred
highlight Tab                   ctermbg=darkred
highlight SpaceAndComma         ctermbg=darkred
highlight CommaAndNonSpace      ctermbg=darkred
highlight HashRocketAndNonSpace ctermbg=darkred
highlight NonSpaceAndHashRocket ctermbg=darkred

function! s:highlight_general_checkstyles()
 let w:m1=matchadd('WideSpace', '　', -1)
 let w:m2=matchadd('EOLSpace', '\s\+$', -1)
 let w:m3=matchadd('WideEisuu', '[Ａ-Ｚａ-ｚ０-９]', -1)
 let w:m4=matchadd('SpaceAndComma', ' ,', -1)
 "let w:m5=matchadd('CommaAndNonSpace', ',[^(\\n| )]', -1)
 let w:m6=matchadd('Tab', '\t', -1)
endf

au BufRead,BufNewFile *.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile *.scss set filetype=scss
call s:highlight_general_checkstyles()

" Haskell
Bundle "eagletmt/ghcmod-vim"
Bundle "ujihisa/neco-ghc"
noremap t :<C-u>GhcModType<Return>
let g:ghcmod_ghc_options = ['-w']
au BufRead,BufWritePost *.hs GhcModCheckAsync

if has('gui_running')
  set columns=130
  set lines=50
  set guifont=Monaco:h15
  colorscheme solarized
  set vb
  set mouse-=a
  highlight WideSpace             guibg=red
  highlight EOLSpace              guibg=red
  highlight WideEisuu             guibg=red
  highlight SpaceAndComma         guibg=red
  highlight CommaAndNonSpace      guibg=red
  highlight HashRocketAndNonSpace guibg=red
  highlight NonSpaceAndHashRocket guibg=red
endif

let g:quickrun_config = {}
let g:quickrun_config['pandoc'] = {
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
