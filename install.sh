#!/bin/bash

mkdir -p ~/.vim/bundle
git clone https://www.github.com/VundleVim/Vundle.vim
cp vimrc ~/.vimrc
vim -c "exe 'BundleInstall' | exe 'qa'"

cat bashrc > ~/.bashrc

cp .gitconfig ~/
cp .gitignore ~/
cp .git-completion.bash ~/
cp tmux.conf ~/.tmux.conf
