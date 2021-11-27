#!/bin/sh

NEOVIM_DOTFILES_ROOT="$HOME/.dotfiles/neovim"
NEOVIM_ROOT="$HOME/.config/nvim"

# Download vim-plug and setup

curl -sSfLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p $HOME/.config/nvim/plugged

if ! [[ -f  "${NEOVIM_ROOT}/init.vim" ]]; then
    ln -s "${NEOVIM_DOTFILES_ROOT}/init.vim" "${NEOVIM_ROOT}/init.vim"
fi

if ! [[ -d "${NEOVIM_ROOT}/lua" ]]; then
    ln -s "${NEOVIM_DOTFILES_ROOT}/lua" "${NEOVIM_ROOT}/lua"
fi

if ! [[ -d "${NEOVIM_ROOT}/ftdetect" ]]; then
    ln -s "${NEOVIM_DOTFILES_ROOT}/ftdetect" "${NEOVIM_ROOT}/ftdetect"
fi

if ! [[ -d "${NEOVIM_ROOT}/ftplugin" ]]; then
    ln -s "${NEOVIM_DOTFILES_ROOT}/ftplugin" "${NEOVIM_ROOT}/ftplugin"
fi


TERM=dumb nvim +PlugInstall +qall >vim.log 2>&1
