# /wrap

End-of-session ritual. Run this before closing Claude Code.

## Steps

1. Run `git diff HEAD` and `git status` to see what changed this session.
2. Check plan.md — which tasks got completed? Which are still open?
3. Update plan.md: check off completed tasks, add any new decisions to the decision log.
4. Write a "where we left off" block at the top of plan.md:

```
## Last session — [date]
- What we built: [one sentence]
- Where we stopped: [exactly where, specific enough to pick up without thinking]
- Next action: [the single next thing to do, not a list]
```

5. Commit everything including the updated plan.md:
   `git add . && git commit -m "wrap: [one sentence summary]" && git push`

6. Confirm deploy: check the project's CLAUDE.md for how it deploys. If it mentions AWS/EKS/GitHub Actions, verify the deploy workflow ran on GitHub Actions. If it mentions Vercel (or doesn't specify), check that the latest commit triggered a Vercel deployment. If deploy isn't set up yet, flag it as the next action.

## Rules

- "Next action" is one thing, not a list. The most important next thing.
- If the session ended in a broken state, say so explicitly — don't hide it
- If a decision was made during the session that isn't in the decision log, add it now
- This takes five minutes. Don't skip it.
