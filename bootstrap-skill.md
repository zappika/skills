---
name: project-bootstrap
description: Starting a new personal project from zero — creates the right folder structure, CLAUDE.md, GitHub repo, and Vercel connection so every project starts clean and consistent.
---

# Project Bootstrap

Sarp is starting a new personal project. Get it from zero to first deploy with the right structure, no mess.

## The Target Structure

Every project lives at `~/Projects/[project-name]/`. Completely separate from everything else. Never nested inside another project.

```
~/Projects/
  playlists/        ← existing, leave alone
  flashcards/       ← new project, clean start
  wines/            ← another new project, etc.
```

Inside each project:

```
[project-name]/
  CLAUDE.md         ← permanent context for Claude Code (stack, structure, deploy)
  plan.md           ← current build plan (phases, acceptance criteria, decisions)
  README.md         ← what this is
  index.html        ← or whatever the entry point is
  .gitignore        ← always
```

## Steps

**1. Create the folder**
```
mkdir ~/Projects/[project-name]
cd ~/Projects/[project-name]
```

**2. Create CLAUDE.md**
Write it based on what Sarp describes. Keep it short — one paragraph on what the project is, one on the stack, one on how it deploys. This is the file Claude Code reads at the start of every session. It should be honest about what exists, not aspirational. Add a Skills section pointing to `~/Skills/`.

Template:
```
# [Project Name]

[One sentence: what this is and who it's for.]

## Stack
- Frontend: [HTML / Next.js / React Native]
- Data: [JSON file / Supabase / none]
- Deploy: Vercel, connected to GitHub at [repo URL once created]

## Structure
[Brief note on what lives where, once files exist]

## Current state
[What works right now. Update this as the project grows.]

## Skills
See ~/Skills/ for reusable skills including cto-skill.md and bootstrap-skill.md.
```

**3. Create plan.md**
Start it before touching any code. Brainstorm with Sarp what he's building, then write it out in phases. Each phase should be small enough to finish in one session.

Template:
```
# Plan: [Project Name]

## Goal
[One paragraph: what this does and what done looks like.]

## Phase 1: [Name]
- [ ] Task
- [ ] Task
Acceptance criteria: [How to know this phase is complete]

## Phase 2: [Name]
- [ ] Task
- [ ] Task
Acceptance criteria: [How to know this phase is complete]

## Decision log
- [Date]: [Decision made and why]
```

Rules for plan.md:
- Always brainstorm before writing phases — don't skip this
- Phases should cut vertically through the stack (something visible at the end of each phase)
- Update it as decisions get made — it's a living document
- When starting a new Claude Code session, reference plan.md explicitly: "continue from plan.md, we're on Phase 2"

**3. Create .gitignore**
Always include:
```
.DS_Store
node_modules/
.env
.env.local
```

**4. Initialize git and push to GitHub**
```
git init
git add .
git commit -m "initial commit"
```
Then create the repo on GitHub (github.com/new), name it [project-name], and:
```
git remote add origin https://github.com/zappika/[project-name].git
git push -u origin main
```

**5. Connect to Vercel**
- Go to vercel.com
- New Project → Import from GitHub → select the repo
- Default settings are fine for static sites
- Deploy

**6. Confirm the pipe works**
Make a small change, push it, watch Vercel deploy. This is the test. If this works, the project is alive.

## Stack Defaults

Don't ask Sarp to make these decisions unless something specific about the project changes them:

- **Static site (no users):** Plain HTML + Vercel. No framework.
- **App with user accounts:** Next.js + Supabase + Vercel. Supabase handles auth and database.
- **Mobile / App Store:** React Native with Expo. Decide this upfront — it changes everything.
- **Hardware / microcontroller:** Different path entirely, flag it and handle separately.

## What Good Looks Like

At the end of bootstrap, Sarp has:
- A folder at `~/Projects/[project-name]/`
- A `CLAUDE.md` Claude Code can read next session
- A `plan.md` with at least Phase 1 written out before any code is touched
- A GitHub repo with the code in it
- A live URL from Vercel (even if it's just a blank page)

That's it. The project exists. Now build the thing.
