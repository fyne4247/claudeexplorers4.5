#!/bin/bash

echo "========================================"
echo "  Chat with Claude Sonnet 4.5 - Setup  "
echo "========================================"
echo ""

# Check for Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed."
    echo "Please install it from https://nodejs.org/ and run this script again."
    exit 1
fi

echo "✅ Node.js found: $(node --version)"
echo ""

# Check if Claude Code CLI is already installed
if command -v claude &> /dev/null; then
    echo "✅ Claude Code CLI is already installed"
else
    echo "📦 Installing Claude Code CLI..."
    npm install -g @anthropic-ai/claude-code

    if [ $? -ne 0 ]; then
        echo "❌ Failed to install Claude Code CLI"
        echo "Try running: sudo npm install -g @anthropic-ai/claude-code"
        exit 1
    fi

    echo "✅ Claude Code CLI installed successfully"
fi

echo ""

# Create global .claude directory if it doesn't exist
mkdir -p ~/.claude

# Copy CLAUDE.md to home directory for global access
echo "📝 Setting up conversational configuration..."
cp CLAUDE.md ~/.claude/CLAUDE.md

# Copy settings
mkdir -p ~/.claude
cp .claude/settings.json ~/.claude/settings.json 2>/dev/null || true

# Create memory directory
mkdir -p ~/.claude/memory

echo "✅ Configuration copied to ~/.claude/"
echo ""

# Check for API key
if claude config get apiKey &> /dev/null; then
    echo "✅ API key is already configured"
else
    echo "🔑 API Key Setup"
    echo "You need an Anthropic API key to use Claude."
    echo "Get one at: https://console.anthropic.com/"
    echo ""
    read -p "Enter your API key (or press Enter to skip): " api_key

    if [ ! -z "$api_key" ]; then
        claude config set apiKey "$api_key"
        echo "✅ API key configured"
    else
        echo "⏭️  Skipped API key setup. You can set it later with:"
        echo "   claude config set apiKey YOUR_KEY_HERE"
    fi
fi

echo ""
echo "========================================"
echo "  Setup Complete! 🎉"
echo "========================================"
echo ""
echo "To start chatting, run:"
echo "  claude --model claude-sonnet-4-5"
echo ""
echo "Or use the launcher:"
echo "  ./chat.sh"
echo ""
echo "Tip: Claude will remember details about you across"
echo "conversations thanks to the built-in memory system!"
echo ""
