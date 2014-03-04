# From http://d.hatena.ne.jp/mollifier/20090814/p1
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:*' actionformats '%b|%a'

function cabal_sandbox_info() {
    cabal_files=(*.cabal(N))
    if [ $#cabal_files -gt 0 ]; then
        if [ -f cabal.sandbox.config ]; then
             echo "%F{green}sandboxed%f"
        else
             echo "%K{red}not sandboxed%k"
        fi
    fi
}

# Set initial color
ZSHFG=`expr $RANDOM / 128`
precmd () {

  # Set git info into 1v
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"

  # Reset at max
  if [ $ZSHFG -ge 63 ]
  then
    ZSHFG=54
  fi

  # Increment it
  ZSHFG=`expr $ZSHFG + 1`

  # Define prompt with new color at each prompt
  # See: http://zsh.sourceforge.net/Doc/Release/Functions.html#index-precmd
  RPROMPT="%F{$ZSHFG}%~% %(!.#.)%f%1(v|%F{240} %1v%f|)"
  RPROMPT="$RPROMPT $(cabal_sandbox_info)"
  PROMPT="%F{$ZSHFG}💎 %f "
}

SPROMPT="%B%F{256}%K{200}%r ? %f%k%}%b n,y,a,e :"
