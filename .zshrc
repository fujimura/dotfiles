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
#alias mvim="open -a ~/Applications/MacVim.app"

# Unix commands
alias lv='lv -c'
alias t='tmux'
alias c='cat'
alias grep='grep --color=auto'

# Git
alias g='git'
alias s='git s'
alias m='git checkout master'
alias d='git d'
alias gi='git'
alias gg='g g'
function git(){hub "$@"}

# Ruby
export RUBYOPT=-Ku
alias be='bundle exec'
alias b='bundle'
alias irb='pry'

# Misc
alias color='for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done'

# Path
export PATH=/usr/local/bin:$PATH
export PATH=/opt/local/bin:$PATH
export PATH=/opt/local/sbin:$PATH
#export PATH=~/Library/Haskell/bin:$PATH
export PATH=~/.cabal/bin:$PATH

# Prompt
source ~/.prompt.zshrc
source ~/.zshrc.local
