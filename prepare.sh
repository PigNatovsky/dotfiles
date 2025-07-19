#!/bin/bash

echo "Downloading Plug for vim..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing plugins..."
vim +PlugInstall +qa

echo "Init and update of  Alacritty themes sumbodule"
git submodule init
git submodule update

dependencies=("fzf" "go" "stow")
for bin in "${dependencies[@]}"
do
  echo "Checking $bin..."
  if which $bin >/dev/null 2>&1; then
      echo "$bin is already installed"
  else
      echo "installing $bin..."
      brew install $bin
  fi
done

