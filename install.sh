#!/bin/bash

echo "Install brew"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install vim ripgrep ctags htop

echo "Copy config files"

cp bash_profile ~/.bash_profile
cp vimrc ~/.vimrc
cp vscache ~/.vscache
cp global_ignore ~/.global_ignore
cp ctags ~/.ctags
cp gitconfig ~/.gitconfig
cp npmrc ~/.npmrc
mkdir ~/.npm-global

# Neovim
# brew install neovim
# mkdir ~/.config/nvim
# cp init.vim ~/.config/nvim

echo "Install composer"
curl -Ss https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer

composer global require phpactor/phpactor "0.16.*"
composer global require friendsofphp/php-cs-fixer "v2.16.3"


echo "Install node tools"
npm i -g prettier javascript-typescript-langserver

# GO tools
go get golang.org/x/tools/gopls@latest
go get golang.org/x/tools/cmd/goimports
go get github.com/go-delve/delve/cmd/dlv
go get github.com/golangci/golangci-lint/cmd/golangci-lint
go get google.golang.org/protobuf/cmd/protoc-gen-go


echo "DONE"
