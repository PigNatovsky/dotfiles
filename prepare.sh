# This script should handle MacOS and Linux
#!/bin/bash

echo "Creating .config..."
mkdir -p $HOME/.config
echo "Downloading Plug for vim..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Init and update of  Alacritty themes sumbodule"
git submodule init
git submodule update

# BSD ctags will not work with tagbar plugin
dependencies=(ctags fzf go python-setuptools stow)
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

# Install Iosevka fornts
# for f in $(brew search iosevka | grep font) ; do brew install $f ; done

brew install font-jetbrains-mono-nerd-font

# Emacs
brew tap d12frosted/emacs-plus
brew install emacs-plus@30

# Doom Emacs
if [[ ! -f ~/.config/emacs/bin/doom ]]
then
  echo "Path does not exists, cloning doom repo" 
  git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
  ~/.config/emacs/bin/doom install
fi
