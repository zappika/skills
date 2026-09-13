# /plan

Orient the session. Sync everything. Understand where we are. Then ask what we're doing today.

## Why this exists

Hygiene, not ritual. The point is that the next session — on any machine, after
any gap — can continue without re-deriving anything. Three artifacts carry that:

- `plan.md` — Last session block, Waiting on Sarp, phases, dated decisions (rejections too)
- the project's `CLAUDE.md` — how to run it, how the pieces fit, gotchas that cost time, data operations
- commit messages whose body says *why*

If those are current, the command did its job even when nobody typed it. If a
command was typed but they're stale, it didn't.

## Steps

### 0. Sync skills first

Before anything else, update the skills repo:

```bash
cd ~/Skills && git fetch origin
```

If the remote is ahead, pull and report:
```bash
git pull origin main
git diff HEAD~1 --name-only
```

Tell Sarp what changed in one line. e.g. "Pulled 2 updates: s-wrap.md and cto-skill.md." If already up to date, say nothing and move on.

Then check if local skills have unpushed changes:
```bash
git status
```

If there are uncommitted changes in `~/Skills/`, commit and push them:
```bash
git add . && git commit -m "skills: sync from [machine name]" && git push
```

Tell Sarp: "Pushed local skills changes from this machine." Then move on.

### 1. Sync the project

```bash
git fetch origin
git log HEAD..origin/main --oneline
```

- Up to date: continue
- Behind: pull, show what changed in one sentence, continue
- Uncommitted local changes: show what they are, ask: "Commit these first or build on top of them?"

### 1.5 Environment check (native projects)

If the repo has an `ios/` folder, check the machine before anything else:

```bash
df -h /System/Volumes/Data | tail -1
xcrun simctl list devices booted | grep -c Booted
which xcodegen
```

- Under ~10 GB free: say so now. Xcode builds, DerivedData and a second simulator
  eat gigabytes, and a full disk kills the session mid-build (it happened on Pinsta).
- No simulator booted: boot the project's device before /build.
- Missing xcodegen: `brew install xcodegen`.

### 2. Read plan.md and check Linear

If plan.md exists, read it (and the project `CLAUDE.md` if present) and show Sarp this summary:

```
Project: [name]
Phase [N] of [total]: [current phase name]

Phases:
  Phase 1: [name] — [one sentence: what this was] ✅
  Phase 2: [name] — [one sentence: what this is] ← current
  Phase 3: [name] — [one sentence: what this will be]
  Phase 4: [name] — [one sentence: what this will be]

Last session ([date]): [what was built, where it stopped, next action]
Waiting on Sarp: [the open asks, one line each — icon, account, decision…]
```

Then check Linear for the active issue on this project:

```
Active issue: [SAR-N] [title]: [one sentence from description]
```

If no Linear project exists for this repo, skip silently.

Then ask: **"What do you want to work on today?"**

Wait for the answer. Don't suggest sub-tasks, don't jump ahead.

### 3. If there's no plan.md (first session on a new project)

Ask:
- What is this? (one sentence)
- What does the first working version look like?

Then write plan.md using the format below. Keep it to 3–5 phases. Interesting part in Phase 1.

Also start the project's `CLAUDE.md` with four headings, filled in as things become true:
`## Run it` · `## How the pieces fit` · `## Gotchas that cost time` · `## Data operations`.
Claude Code reads it automatically, so every later session starts knowing how to run the thing.

## plan.md format

```
# Plan: [Project Name]

## Last session — [date]
- What we built: [one sentence]
- Where we stopped: [exactly where]
- Next action: [the single next thing to do]

## Goal
[One paragraph: what this does and what done looks like.]

## Phase 1: [Name] — interesting part first
- [ ] Task
- [ ] Task
Acceptance criteria: [How to know this phase is complete]

## Phase 2: [Name]
- [ ] Task
Acceptance criteria: [How to know this phase is complete]

## Waiting on Sarp
- [Thing only Sarp can provide or decide, and what it unblocks]

## Decisions log
- [Date]: [Decision made and why]
- [Date]: Rejected [option] because [why] — rejections are decisions too
```

## Rules

- Skills sync always happens first, before anything else
- Don't skip the project sync check. Three machines means diverged state is common
- The phase summary is mandatory. Sarp needs to see where he is before deciding what to do
- Don't suggest what to work on. Ask and wait
- First session on a new project is the exception, not the default flow
- Match the gear. Brute-force mode (short messages, "just do it"): the summary is five lines, not a page. Learning mode: explain the why.
- Never build anything during /plan. Not a file, not a component, not a fix. If the conversation moves toward building, stop and say: "Type `build` when you're ready to start." Ideating, planning, and discussing are fine. Touching code is not.
