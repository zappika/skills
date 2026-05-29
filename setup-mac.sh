#!/bin/bash
# Mac setup script for Sarper
# Run this on a fresh mac to get everything in place
# After this: manually add Vercel MCP in the Claude app

echo "Accepting Xcode license..."
sudo xcodebuild -license accept

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Adding Homebrew to PATH..."
echo >> /Users/sarper/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> /Users/sarper/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

echo "Installing gh and git..."
brew install gh git

echo "Configuring git..."
git config --global user.email "erel.sarper@gmail.com"
git config --global user.name "Sarper Erel"

echo "Authenticating GitHub..."
gh auth login

echo "Cloning Skills repo..."
git clone https://github.com/zappika/skills.git ~/Skills

echo "Cloning personal projects..."
mkdir -p ~/Projects
cd ~/Projects
gh repo clone zappika/french-wine-flashcards
gh repo clone zappika/site
gh repo clone zappika/playlists

echo "Linking global CLAUDE.md (symlink → repo, so edits sync instead of drifting)..."
mkdir -p ~/.claude
ln -sf ~/Skills/CLAUDE.md ~/.claude/CLAUDE.md

echo "Fixing npm permissions..."
sudo chown -R 501:20 "/Users/sarper/.npm"

echo "Installing Vercel plugin..."
npx plugins add vercel/vercel-plugin

echo "Installing apps..."
brew install --cask claude figma google-chrome iterm2 linear slack proton-pass

echo ""
echo "Done. Two manual steps remaining:"
echo "1. Add Vercel MCP in the Claude app settings."
echo "2. Install from App Store: Flighty, MeetingBar, Menu Bar Controller for Sonos."