# /review

Check what actually changed before pushing — and that the notes (plan.md, project CLAUDE.md) moved with the code. Also the checklist /build runs at the end of every sub-chunk — standalone /review is for when a session built without the ritual.

## Steps

1. Run `git diff` (or `git log origin/main..HEAD --stat` if commits already exist) to see every change.
2. For each changed file, answer:
   - Does this match what the current phase required?
   - Is anything broken or obviously wrong?
   - Is anything here that wasn't asked for?
3. Run the gates:
   - Type-check / build passes (`npx tsc --noEmit`; `xcodebuild … build` for iOS).
   - The change was verified in the real surface (browser preview or simulator), not just compiled.
   - No test data left behind in Sarp's real database; anything touched is restored.
   - Schema changes: pushed *and* backfilled, counts checked.
   - Web + iOS: if a shared rule changed on one side, the other side changed too (or the port is a listed next action).
   - Notes moved with the code: new decision → plan.md; new gotcha/script/run step → project CLAUDE.md.
4. Report findings to Sarp in plain language — not a list of every line, just what matters.
5. If something looks off, fix it before pushing. If everything looks good, say so clearly.

## Rules

- Don't rubber-stamp. Actually read the diff.
- Flag scope creep — anything changed that wasn't in the current phase
- If unsure whether something is correct, say so rather than guessing
- After review passes: `git add -A && git commit -m "[what changed]\n\n[why]" && git push`. One verified chunk per commit; the why in the body.
