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

echo "DONE"
