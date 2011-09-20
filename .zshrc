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
ZSH_FG2=195
SPROMPT="%B%F{255}%K{200}%r ? %f%k%}%b n,y,a,e :"
PROMPT="%F{0}%K{$ZSH_FG} %k%f "

# From http://d.hatena.ne.jp/mollifier/20090814/p1
zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:*' actionformats '%b|%a'

precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%F{$ZSH_FG}%~% %(!.#.)%f %1(v|%F{$ZSH_FG2}%1v%f|)"

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
alias s='git s'
alias d='git d'
alias gi='git'
alias be='bundle exec'
alias b='bundle'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tl='tail -f log/development.log'
alias api='open ~/railsapi/index.html'
alias color='for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done'
alias firefox='open -a /Applications/Firefox.app'

#alias mysql='mysql5 -p'
#alias mysqldump='mysqldump5'

alias gosh='rlwrap gosh'
export RUBYOPT=-Ku
export PATH=/usr/local/bin:$PATH
export PATH=/opt/local/bin:$PATH
export PATH=/opt/local/sbin:$PATH
export PATH=~/.cabal/bin:$PATH
export EDITOR=vi
autoload -Uz vcs_info
