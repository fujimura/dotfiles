" Clear all autocommands
autocmd!

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

" Vundle needs this
filetype off

" Setup Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Languages
Plugin 'Twinside/vim-hoogle'
Plugin 'dag/vim2hs'
Plugin 'itchyny/vim-haskell-indent'
Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'fatih/vim-go'
Plugin 'juvenn/mustache.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mintplant/vim-literate-coffeescript'
Plugin 'nono/vim-handlebars'
Plugin 'othree/html5.vim'
Plugin 'raichoo/purescript-vim'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-haml'
Plugin 'vim-pandoc/vim-markdownfootnotes'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/bnf.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'eagletmt/ghcmod-vim'

" Vim
Plugin 'Shougo/vimproc'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-bufferline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'goldfeld/vim-seek'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-expand-region'
Plugin 'thinca/vim-quickrun'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-vinegar'
Plugin 'tsaleh/vim-align'
Plugin 'tyru/open-browser.vim'

" NeoVim
Plugin 'benekastah/neomake'

" Git
Plugin 'tpope/vim-fugitive'

" Color
Plugin 'pyte'

" Vundle needs this
call vundle#end()
filetype plugin indent on
syntax on

" -----------------------------------------------------------------------------
" General settings
" -----------------------------------------------------------------------------

" Search
set hlsearch
set ignorecase
set smartcase
set incsearch

" Matching
set showmatch
set matchtime=1

" Folding
set nofoldenable

" Status line
set showcmd
set cmdheight=1
set laststatus=2
set statusline=%f%m%r%h%w\ %=%l,%v\|%p%%

set ambiwidth=double

" Tab and indent
set softtabstop=2
"set tabstop=2
set shiftwidth=2
set smartindent
set autoindent
set expandtab

set nobackup
set noswapfile
set title
set number
set whichwrap+=h,l
set scrolloff=3
set display=lastline

colorscheme pyte

" -----------------------------------------------------------------------------
" Remaps
" -----------------------------------------------------------------------------

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

" Move buffers
nnoremap <C-Tab> :bprevious<cr>
nnoremap <Tab> :bnext<cr>

" Clean highlighting
nnoremap <Esc><Esc> :<C-u>noh<Return>

" Search with /
nnoremap <space> /

" Emacs keybindings in insert mode
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

" -----------------------------------------------------------------------------
" More settings
" -----------------------------------------------------------------------------

" Files to ignore
let g:netrw_list_hide='.*\.o$\|.*\.hi$\|^\.DS_Store$'
set wildignore=*.o,*.hi

" GUI settings
if has('gui_running')
  set guioptions-=T
  set guioptions+=a
  set guioptions-=m
  set guioptions-=m
  set guioptions+=R
  set guifont=Anonymous\ Pro:h16
  set linespace=5
  set autoread
  set background=light
  set visualbell
  set mouse-=a
endif

" Colors
highlight Cursor guifg=pink guibg=black
highlight Search guifg=black guibg=gray

" Alerts
highlight CommaAndNonSpace      ctermbg=red guifg=white guibg=red
highlight EOLSpace              ctermbg=red guifg=white guibg=red
highlight HashRocketAndNonSpace ctermbg=red guifg=white guibg=red
highlight NonSpaceAndHashRocket ctermbg=red guifg=white guibg=red
highlight SpaceAndComma         ctermbg=red guifg=white guibg=red
highlight Tab                   ctermbg=red guifg=white guibg=red
highlight WideEisuu             ctermbg=red guifg=white guibg=red
highlight WideSpace             ctermbg=red guifg=white guibg=red

function! s:highlight_general_checkstyles()
  let w:m1=matchadd('Tab', '	', -1)
  let w:m1=matchadd('WideSpace', '　', -1)
  let w:m2=matchadd('EOLSpace', '\s\+$', -1)
  let w:m3=matchadd('WideEisuu', '[Ａ-Ｚａ-ｚ０-９]', -1)
  " let w:m4=matchadd('SpaceAndComma', ' ,', -1)
  " let w:m5=matchadd('CommaAndNonSpace', ',[^(\\n| )]', -1)
  let w:m6=matchadd('Tab', '\t', -1)
endf

call s:highlight_general_checkstyles()

" Reload .vimrc immediately
autocmd bufwritepost .vimrc source %

" -----------------------------------------------------------------------------
" Language specific settings
" -----------------------------------------------------------------------------

" Haskell
" No unicode lambdas etc.
let g:haskell_conceal = 0
function! s:haskell()
  command! Stylish %!stylish-haskell
endf
autocmd BufRead,BufNewFile *.hs call s:haskell()
let g:syntastic_haskell_checkers = ['hlint']

" Markdown
function! s:markdown()
  set nonu
  set laststatus=0
endf
autocmd BufRead,BufNewFile *.md call s:markdown()

" HTML
autocmd BufRead,BufNewFile *.css,*.sass,*.scss,*.html,*.hbs,*.handlebars setlocal iskeyword+=-

" JavaScript
let g:syntastic_javascript_checkers=['eslint']

au BufNewFile,BufRead *.es6 setf javascript
autocmd BufRead,BufNewFile *.jsx set filetype=javascript.jsx
autocmd BufRead,BufNewFile *.jsx.erb set filetype=javascript.jsx
let g:jsx_ext_required = 0

" Go
if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
endif

" -----------------------------------------------------------------------------
" Plugin settings
" -----------------------------------------------------------------------------

" supertab
let g:SuperTabContextDefaultCompletionType = '<c-n>'

" expand-regions
map <C-k> <Plug>(expand_region_expand)
map <C-j> <Plug>(expand_region_shrink)

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


" -----------------------------------------------------------------------------
" NeoVim settings
" -----------------------------------------------------------------------------

set timeout
set timeoutlen=750
set ttimeoutlen=250
set mouse = ""

" NeoVim handles ESC keys as alt+key, set this to solve the problem
if has('nvim')
  set ttimeout
  set ttimeoutlen=0
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:rehash256 = 1
