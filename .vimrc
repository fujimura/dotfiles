" Clear all autocommands
autocmd!

if has('python3')
  silent! python3 1
endif

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
" Plug 'vim-pandoc/vim-markdownfootnotes'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-markdown'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/bnf.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'reasonml/vim-reason-loader'
Plug 'flowtype/vim-flow'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'posva/vim-vue/'
Plug 'chr4/nginx.vim'
Plug 'keith/swift.vim'
Plug 'digitaltoad/vim-pug'

" Vim
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-bufferline'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
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
Plug 'mbbill/undotree'
Plug 'Valloric/YouCompleteMe'
Plug 'mattn/vim-sqlfmt'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'janko-m/vim-test'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'

" Git
Plug 'tpope/vim-fugitive'

" Color
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
set hidden

set background=dark
colorscheme Cobalt2


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

nnoremap <C-p> :FZF<cr>
" -----------------------------------------------------------------------------
" More settings
" -----------------------------------------------------------------------------

" Netrw
let g:netrw_list_hide='.*\.o$\|.*\.hi$\|^\.DS_Store$'
set wildignore=*.o,*.hi

" MacVim
if has('gui_running')
  set guioptions-=T
  set guioptions+=a
  set guioptions-=m
  set guioptions-=m
  set guioptions+=R
  set guifont=SourceCodeVariable-Roman:h18
  set linespace=5
  set autoread
" set background=light
  set visualbell
  set mouse-=a
  set cursorline
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
  " let w:m6=matchadd('Tab', '\t', -1)
endf

call s:highlight_general_checkstyles()

" Reload .vimrc immediately
autocmd bufwritepost .vimrc source %

language C

highlight Normal ctermbg=NONE
highlight SignColumn ctermbg=NONE
highlight LineNr ctermfg=235
highlight EndOfBuffer ctermbg=NONE

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste
set omnifunc=syntaxcomplete#Complete
set conceallevel=0
set nospell


set clipboard=unnamed
set spelllang+=cjk

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
autocmd BufWritePost package.yaml silent !hpack --silent

" HTML
autocmd BufRead,BufNewFile *.css,*.sass,*.scss,*.html,*.hbs,*.handlebars setlocal iskeyword+=-

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.md set nospell

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

" vim-test
let test#strategy = "vimterminal"
command T TestNearest
let g:test#preserve_screen = 1

" vim-flow
let g:javascript_plugin_flow = 1
let g:flow#autoclose = 1

" Neoformat
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_markdown = ['prettier']
let g:neoformat_enabled_scss = ['prettier']
let g:neoformat_enabled_haskell = ['hindent']

let g:neoformat_python_black = {
            \ 'exe': 'black',
            \ 'stdin': 1,
            \ 'args': ['-q', '-', '--config ~/.config/black']
            \ }


let g:neoformat_enabled_python = ['isort', 'black']

""autocmd BufWritePre *.js Neoformat
""autocmd BufWritePre *.jsx Neoformat
""autocmd BufWritePre *.ts Neoformat
autocmd BufWritePre *.tsx Neoformat
autocmd BufWritePre *.css Neoformat
autocmd BufWritePre *.scss Neoformat
autocmd BufWritePre *.hs Neoformat
autocmd BufWritePre *.py Neoformat
""autocmd BufWritePre *.vue Neoformat

" ale
let g:ale_linter_aliases = {'vue': 'typescript'}"
let g:ale_linters = {
\   'ruby': ['ruby'],
\   'python': [],
\   'go': []
\}

let b:ale_linter_aliases = ['javascript', 'vue']
let b:ale_linters = ['eslint', 'vls']

" lsp
let g:LanguageClient_serverCommands = {
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ }
set rtp+=/usr/local/opt/fzf

" fzf
 let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
endif
let g:vue_pre_processors = ["typescript"]

autocmd FileType vuejs set filetype=vue
autocmd FileType vuejs syntax enable
""autocmd FileType vue syntax sync fromstart

set maxmempattern=5000

au FileType go setlocal sw=4 ts=4 sts=4 noet
au FileType make setlocal sw=4 ts=4 sts=4 noet

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
