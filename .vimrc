set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'bbommarito/vim-slim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mintplant/vim-literate-coffeescript'
Bundle 'juvenn/mustache.vim'
Bundle 'othree/html5.vim'

Bundle 'thinca/vim-quickrun'
Bundle 'tyru/open-browser.vim'
Bundle 'tpope/vim-fugitive'
"Bundle 'plasticboy/vim-markdown'
Bundle 'tsaleh/vim-align'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Shougo/vimproc'
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'vim-pandoc/vim-markdownfootnotes'
Bundle 'kien/ctrlp.vim'
Bundle 'goldfeld/vim-seek'
Bundle 'airblade/vim-gitgutter'
Bundle 'nono/vim-handlebars'
au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars

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
"set softtabstop=2
set tabstop=2
set shiftwidth=2
set autoindent
set expandtab

set guioptions-=T
set guioptions+=a
set guioptions-=m
set guioptions+=R
set showmatch
"set clipboard=unnamed
set smartindent
set nobackup
set noswapfile
set title
set number
set whichwrap=4

syntax on
set background=light
let g:solarized_termcolors = 256
"TODO back to solarized
colorscheme desert

map <Tab> :bnext<cr>
map <C-Tab> :bprevious<cr>

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
let g:netrw_liststyle=3
set wildignore=*.o,*.hi


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
 let w:m1=matchadd('Tab', '	', -1)
 let w:m2=matchadd('EOLSpace', '\s\+$', -1)
 let w:m3=matchadd('WideEisuu', '[Ａ-Ｚａ-ｚ０-９]', -1)
 "let w:m4=matchadd('SpaceAndComma', ' ,', -1)
 "let w:m5=matchadd('CommaAndNonSpace', ',[^(\\n| )]', -1)
 let w:m6=matchadd('Tab', '\t', -1)
endf

au BufRead,BufNewFile *.js set ft=javascript syntax=jquery
au BufRead,BufNewFile *.hs set ft=haskell
au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile *.scss set filetype=scss
call s:highlight_general_checkstyles()

" Haskell
Bundle 'Shougo/neocomplcache'
Bundle "ujihisa/neco-ghc"
Bundle 'dag/vim2hs'
" No unicode lambdas etc.
let g:haskell_conceal = 0
Bundle "eagletmt/ghcmod-vim"

au BufNewFile,BufRead *.hs,*.lhs set filetype=haskell

function! s:haskell()
  command! Stylish %!stylish-haskell
  if executable('ghc-mod')
    command! Type GhcModType
    let g:ghcmod_ghc_options = ['-w']
    au BufRead,BufWritePost *.hs GhcModCheckAsync
  else
    "au BufRead,BufWritePost *.hs call s:buildCabalProject()
  endif
endf

function! s:buildCabalProject()
  execute "!ghc -Wall %"
endf

au BufRead,BufNewFile *.hs call s:haskell()

if has('gui_running')
  set columns=130
  set lines=50
  set guifont=Monaco:h15
  set autoread
  set background=light
  colorscheme solarized
  set vb
  set mouse-=a
  highlight WideSpace             guibg=red
  highlight Tab                   guibg=red
  highlight EOLSpace              guibg=red
  highlight WideEisuu             guibg=red
  "highlight SpaceAndComma         guibg=red
  "highlight CommaAndNonSpace      guibg=red
  highlight HashRocketAndNonSpace guibg=red
  highlight NonSpaceAndHashRocket guibg=red
endif

let g:quickrun_config = {}
let g:quickrun_config['pandoc'] = {
    \ 'type': 'markdown/pandoc',
    \ 'outputter': 'browser',
    \ 'cmdopt': '-s'
\ }
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
