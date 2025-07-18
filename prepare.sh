#!/bin/bash

echo "Downloading Plug for vim..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Init and update of  Alacritty themes sumbodule"
git submodule init
git submodule update

echo "Checking stow..."
if which stow >/dev/null 2>&1; then
    echo "stow is already installed"
else
    echo "installing stow..."
    brew install stow
fi

