#!/bin/bash

echo "Install brew"

#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install vim ripgrep ctags htop

echo "Copy config files"

cp bash_profile ~/.bash_profile
cp vimrc ~/.vimrc
cp global_ignore ~/.global_ignore
cp ctags ~/.ctags
cp gitconfig ~/.gitconfig
mkdir ~/.npm-global
cp npmrc ~/.npmrc

echo "Install composer"
curl -Ss https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer

composer global require phpactor/phpactor
composer global require friendsofphp/php-cs-fixer


echo "Install node tools"
npm i -g prettier javascript-typescript-langserver create-react-app

# GO tools
go get golang.org/x/tools/gopls@latest
go get golang.org/x/tools/cmd/goimports
go get github.com/go-delve/delve/cmd/dlv
go get github.com/golangci/golangci-lint/cmd/golangci-lint
go get google.golang.org/protobuf/cmd/protoc-gen-go


echo "DONE"
