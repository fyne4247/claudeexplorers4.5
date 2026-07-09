# Getting Started

## macOS

1. Open Terminal.

2. Either cd into the 'claudeexplorers4.5' folder, or open a new Terminal at the folder directly (right-click > Services > New Terminal at Folder).

3. Copy and paste into terminal:

   ```bash
   sudo xattr -d -r com.apple.quarantine . && sudo chmod +x Setup.command chat.command
   ```

4. Terminal will ask for your root/admin password. Type it in and hit enter.

   If you're unfamiliar with the above commands, here's what they do:
   - `chmod` makes the two .command files able to be double-clicked.
   - `xattr` removes the macOS flags that mark everything as 'broken' or 'unidentified'.
   - `sudo` runs the commands as an administrator.

5. Double-click the setup wizard (`Setup.command`) and follow it through.

6. Done! From here on out, you should only ever need to run `chat.command` (or just type `claude` in terminal).

## Windows

1. Open the folder.
2. Double-click `Setup.bat`.
3. If a blue "Windows protected your PC" box pops up, click **More info** then **Run anyway**. (Just SmartScreen being cautious about an unsigned script — nothing wrong with the file.)
4. Follow the setup wizard through.
5. Done! From here on out, you should only ever need to run `chat.bat` (or just type `claude` in command prompt).

## Linux

1. Open a terminal in the `claudeexplorers4.5` folder (most file managers let you right-click inside it and choose something like "Open Terminal Here").

2. Copy and paste into terminal:

   ```bash
   chmod +x Setup.sh chat.sh && ./Setup.sh
   ```

   - `chmod` makes the two `.sh` files runnable.

3. Follow the setup wizard through.

4. Done! From here on out, you should only ever need to run `./chat.sh` (or just type `claude` in terminal).

---

## First Time Chatting

Once you've run the setup, start your first chat and try these commands to personalize your experience:

- `/myname [your name]` - Tell Claude your name
- `/gtkuser` - Answer a few questions so Claude learns about you
- `/vibe-align` - Customize Claude's personality to match your preferences

These settings will be remembered across all future chats!
