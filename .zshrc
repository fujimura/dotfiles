# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory autocd extendedglob notify auto_pushd correct
unsetopt beep nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/fu/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload colors
colors

ZSH_FG=205
SPROMPT="%B%F{255}%K{200}%r ? %f%k%}%b n,y,a,e :"
PROMPT="%F{255}%K{$ZSH_FG} %k%f "
RPROMPT="%F{$ZSH_FG} %~% %(!.#.)%f"


autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^r" history-incremental-search-backward

alias v='vi'
alias vimrc='vi ~/.vimrc'
alias zshrc='vi ~/.zshrc'
alias lv='lv -c'
#alias ls='ls --color=auto'
alias g='git'
alias be='bundle exec'
alias b='bundle'
alias gi='git'
alias s='git s'
alias d='git d'
alias gd='git d'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tl='tail -f log/development.log'
alias api='open ~/railsapi/index.html'
alias color='for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done'
alias gems='cd /opt/local/lib/ruby/gems/1.8/gems/'

alias t='~/time.sh'

#alias mysql='mysql5 -p'
#alias mysqldump='mysqldump5'

alias gosh='rlwrap gosh'
export RUBYOPT=-Ku
export PATH=/opt/local/bin:$PATH
export PATH=/opt/local/sbin:$PATH
export PATH=~/.cabal/bin:$PATH
export EDITOR=vi
