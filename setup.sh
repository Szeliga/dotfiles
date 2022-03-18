#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  ln -sf ~/.config/dotfiles/hammerspoon ~/.hammerspoon
fi
ln -sf ~/.config/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.config/dotfiles/gitignore ~/.gitignore
ln -sf ~/.config/dotfiles/zshrc ~/.zshrc
ln -sf ~/.config/dotfiles/gemrc ~/.gemrc
ln -sf ~/.config/dotfiles/tigrc ~/.tigrc
