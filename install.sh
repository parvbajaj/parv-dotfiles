#!/bin/bash

echo "🔗 Symlinking dotfiles..."

ln -sf "$PWD/zsh/.zshrc" ~/.zshrc
ln -sf "$PWD/.gitconfig" ~/.gitconfig

echo "🍺 Installing Homebrew packages from Brewfile..."
brew bundle --file="$PWD/Brewfile"

echo "⚙️ Setting up Git global config..."

git_user=$(git config --file "$PWD/.gitconfig" user.name)
git_email=$(git config --file "$PWD/.gitconfig" user.email)

if [ -n "$git_user" ]; then
  git config --global user.name "$git_user"
  echo "Set git user.name to $git_user"
fi

if [ -n "$git_email" ]; then
  git config --global user.email "$git_email"
  echo "Set git user.email to $git_email"
fi

echo "✅ Setup complete."

