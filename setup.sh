#!/bin/bash
# Install Oh My Zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..." 
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH/plugins/zsh-autosuggestions
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH/plugins/zsh-autocomplete
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
fi

# Installing starship https://starship.rs
if [ ! -d "$HOME/.config/starship" ]; then
    echo "Installing starship..."
    curl -sS https://starship.rs/install.sh | sh
fi 

# Installing dashfy - https://github.com/henriquehorbovyi/dashfy
if [ ! -d "$HOME/.config/dashfy" ]; then
    echo "Installing dashfy..."
    git clone https://github.com/henriquehorbovyi/dashfy "$HOME/dotfiles/.config/dashfy"
fi

# Install Zsh if not present
if [ ! -f "$HOME/.zshrc" ]; then 
    echo "Please, install zsh"
fi

# Stow - Symlinking all dotfiles
stow . --adopt
echo "All done! 💻"
