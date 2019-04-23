function v(){
  if [ -z $1 ]; then
    local choice=$(fzf)
    if [ -z $choice ]; then
    else
      local cmd="v $choice"
      print -S $cmd
      eval $cmd
    fi
  else
    vi $@
  fi
}

