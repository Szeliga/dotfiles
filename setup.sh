#!/bin/bash

mkdir -p ~/.config/dotfiles/extras/git ~/.config/dotfiles/extras/zsh ~/.config/lvim ~/.config/kitty
if [[ "$OSTYPE" == "darwin"* ]]; then
  ln -sf ~/.config/dotfiles/hammerspoon ~/.hammerspoon
fi
ln -sf ~/.config/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.config/dotfiles/gitignore ~/.gitignore
ln -sf ~/.config/dotfiles/zshrc ~/.zshrc
ln -sf ~/.config/dotfiles/gemrc ~/.gemrc
ln -sf ~/.config/dotfiles/tigrc ~/.tigrc
ln -sf ~/.config/dotfiles/lvim.lua ~/.config/lvim/config.lua
ln -sf ~/.config/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
