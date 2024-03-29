#! /bin/sh

set -x

mkdir -p ~/.bin
for f in $(git ls-files bin)
do
  ln -s "$PWD"/$f ~/.bin/
done
ln -s "$PWD"/.gemrc ~/
ln -s "$PWD"/.gitconfig ~/
ln -s "$PWD"/.gitignore ~/
ln -s "$PWD"/.prompt.zshrc ~/
ln -s "$PWD"/.psqlrc ~/
ln -s "$PWD"/.tigrc ~/
ln -s "$PWD"/.tmux.conf ~/
ln -s "$PWD"/.zshenv ~/
ln -s "$PWD"/.prompt.zshrc ~/
ln -s "$PWD"/neovim/init.lua ~/.config/nvim/init.lua
