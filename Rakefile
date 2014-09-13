#!/usr/bin/env rake

DOTFILES = %w|
  .gemrc
  .ghci
  .gitconfig
  .gitignore
  .irbrc
  .prompt.zshrc
  .pryrc
  .tmux.conf
  .vim
  .vimrc
  .zshenv
  .repo.zsh
  .zshrc
|

EXECUTABLES = `git ls-files bin`.each_line.map(&:chomp)

desc "Symlink all dotfiles"
task :symlink_dotfiles do
  DOTFILES.each do |dotfile|
    system %|ln -sfv #{File.expand_path dotfile} ~/#{dotfile}|
  end
end

desc "Symlink all executables"
task :symlink_executables do
  EXECUTABLES.each do |dotfile|
    system %|mkdir -p ~/.bin|
    system %|ln -sv #{File.expand_path dotfile} ~/.bin/#{File.basename dotfile}|
  end
end

desc "Symlink all dotfiles and executables"
task :default => %i|symlink_dotfiles symlink_executables|
