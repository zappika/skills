#!/bin/bash

# Mac setup script for Sarper
# Run this on a fresh mac to get everything in place
# After this: manually add Vercel MCP in the Claude app

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Adding Homebrew to PATH..."
echo >> /Users/sarper/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> /Users/sarper/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

echo "Installing gh and git..."
brew install gh git

echo "Authenticating GitHub..."
gh auth login

echo "Cloning Skills repo..."
git clone https://github.com/zappika/skills.git ~/Skills

echo "Creating global CLAUDE.md..."
mkdir -p ~/.claude
curl -o ~/.claude/CLAUDE.md https://raw.githubusercontent.com/zappika/skills/main/CLAUDE.md

echo "Installing Vercel plugin..."
npx plugins add vercel/vercel-plugin

echo ""
echo "Done. One manual step remaining:"
echo "Add Vercel MCP in the Claude app settings."
