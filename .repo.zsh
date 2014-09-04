function _repo {
  _values $(ghq list --unique)
}

compdef _repo repo
