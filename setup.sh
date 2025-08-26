#!/bin/bash

# Install Oh My Zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Installing starship https://starship.rs
if [ ! -d "$HOME/.config/starship" ]; then
    echo "Installing starship..."
    curl -sS https://starship.rs/install.sh | sh
fi 

# Stow - Symlinking all dotfiles
stow .
echo "All done! 💻"
