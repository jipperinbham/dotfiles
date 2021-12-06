#!/bin/sh

STARSHIP_DOTFILES_ROOT="$HOME/.dotfiles/starship"

if ! [[ -f  "${HOMD}/.config/starship.toml" ]]; then
    ln -s "${STARSHIP_DOTFILES_ROOT}/starship.toml" "${HOME}/.config/starship.toml"
fi
