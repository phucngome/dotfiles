#!/bin/bash

echo "Install brew"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install vim neovim ripgrep ctags htop

echo "Copy config files"

cp bash_profile ~/.bash_profile
cp vimrc ~/.vimrc
cp vscache ~/.vscache
cp global_ignore ~/.global_ignore
cp ctags ~/.ctags
cp gitconfig ~/.gitconfig
cp npmrc ~/.npmrc
mkdir ~/.npm-global
mkdir ~/.config/nvim
cp init.vim ~/.config/nvim

echo "Install composer"
curl -Ss https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer

composer global require friendsofphp/php-cs-fixer

echo "Install node tools"
npm i -g prettier javascript-typescript-langserver

echo "Link phpactor language server"
ln -s /Users/phuc/.config/nvim/plugged/phpactor/bin/phpactor ~/Projects/go/bin/phpactor

echo "DONE"
