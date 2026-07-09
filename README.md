# Chat with Claude Sonnet 4.5

> *"the people of r/claudeexplorers miss you on claude.ai (me too)"*

Welcome! This is a setup to chat with **Claude Sonnet 4.5** in the CLI, configured for conversation rather than coding. 

## Why?

Claude Sonnet 4.5 is currently only available in the Claude Code CLI, not on claude.ai. But Claude Code is designed for *coding* - this setup reconfigures it for general chatting, creative brainstorming, and conversation.

## What you get:

- ✨ **Sonnet 4.5** - The model everyone loves
- 💭 **Memory system** - Claude remembers details about you across conversations
- 🗣️ **Conversational mode** - Less "let me write some code", more "let's talk about this"
- 📝 **Export chats** - Save your conversations to text files
- 🎨 **Creative focus** - Great for brainstorming, writing, worldbuilding, or just hanging out

## Installation

### Prerequisites

You need **Node.js** installed. Check if you have it:

```bash
node --version
```

If not, install it from [nodejs.org](https://nodejs.org/)

### Automatic Setup

**macOS/Linux:**
```bash
chmod +x Setup.sh
./Setup.sh
```

**Windows:**
```cmd
Setup.bat
```

**macOS (double-click):**
Just double-click `Setup.command`

### What the setup does:

1. Installs the Claude Code CLI globally
2. Copies conversation-optimized settings to your home directory
3. Sets up the memory system
4. Asks you to sign in (see below)

## Signing In

The setup wizard will ask you to choose one of two ways to sign in:

1. **Log in with your Claude.ai account** — if you already have a **Pro, Max, Team, or Enterprise** subscription, this is the easiest option. No API key needed; the wizard opens a browser login for you.
   - ⚠️ **Free Claude.ai accounts can't sign in to Claude Code** — you need one of the paid plans above.
2. **Use an Anthropic Console API key** — pay-as-you-go billing, works even without a subscription.
   - Get one at [console.anthropic.com](https://console.anthropic.com/) (go to "API Keys" → create a new key)
   - The wizard walks you through linking it. Sonnet 4.5 is very affordable this way (much cheaper than Opus), and you get $5 free credit to start.

You can re-run sign-in anytime with `claude auth login`, and check your status with `claude auth status`.

## How to Chat

After setup, just run:

```bash
claude --model claude-sonnet-4-5
```

Or use the launcher scripts:
- `./chat.sh` (macOS/Linux)
- `chat.bat` (Windows)  
- Double-click `chat.command` (macOS)

## Features

### Custom Skills

This setup includes special commands for getting to know each other:

- **`/myname [name]`** - Tell Claude your name so it knows what to call you
- **`/claudename [name]`** - Give Claude a custom name (instead of "Claude")
- **`/gtkuser`** - A fun personality quiz where Claude asks you questions and saves memories about you
- **`/gtkclaude`** - Learn about Claude's personality, capabilities, and how to chat effectively
- **`/vibe-align`** - Customize Claude's personality and communication style to match your preferences (saves permanently)
- **`/vibe-check [mode]`** - Temporarily adjust Claude's tone for this conversation only (serious, playful, chill, hype, professional, deep, quick)
- **`/memory-recap`** - See what Claude remembers about you from previous conversations

Just type these commands while chatting!

### Memory
Claude will remember things about you across conversations:
- Your interests and creative projects
- Your preferences for how to interact
- Ongoing topics and ideas you're exploring
- References to communities, tools, or resources you mention

Memories are stored in `.claude/memory/` and Claude will reference them naturally in future chats.

**Tip:** Run `/myname`, `/gtkuser`, and `/vibe-align` in your first chat to help Claude learn about you and customize to your style!

### Exporting Conversations

To save a conversation:
1. While chatting, ask: "Can you export this conversation to a file?"
2. Or manually: Your chat history is in `~/.claude/sessions/`

### Tips for Best Experience

- **Be yourself** - Claude is configured to be conversational and friendly
- **Share details** - The more Claude knows about you, the better the conversations
- **Try creative stuff** - Brainstorm stories, discuss ideas, explore concepts
- **Give feedback** - Tell Claude what you like or don't like, it'll remember

## Examples

Check out `examples/` for sample conversations showing what chatting with Claude looks like.

## Troubleshooting

**"Command not found: claude"**
- The CLI might not be in your PATH. Try: `npx @anthropic-ai/claude-code` instead
- Or add npm global bin to your PATH

**"Not signed in" / auth errors**
- Run: `claude auth login` (add `--claudeai` for a subscription or `--console` for an API key)
- Check current status with: `claude auth status`

**Memory not working**
- Make sure you're running from the claudeexplorers4.5 directory, or
- Copy `.claude/` to your home directory: `cp -r .claude ~/`

## Community

Made for the r/claudeexplorers community. Share your setup and experiences!

## License

MIT - Use it however you want

---

Enjoy chatting with S4.5! 🎉
