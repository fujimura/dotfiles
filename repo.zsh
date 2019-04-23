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
