#!/bin/bash

set -eu

if [[ `uname` == "Darwin" ]]; then
  mkdir $HOME/Project $HOME/.ssh $HOME/.hammerspoon

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew update
  brew install git
  brew install screen
  brew install vim --with-python3
  brew cask install docker
  brew install hugo # optional
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  rustup component add rustfmt
  defaults write com.apple.finder AppleShowAllFiles YES

  mv -f $HOME/.config/.zshrc $HOME/.config/.hushlogin $HOME/.config/.vimrc $HOME/.config/vim/ $HOME/.config/.hammerspoon/ $HOME/
  source $HOME/.zshrc
else
  echo 'Unknown'
fi
