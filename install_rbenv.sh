rvm seppuku
mkdir -p ~/.rbenv/plugins
cd ~/.rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git
cd
rbenv install 1.9.3-p194
rbenv global 1.9.3-p194
rbenv rehash
gem install bundler pry
rm `which mvim`
brew uninstall macvim
brew install macvim
brew linkapps
