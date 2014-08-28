function repo(){
  if [ -z $1 ]; then
    choice=$(ghq list --unique | peco)
    if [ -z $choice ]; then
      echo "No repo was chosen"
    else
      ghq look $choice
    fi
  else
    ghq look $1
  fi
}

function _repo {
  _values $(ghq list --unique)
}

compdef _repo repo
