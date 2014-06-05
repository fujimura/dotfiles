set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'gmarik/vundle'

" Syntax
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'bbommarito/vim-slim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mintplant/vim-literate-coffeescript'
Bundle 'juvenn/mustache.vim'
Bundle 'othree/html5.vim'
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'vim-pandoc/vim-markdownfootnotes'
Bundle 'nono/vim-handlebars'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'digitaltoad/vim-jade'
Bundle 'fatih/vim-go'

" Vim
Bundle 'thinca/vim-quickrun'
Bundle 'tyru/open-browser.vim'
Bundle 'tpope/vim-commentary'
Bundle 'ervandew/supertab'
Bundle 'Shougo/vimproc'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'goldfeld/vim-seek'
Bundle 'airblade/vim-gitgutter'
Bundle 'tsaleh/vim-align'

" Git
Bundle 'tpope/vim-fugitive'

" Colors
Bundle 'altercation/vim-colors-solarized'
Bundle 'pyte'
Bundle 'noahfrederick/Hemisu'
call vundle#end()            " required
filetype plugin indent on

au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars
au BufRead,BufNewFile *.purs set syntax=haskell

let g:SuperTabContextDefaultCompletionType = "<c-n>"

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
set nofoldenable
set mouse=a
set ttymouse=xterm2
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
autocmd! bufwritepost .vimrc source %
set ambiwidth=double

" Tab and indent
set softtabstop=2
"set tabstop=2
set shiftwidth=2
set smartindent
set autoindent
set expandtab

set guioptions-=T
set guioptions+=a
set guioptions-=m
set guioptions-=m
set guioptions+=R
set showmatch
"set clipboard=unnamed
set nobackup
set noswapfile
set title
set number
set whichwrap=4
set scrolloff=3

syntax on
let g:solarized_termcolors = 256
"TODO back to solarized
colorscheme pyte
set background=light

set conceallevel=0
au FileType * setl conceallevel=0

"map <Tab> :bnext<cr>
"map <C-Tab> :bprevious<cr>

"imap <C-Space> <C-x><C-o>

" Wrap
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
"inoremap <tab> <c-n>
nnoremap enc O# coding: utf-8<esc>
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
let g:netrw_list_hide='.*\.o$\|.*\.hi$\|^\.DS_Store$'
set wildignore=*.o,*.hi

set statusline=%F%m%r%h%w\ %=%l,%v\|%p%%

if exists('&ambiwidth')
  set ambiwidth=double
endif

highlight Todo                  ctermbg=0   ctermfg=22

au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile *.scss set filetype=scss

" Haskell
"Bundle 'Shougo/neocomplcache'
"Bundle "ujihisa/neco-ghc"
Bundle 'dag/vim2hs'
Bundle "eagletmt/ghcmod-vim"
Bundle "Twinside/vim-hoogle"

" No unicode lambdas etc.
let g:haskell_conceal = 0

au BufNewFile,BufRead *.hs,*.lhs set filetype=haskell

function! s:haskell()
  command! Stylish %!stylish-haskell
  if executable('ghc-mod')
    command! Type GhcModType
    command! TypeClear GhcModTypeClear
    let g:ghcmod_ghc_options = ['-w']
    " au BufRead,BufWritePost *.hs GhcModCheckAsync
  endif
endf

au BufRead,BufNewFile *.hs call s:haskell()

function! s:markdown()
  set nonu
  set laststatus=0
endf

au BufRead,BufNewFile *.md call s:markdown()

au BufRead,BufNewFile *.css,*.sass,*.scss,*.html,*.hbs,*.handlebars setlocal iskeyword+=-

if has('gui_running')
  set columns=130
  set lines=50
  set guifont=Anonymous\ Pro:h16
  set linespace=5
  set autoread
  set background=light
  set vb
  set mouse-=a
endif

highlight Cursor guifg=pink guibg=black

highlight WideSpace             ctermbg=red guifg=white guibg=red
highlight EOLSpace              ctermbg=red guifg=white guibg=red
highlight WideEisuu             ctermbg=red guifg=white guibg=red
highlight Tab                   ctermbg=red guifg=white guibg=red
highlight SpaceAndComma         ctermbg=red guifg=white guibg=red
highlight CommaAndNonSpace      ctermbg=red guifg=white guibg=red
highlight HashRocketAndNonSpace ctermbg=red guifg=white guibg=red
highlight NonSpaceAndHashRocket ctermbg=red guifg=white guibg=red

function! s:highlight_general_checkstyles()
 let w:m1=matchadd('WideSpace', '　', -1)
 let w:m1=matchadd('Tab', '	', -1)
 let w:m2=matchadd('EOLSpace', '\s\+$', -1)
 let w:m3=matchadd('WideEisuu', '[Ａ-Ｚａ-ｚ０-９]', -1)
 "let w:m4=matchadd('SpaceAndComma', ' ,', -1)
 "let w:m5=matchadd('CommaAndNonSpace', ',[^(\\n| )]', -1)
 let w:m6=matchadd('Tab', '\t', -1)
endf
call s:highlight_general_checkstyles()

highlight Search guibg='gray'
syntax match Tab /\t/
hi Tab gui=underline guifg=blue ctermbg=blue

" quickrun
let g:quickrun_config = {}
let g:quickrun_config['pandoc'] = {
    \ 'type': 'markdown/pandoc',
    \ 'outputter': 'browser',
    \ 'cmdopt': '-s' }

" ctrlp
let g:ctrlp_working_path_mode = 2
nnoremap <silent> <D-t> :CtrlP<CR>
nnoremap <silent> <D-r> :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$' }

let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': 'find %s -type f'
\ }


if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
endif
