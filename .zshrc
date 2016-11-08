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
bindkey "^r" history-incremental-search-backward
bindkey -e # Vi keybind on terminal

# Editor
export EDITOR="nvim"
alias vi="$EDITOR"
alias v='vi'
alias e='v'
alias vimrc="$EDITOR ~/.vimrc"
alias zshrc="$EDITOR ~/.zshrc"
alias initel="$EDITOR ~/.emacs.d/init.el"

# Unix commands
alias lv='lv -c'
alias t='tmux'
alias grep='grep --color=auto'
alias browse='hub browse'

# Git
alias g='git'
alias s='git s'
alias m='git checkout master'
alias d='git d'
function g(){hub "$@"}

alias r='repo'

# Ruby
alias be='bundle exec'
alias bes='bundle exec spring'
alias b='bundle'
alias irb='pry'

# Haskell
alias ghci='stack ghci'
alias ghc='stack ghc'
alias runhaskell='stack runhaskell'
alias runghc='stack runghc'

# Misc
alias color='for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done'

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
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=.cabal-sandbox/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$HOME/.rbenv/shims:$PATH
export PATH=$(yarn global bin):$PATH


# Prompt
source ~/.prompt.zshrc
source ~/.zshrc.local

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Show as many options as possible in the screen
export LISTMAX=0

# http://blog.kenjiskywalker.org/blog/2014/06/12/peco/

function peco-select-history() {
    BUFFER=$(history -n 1 | \
        eval "tail -r" | \
        peco --query "$LBUFFER")
    zle accept-line
}

zle -N peco-select-history
bindkey '^r' peco-select-history

function repo(){
  local result=""
  local choice=""
  local dest=""
  if [ -z $1 ]; then
    choice=$(ghq list --unique | peco)
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
autoload -Uz add-zsh-hook

eval "$(rbenv init -)"
# Add GHC 7.10.2 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Users/fujimura/Downloads/ghc-7.10.2.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.local/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/fujimura/Downloads/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/fujimura/Downloads/google-cloud-sdk/path.zsh.inc'
fi

# # The next line enables shell command completion for gcloud.
# if [ -f /Users/fujimura/Downloads/google-cloud-sdk/completion.zsh.inc ]; then
#   source '/Users/fujimura/Downloads/google-cloud-sdk/completion.zsh.inc'
# fi
