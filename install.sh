#!/bin/bash

echo "🔗 Symlinking dotfiles..."

ln -sf "$PWD/zsh/.zshrc" ~/.zshrc
ln -sf "$PWD/.gitconfig" ~/.gitconfig

echo "🍺 Installing Homebrew packages from Brewfile..."
brew bundle --file="$PWD/Brewfile"

echo "✅ Setup complete."

