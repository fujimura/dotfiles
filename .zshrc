# History
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

# Zsh
setopt appendhistory extendedglob notify auto_pushd correct
unsetopt beep nomatch
zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*:(all-|)files' ignored-patterns '*.o' '*.hi'
autoload -Uz compinit
compinit
autoload colors
colors
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^R" fzf-file-widget
bindkey -e # Vi keybind on terminal

# Editor
export EDITOR="vimr --nvim"
alias editor="$EDITOR"
alias vi='editor'
# alias v='vi'
alias e='v'
alias vimrc="$EDITOR ~/.config/nvim/init.lua"
alias zshrc="$EDITOR ~/.zshrc"
alias initel="$EDITOR ~/.emacs.d/init.el"
alias up='docker-compose up'

# Unix commands
alias lv='lv -c'
alias t='tmux'
alias grep='grep --color=auto'
function _browse(){
  if [ -z $1 ]; then
    gh pr view -w || gh repo view -w
  else
    local url=$(gh repo view -q ".url" --json name,url)
    if [ -z $url ]; then
      echo "No repo found here"
    else
      open "$url/commit/$1"
    fi
  fi
}
alias browse='_browse'
function co(){
  git switch $(git for-each-ref --format='%(refname:short)' | fzf)
}

function ch(){
  history -n -r -100 | fzf | perl -pe 'chomp' | git commit -F -
}

# Git
alias g='git'
alias s='git s'
function m() {
  local main_branch=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')
  git checkout $main_branch
}
alias dev='git checkout develop'
alias d='git d'
function g(){hub "$@"}

alias r='repo'

# Ruby
alias be='bundle exec'
alias bes='bundle exec spring'
alias b='bundle'

# Haskell
alias ghci='stack ghci'


# Python
alias py='python3'

# Misc
alias color='for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done'
alias k='kubectl'
#'alias mvim="/Applications/MacVim.app/Contents/bin/mvim"

# Path
export PATH="$HOME/.cabal/bin:$PATH"
export PATH=/opt/local/bin:$PATH
export PATH=/opt/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=~/.bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/Library/Haskell/bin:$PATH
export NODE_PATH=/usr/local/share/npm/lib/node_modules/
export PATH=.cabal-sandbox/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$HOME/.rbenv/shims:$PATH
export PATH=$(yarn global bin):$PATH
export PATH="$HOME/Library/Python/3.8/bin":$PATH
export PERL_CPANM_OPT="--local-lib=~/local/lib/perl5"
export PERL5LIB=$HOME/local/lib/perl5/lib/perl5:$PERL5LIB;

# Prompt
source ~/.prompt.zshrc
source ~/.zshrc.local

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Show as many options as possible in the screen
export LISTMAX=0

function v(){
  if [ -z $1 ]; then
    local choice=$(fzf)
    if [ -z $choice ]; then
    else
      local cmd="v $choice"
      print -S $cmd
      eval $cmd
    fi
  else
    vimr --nvim $@
  fi
}

function repo(){
  local result=""
  local choice=""
  local dest=""
  if [ -z $1 ]; then
    choice=$(ghq list --unique | fzf)
    if [ -z $choice ]; then
      echo "No repo was chosen"
    else
      result=$choice
    fi
  else
    result=$1
  fi

  dest=`ghq list --exact --full-path $result`

  if [ "$dest" == "" ] ; then
    if [ "$1" =~ "^(git|http)" ] ; then
      ghq get $1
      return
    else
      echo "Not found"
    fi
  else
    cd $dest
  fi
}

function _repo {
  _values $(ghq list --unique)
}

compdef _repo repo
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

autoload -Uz add-zsh-hook

setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

export GEMSRC_USE_GHQ=1
export PATH="$HOME/.embulk/bin:$PATH"

# OCaml
. /Users/fujimura/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# yarn
export PATH="$HOME/.yarn/bin:$PATH"

# Local node modules
export PATH="$PWD/node_modules/.bin:$PATH"


export PATH="$HOME/go/bin:$PATH"
# # The next line enables shell command completion for gcloud.
# if [ -f /Users/fujimura/Downloads/google-cloud-sdk/completion.zsh.inc ]; then
#   source '/Users/fujimura/Downloads/google-cloud-sdk/completion.zsh.inc'
# fi
export PATH="$HOME/.embulk/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_COMMAND='
#   (git ls-tree -r --name-only HEAD ||
#    find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
#       sed s/^..//) 2> /dev/null'

export FZF_DEFAULT_COMMAND='git ls-files'
eval "$(rbenv init -)"
eval "$(pyenv init -)"

# source $HOME/.venv/bin/activate
# export PATH="$PWD/.venv/bin:$PATH"
# export PIPENV_VENV_IN_PROJECT=1

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/fujimura/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/fujimura/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/fujimura/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/fujimura/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH="$HOME/google-cloud-sdk/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
eval "$(nodenv init -)"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

. $HOME/.ghcup/env
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

source $HOME/.cargo/env
eval "$(direnv hook zsh)"
export GOPATH=$HOME/go
