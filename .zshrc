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
export EDITOR=mvim
alias vi='mvim'
alias v='vi'
alias e='v'
alias vimrc='$EDITOR ~/.vimrc'
alias zshrc='$EDITOR ~/.zshrc'
alias initel='$EDITOR ~/.emacs.d/init.el'
#alias mvim="open -a ~/Applications/MacVim.app"
alias ia="open $1 -a /Applications/iA\ Writer.app"

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

source ~/.repo.zsh
alias r='repo'

# Ruby
alias be='bundle exec'
alias bes='bundle exec spring'
alias b='bundle'
alias irb='pry'

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
export PATH=~/Library/Haskell/bin:$PATH
export NODE_PATH=/usr/local/share/npm/lib/node_modules/
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

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

  if [ "$1" =~ "^(git|http)" ] ; then
    ghq get $1
    exit 0
  fi

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
    echo "Not found"
  else
    cd $dest
  fi
}
