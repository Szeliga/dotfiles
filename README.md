# Dotfiles

This repo contains my dotfiles and instructions on how to setup them

## Vim

```
mkdir -p .config/dotfiles && git clone https://github.com/Szeliga/dotfiles.git ~/.config/dotfiles
ln -sf ~/.config/dotfiles/vim/*.vim ~/.vim/
ln -sf ~/.config/dotfiles/UltiSnips ~/.vim/UltiSnips
# in you ~/.vimrc
echo "source ~/.vim/entrypoint.vim
