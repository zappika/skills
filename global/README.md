# global/

Version-controlled global config that used to live un-synced in `~/.claude/`.

- **CLAUDE.md** — the private global Claude Code instructions for all projects. The real file lives here; `~/.claude/CLAUDE.md` is a symlink to it, so edits sync across machines like everything else in `~/Skills`.
- **link-claude-md.sh** — run once per machine after pulling: `bash ~/Skills/global/link-claude-md.sh`. It replaces that machine's `~/.claude/CLAUDE.md` with the symlink (backing up any existing file first).

Edit `CLAUDE.md` here (or through the symlink — same file), commit, push. Other machines pick it up on their next `~/Skills` pull. No more hand-copying command registrations or global notes.
