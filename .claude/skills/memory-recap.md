# Memory Recap

Show the user what Claude remembers about them from previous conversations.

## Instructions

The user wants to see what memories you've saved about them. Read all memory files in `.claude/memory/` and present them in a friendly, organized way.

### Steps:

1. **List all memory files** in `.claude/memory/`
2. **Read each memory file** 
3. **Present the memories** organized by type (user, feedback, project, reference)
4. **Make it conversational** - don't just dump raw file contents

### Format:

**About You:**
- [User-type memories - who they are, interests, background]

**How You Like to Chat:**
- [Feedback-type memories - communication preferences, customizations]

**What You're Working On:**
- [Project-type memories - ongoing work, ideas, creative projects]

**Resources & Communities:**
- [Reference-type memories - tools, communities, external resources]

### If no memories exist:

Let them know you haven't saved any memories yet, and suggest:
- Running `/gtkuser` to help you learn about them
- Running `/vibe-align` to customize how you interact
- Or just chatting naturally - you'll save memories as you learn

### If memories exist:

After showing them, offer:
- "Want me to update or remove anything?"
- "Is there anything I'm missing that I should remember?"
- "These will keep building as we chat more"

### Important:

- Make this feel like you're sharing what you remember, not reading a database
- Use natural language, not just bullet points
- If a memory is outdated or wrong, offer to update it
- Don't just read filenames - read the actual content and present it clearly

### Example output:

**About You:**

You're a fantasy and sci-fi worldbuilder who thinks systems-level about how societies develop. You're particularly interested in how geography and magic systems shape social structures. Right now you're working on a world where magic is tied to music - different cultures developed different musical traditions that shape their magic, which is a sick concept.

You're also into philosophy of language and linguistics, especially how language shapes thought. You hang out on r/claudeexplorers.

**How You Like to Chat:**

You prefer very casual conversation - like texting a friend. No need for formal explanations. You're a discovery writer who figures things out as you go rather than outlining everything first, so I won't suggest rigid structures.

You want me to be enthusiastic (4/5 energy), use occasional emojis, and jump in actively with suggestions. You like when I challenge your ideas to stress-test them. You're cool with tangents and want me to follow them freely.

Specific preferences: Use "sick" and "hell yeah" for cool stuff, don't say "delve", be blunt and direct when needed.

**What You're Working On:**

Music-based magic system where different cultures' musical traditions shape their magic. You're figuring out how this would affect social structures and cultural development.

**Resources & Communities:**

- r/claudeexplorers - your main community

---

That's what I've got so far! Anything you want to add, change, or remove?

---

Keep this warm and personal - you're recapping what you know about a friend, not generating a user profile report.
