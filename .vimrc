" Clear all autocommands
autocmd!

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" Languages
Plug 'Twinside/vim-hoogle'
Plug 'dag/vim2hs'
Plug 'itchyny/vim-haskell-indent'
Plug 'digitaltoad/vim-jade'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'fatih/vim-go'
Plug 'juvenn/mustache.vim'
Plug 'nono/vim-handlebars'
Plug 'othree/html5.vim'
Plug 'raichoo/purescript-vim'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-haml'
Plug 'vim-pandoc/vim-markdownfootnotes'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/bnf.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'SQLUtilities'
Plug 'reasonml/vim-reason-loader'
Plug 'junegunn/fzf.vim'
Plug 'flowtype/vim-flow'

" Vim
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-bufferline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'goldfeld/vim-seek'
Plug 'terryma/vim-expand-region'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tsaleh/vim-align'
Plug 'tyru/open-browser.vim'
Plug 'sbdchd/neoformat'
Plug 'editorconfig/editorconfig-vim'
if has('gui_running')
  Plug 'Valloric/YouCompleteMe'
endif

Plug 'janko-m/vim-test'

" NeoVim
Plug 'benekastah/neomake'

" Git
Plug 'tpope/vim-fugitive'

" Color
Plug 'pyte'
Plug 'herrbischoff/cobalt2.vim'
Plug 'marciomazza/vim-brogrammer-theme'
Plug 'nanotech/jellybeans.vim'
Plug 'https://gitlab.com/.sexy/solarized-darcula-color-scheme.git'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'atelierbram/vim-colors_atelier-schemes'
Plug 'reedes/vim-colors-pencil'

call plug#end()

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

set background=light
colorscheme cobalt2


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

" Emacs keybindings in insert mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-e> <End>
cnoremap <C-a> <Home>
cnoremap <C-h> <Backspace>
cnoremap <C-d> <Del>
cnoremap <C-u> <C-U>

" -----------------------------------------------------------------------------
" More settings
" -----------------------------------------------------------------------------

" Files to ignore
let g:netrw_list_hide='.*\.o$\|.*\.hi$\|^\.DS_Store$'
set wildignore=*.o,*.hi

if has('gui_running')
  set guioptions-=T
  set guioptions+=a
  set guioptions-=m
  set guioptions-=m
  set guioptions+=R
  set guifont=Source\ code\ Pro:h16
  set linespace=5
  set autoread
" set background=light
  set visualbell
  set mouse-=a
  noremap : ;
  noremap ; :
  inoremap : ;
  inoremap ; :
  cnoremap : ;
  cnoremap ; :
  vnoremap : ;
  vnoremap ; :
endif

" Colors
highlight Cursor guifg=black guibg=yellow
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
""  let w:m1=matchadd('Tab', '	', -1)
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

autocmd! BufWritePost * Neomake
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

" HTML
autocmd BufRead,BufNewFile *.css,*.sass,*.scss,*.html,*.hbs,*.handlebars setlocal iskeyword+=-


au BufNewFile,BufRead *.es6 setf javascript
autocmd BufRead,BufNewFile *.jsx set filetype=javascript.jsx
autocmd BufRead,BufNewFile *.jsx.erb set filetype=javascript.jsx
let g:jsx_ext_required = 0

autocmd BufRead,BufNewFile *.jb set filetype=ruby

" Go
if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
endif

" -----------------------------------------------------------------------------
" Plugin settings
" -----------------------------------------------------------------------------

" supertab
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

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

autocmd BufWritePost package.yaml silent !hpack --silent
let test#strategy = "neovim"

""command T TestNearest
let g:test#preserve_screen = 1

""au VimEnter * colorscheme cobalt2
highlight Normal ctermbg=NONE
highlight SignColumn ctermbg=NONE
highlight LineNr ctermfg=235
highlight EndOfBuffer ctermbg=NONE

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

language C

let g:javascript_plugin_flow = 1
let g:neomake_javascript_enabled_makers = ['flow']
let g:neomake_jsx_enabled_makers = ['flow']
let g:flow#autoclose = 1


let g:neoformat_enabled_css = ['prettier']

autocmd BufWritePre *.js Neoformat
autocmd BufWritePre *.jsx Neoformat
set rtp+=/usr/local/opt/fzf
set omnifunc=syntaxcomplete#Complete
