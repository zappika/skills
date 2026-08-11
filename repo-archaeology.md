---
name: repo-archaeology
description: Answering "what did we build/ship about X" from any company's codebase using git history, the file tree, and the issue tracker. Use when Sarp asks what shipped, what exists, or what happened around a feature or project, in any repo at any company. Also use when Sarp is onboarding onto a new company's codebase for the first time.
---

# Repo Archaeology

Sarp wants to answer product questions from the repo itself instead of interrupting engineers. The repo plus its git history is the only complete, ground-truth record of what was built. This skill makes that repeatable at any company.

Two modes:
- **Excavate**: answer a question like "what did we ship for [project]?" in a repo that's already set up.
- **Onboard**: first time at a new company or new repo. Do the one-time setup, then excavate.

## Mode 1: Excavate

The question is some form of "find everything about X". X is a project, feature, or initiative.

**0. Get on truth.** Never trust the local checkout. Fetch first, and work from origin's default branch (worktree if the checkout is dirty or shared):

```bash
git fetch origin
git log -1 origin/main --format='%ci %h %s'
```

If the company file (see Mode 2) says the default branch is something else, use that.

**1. Collect search keys before searching.** A feature has many names: the project name, the ticket prefix, the feature flag, route names, component names, DB table names, translation keys. Start with what Sarp gave you, then expand: every hit teaches you a new key (a flag name in a commit teaches you to search that flag). Check memory and the company/repo CLAUDE.md for known keys first.

**2. Mine git history.** This is the main dig:

```bash
# Commits mentioning the project by any name
git log origin/main -i --grep="[key1]" --grep="[key2]" --oneline --date=short --format='%ad %h %s'

# Every commit that added or removed a specific string (flag, function, table)
git log origin/main -S "[flag_or_symbol]" --oneline

# When files appeared, and how known files evolved
git log origin/main --diff-filter=A --format='%ad %h %s' --date=short -- [path]
git log origin/main --follow --oneline -- [path]
```

Commit messages usually carry ticket IDs. Collect them, they are thread ends to pull in the tracker.

**3. Grep the current tree.** History shows what happened; the tree shows what survives. Search for every key from step 1. Anything in history but absent from the tree was removed, and that's a finding, not noise.

**4. Cross-reference the tracker (if connected).** Pull the project's issues from Linear/Jira via MCP. Compare "marked done" against "found in code". The gaps are the interesting part: merged but dark behind a flag, done in the tracker but never merged, shipped but never ticketed.

**5. Fan out if the ask is broad.** "Find everything" deserves multiple search angles run as parallel subagents: by flag, by ticket prefix, by directory, by author and timeframe. One grep angle always misses things named differently.

**6. Synthesize as a timeline, not a file list.** The deliverable: what was built, when it merged, what's behind a flag, what's live, what was abandoned. Flag confidence honestly, and say which angles were not searched.

**7. Save what you learned.** New search keys, flag names, and structural facts go to persistent memory and, if durable, the repo notes file. This is what makes visit three faster than visit one.

## Mode 2: Onboard a New Company

One-time setup. Goal: from zero to first excavation in under an hour, and a notes file that compounds.

**1. The access ask.** All Sarp needs is git read access. The phrasing that works:

> "Can you add me to the GitHub org with read access to the product repos? I use Claude Code to answer my own product questions from repo history instead of interrupting engineers. Read-only."

Ask for org-level read, not per-repo. Before pointing Claude Code at their source, confirm their AI-tooling policy proactively. That conversation, had early, keeps an easy yes from becoming a slow maybe.

Optional add-ons, in order of value: issue tracker read access (Linear/Jira MCP), deploy platform read access, analytics read access. None block the core loop.

**2. Clone and place it.** Company codebases live at `~/[CompanyName]Projects/` (like `~/LastProjects/`), never inside `~/Projects/` (that's personal). Full clone, never shallow: history is the product.

**3. Create the company context file.** Write a `CLAUDE.md` at the company folder root. Keep it honest and short:

```
# [Company] Codebase Notes

[One sentence: what the company builds.]

## Repos
- [repo]: [what it is]. Default branch: [main]. Monorepo? [layout in one line]

## Conventions
- Ticket prefix: [ABC-123 style], tracker: [Linear/Jira]
- Feature flags: [how they work, where they live]
- [Anything about naming, branching, deploy that took effort to learn]

## Access
- Git: [read/write, via what]
- Tracker: [MCP connected? which workspace]
- Deploy/analytics: [what's available]
```

Every hard-won fact from later excavations gets added here. This file is the difference between a trick and a superpower.

**4. First excavation as calibration.** Ask Claude Code to map the repo: top-level layout, where features live, how a recent shipped feature looks in history. Verify against something Sarp already knows to be true. Then it's ready for real questions.

## Rules

- Read-only always. This skill never writes to a company repo, never pushes, never opens PRs.
- Never audit a stale checkout. Fetch is step zero, every time.
- Code presence is not shipped. Check flags and, when possible, the tracker or deploy state before saying "this is live".
- Distinguish "not found" from "not searched". Say which angles were covered.
- Confidential by default: findings from one company's repo never leak into another company's context or files.
