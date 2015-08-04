#!/bin/sh

sudo apt-get install vim vim-gnome
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
cp .vimrc ~/.

