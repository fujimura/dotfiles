# History
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

# Zsh
setopt appendhistory extendedglob notify auto_pushd correct
unsetopt beep nomatch
zstyle :compinstall filename '/home/fu/.zshrc'
zstyle ':completion:*:(all-|)files' ignored-patterns '*.o' '*.hi'
autoload -Uz compinit
compinit
autoload colors
colors
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^r" history-incremental-search-backward
bindkey -v

# Editor
export EDITOR=mvim
alias vi='mvim'
alias v='vi'
alias e='v'
alias vimrc='$EDITOR ~/.vimrc'
alias zshrc='$EDITOR ~/.zshrc'
alias initel='$EDITOR ~/.emacs.d/init.el'
alias activate_hsenv='source .hsenv/bin/activate'
#alias mvim="open -a ~/Applications/MacVim.app"

# Unix commands
alias lv='lv -c'
alias t='tmux'
alias c='cat'
alias grep='grep --color=auto'
alias browse='hub browse'

# Git
alias g='git'
alias s='git s'
alias m='git checkout master'
alias d='git d'
alias gi='git'
alias gg='g g'
function g(){hub "$@"}

# Ruby
alias be='bundle exec'
alias bes='bundle exec spring'
alias b='bundle'
alias irb='pry'

# Misc
alias color='for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done'
function di(){open dict://"$@"}

# Path
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/opt/local/bin:$PATH
export PATH=/opt/local/sbin:$PATH
export PATH=~/Library/Haskell/bin:$PATH
export PATH="$HOME/.cabal/bin:$PATH"

export PATH=~/.bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

# Prompt
source ~/.prompt.zshrc
source ~/.zshrc.local

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
