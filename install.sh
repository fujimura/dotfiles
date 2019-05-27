#! /bin/sh

set -x

mkdir -p ~/.bin
ln -s "$PWD"/bin/git-bk ~/.bin/
ln -s "$PWD"/bin/git-run ~/.bin/
ln -s "$PWD"/bin/git-tb ~/.bin/
ln -s "$PWD"/.gemrc ~/
ln -s "$PWD"/.gitconfig ~/
ln -s "$PWD"/.gitignore ~/
ln -s "$PWD"/.prompt.zshrc ~/
ln -s "$PWD"/.psqlrc ~/
ln -s "$PWD"/.tigrc ~/
ln -s "$PWD"/.tmux.conf ~/
ln -s "$PWD"/.zshenv ~/
ln -s "$PWD"/.prompt.zshrc ~/
ln -s "$PWD"/VSCode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s "$PWD"/VSCode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
