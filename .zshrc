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
SPROMPT="%B%{${bg[green]}%}%r ? %{${reset_color}%}%b n,y,a,e :"
PROMPT="%B%{${fg[green]}%}%n@%m %~% %(!.#.$) %{${reset_color}%}%b"
RPROMPT="%{${fg[magenta]}%}%*%{${reset_color}%}%"


autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^r" history-incremental-search-backward 
alias lv='lv -c'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto' 
export PATH=/var/lib/gems/1.8/bin:$PATH

