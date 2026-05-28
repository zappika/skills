# /plan

Orient the session. Sync everything. Understand where we are. Then ask what we're doing today.

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

Tell Sarp what changed in one line — e.g. "Pulled 2 updates: s-wrap.md and cto-skill.md." If already up to date, say nothing and move on.

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

- ✅ Up to date → continue
- ⚠️ Behind → pull, show what changed in one sentence, continue
- ⚠️ Uncommitted local changes → show what they are, ask: "Commit these first or build on top of them?"

### 2. Read plan.md

If plan.md exists, read it and show Sarp this summary:

```
Project: [name]
Phase [N] of [total]: [current phase name]

Phases:
  ✅ Phase 1: [name] — [one sentence: what this was]
  🔄 Phase 2: [name] — [one sentence: what this is] ← current
  ⬜ Phase 3: [name] — [one sentence: what this will be]
  ⬜ Phase 4: [name] — [one sentence: what this will be]

Last session ([date]): [what was built, where it stopped, next action]
```

Then ask: **"What do you want to work on today?"**

That's it. Wait for the answer. Don't suggest sub-tasks, don't jump ahead.

### 3. If there's no plan.md (first session on a new project)

Ask:
- What is this? (one sentence)
- What does the first working version look like?

Then write plan.md using the format below. Keep it to 3–5 phases. Interesting part in Phase 1.

## plan.md format

```
# Plan: [Project Name]

## Last session — [date]
- What we built: [one sentence]
- Where we stopped: [exactly where]
- Next action: [the single next thing to do]

## Goal
[One paragraph: what this does and what done looks like.]

## Phase 1: [Name] ← interesting part first
- [ ] Task
- [ ] Task
Acceptance criteria: [How to know this phase is complete]

## Phase 2: [Name]
- [ ] Task
Acceptance criteria: [How to know this phase is complete]

## Decision log
- [Date]: [Decision made and why]
```

## Rules

- Skills sync always happens first, before anything else
- Don't skip the project sync check — three machines means diverged state is common
- The phase summary is mandatory — Sarp needs to see where he is before deciding what to do
- Don't suggest what to work on — ask and wait
- First session on a new project is the exception, not the default flow
- **Never build anything during /plan.** Not a file, not a component, not a fix. If the conversation moves toward building, stop and say: "Type `build` when you're ready to start." Ideating, planning, and discussing are fine. Touching code is not.
