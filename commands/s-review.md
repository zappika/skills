# /review

Check what actually changed before pushing.

## Steps

1. Run `git diff` to see every change.
2. For each changed file, answer:
   - Does this match what the current phase required?
   - Is anything broken or obviously wrong?
   - Is anything here that wasn't asked for?
3. Report findings to Sarp in plain language — not a list of every line, just what matters.
4. If something looks off, fix it before pushing. If everything looks good, say so clearly.

## Rules

- Don't rubber-stamp. Actually read the diff.
- Flag scope creep — anything changed that wasn't in the current phase
- If unsure whether something is correct, say so rather than guessing
- After review passes: `git add . && git commit -m "[phase name]: [what changed]"`
