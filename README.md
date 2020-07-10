# Dotfiles

This repo contains my dotfiles and instructions on how to setup them

## Vim

### Prerequisites

- bat
- fzf
- neovim
- nodejs
- pynvim
- ripgrep
- vim-plug

### Setup

```
brew install fzf ripgrep bat neovim nodejs
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
python3 -m pip install --user --upgrade pynvim
export VIMDIR="${HOME}/.config/nvim/"
mkdir -p "${VIMDIR}"
mkdir -p .config/dotfiles && git clone https://github.com/Szeliga/dotfiles.git ~/.config/dotfiles
ln -sf ~/.config/dotfiles/vim/*.vim ${VIMDIR}
ln -sf ~/.config/dotfiles/UltiSnips ${VIMDIR}/UltiSnips
echo "source ${VIMDIR}/entrypoint.vim" >> ${VIMDIR}/init.vim
nvim -c ":PlugInstall"
```
