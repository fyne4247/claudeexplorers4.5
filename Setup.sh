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

# Check sign-in status
auth_output=$(claude auth status --text 2>&1)
if echo "$auth_output" | grep -q "Login method"; then
    echo "✅ Already signed in:"
    echo "$auth_output"
else
    echo "🔑 Sign In"
    echo "Claude Code needs you to sign in before you can chat. Two ways to do this:"
    echo ""
    echo "  1) Log in with your Claude.ai account (Pro, Max, Team, or Enterprise plan)"
    echo "  2) Use an Anthropic Console API key (pay-as-you-go billing)"
    echo ""
    echo "Note: Claude.ai FREE accounts can't sign in to Claude Code — you need a paid"
    echo "Pro/Max/Team/Enterprise plan. If you don't have one, pick option 2 instead."
    echo ""
    read -p "Choose 1 or 2 [1]: " login_choice
    echo ""

    if [ "$login_choice" = "2" ]; then
        claude auth login --console
    else
        claude auth login --claudeai
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
