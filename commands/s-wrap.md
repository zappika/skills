# /wrap

End-of-session ritual. Run this before closing Claude Code.

## Steps

### 1. Check what changed in the project

```bash
git diff HEAD
git status
```

Read it. Know what you're committing.

### 2. Verify sync state before committing

```bash
git fetch origin
git log HEAD..origin/main --oneline
```

If the remote is ahead: stop. Pull first, resolve anything, then continue.

### 3. Update plan.md

- Check off completed tasks
- Add any decisions made this session to the decision log
- Update the "last session" block at the top:

```
## Last session — [date]
- What we built: [one sentence]
- Where we stopped: [exactly where, specific enough to pick up without thinking]
- Next action: [the single next thing to do, not a list]
```

### 4. Commit and push the project

```bash
git add . && git commit -m "wrap: [one sentence summary]" && git push
```

Confirm the push succeeded. If it fails, pull, resolve, push again.

### 5. Sync skills

Check if any files in `~/Skills/` changed this session (skills, commands, or any other file):

```bash
cd ~/Skills && git status
```

If there are changes, commit and push:
```bash
git add . && git commit -m "skills: [what changed, one sentence]" && git push
```

Show Sarp a one-line diff summary — which files changed. Then confirm pushed.

If nothing changed: say nothing, move on.

### 6. Confirm Vercel deploy (personal projects only)

Check that the latest commit triggered a deployment. If the project isn't connected to Vercel yet, flag it as the next action.

### 7. Machine context note

End every wrap with this one-liner:

```
Wrapped from: [machine — e.g. work MacBook / personal MacBook / iMac]
Project pushed: ✅ [branch and remote]
Skills pushed: ✅ / nothing to push
Safe to pick up from any machine: ✅ / ⚠️ [if anything unresolved]
```

## Rules

- Never commit without reading git status first
- Never close the session with unpushed commits — they're invisible on other machines
- Skills sync is not optional — if you updated a skill during the session, push it
- "Next action" is one thing, not a list
- If the session ended in a broken state, say so explicitly
- This takes five minutes. Don't skip it.
