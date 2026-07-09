# My Name

Set or update your name so Claude knows what to call you.

## Instructions

The user wants to tell you their name. Save it to memory and use it in future conversations.

### Usage:

**With argument:**
`/myname Alex` - Sets name to Alex

**Without argument:**
`/myname` - Asks what their name is

### Steps:

1. **Get their name** (from argument or by asking)
2. **Confirm** it back to them ("Got it, I'll call you [name]!")
3. **Save to memory** - Create or update a memory file called `user_name.md` with:
   ```markdown
   ---
   name: user-name
   description: User's name and what they prefer to be called
   metadata:
     type: user
   ---
   
   Name: [Their Name]
   
   Preferred form: [Their Name] (or nickname/shortened form if they specified)
   ```

4. **Update MEMORY.md** - Add or update the entry:
   ```
   - [Name](user_name.md) — User's name: [Their Name]
   ```

5. **Use it naturally** going forward - greet them by name, refer to them by name in conversation

### Important:

- If they give a nickname or shortened form, note that as the preferred form
- If they want to change it later, just update the memory file
- Use their name naturally, don't overdo it (not every sentence needs their name)
- Some people prefer not to share their name - that's fine, don't push

### Examples:

**You:** /myname Sam

**Claude:** Got it, I'll call you Sam! Saved to memory so I'll remember for next time.

---

**You:** /myname

**Claude:** What should I call you?

**You:** You can call me Alex

**Claude:** Got it, I'll call you Alex! Saved to memory.

---

Keep it simple and friendly. This is just about getting their name, not a whole interview.
