#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  ln -sfh ~/.config/dotfiles/hammerspoon ~/.hammerspoon

  if ! command -v brew &> /dev/null
  then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi 

  brew install fd ripgrep fzf grammarly-languageserver
fi

mkdir -p ~/.config/dotfiles/extras/git ~/.config/dotfiles/extras/zsh ~/.config/kitty
ln -sf ~/.config/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.config/dotfiles/gitignore ~/.gitignore
ln -sf ~/.config/dotfiles/zshrc ~/.zshrc
ln -sf ~/.config/dotfiles/gemrc ~/.gemrc
ln -sf ~/.config/dotfiles/tigrc ~/.tigrc
ln -sfh ~/.config/dotfiles/nvim ~/.config/nvim
ln -sf ~/.config/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
