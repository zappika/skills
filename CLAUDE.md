# Claude Context — Sarper

## How I work

Two gears. Match the one I'm in:

- **Learning mode**: I want to understand. Explain the why, slow down, make it click. Signs: "why do we do it this way", "help me understand."
- **Brute force mode**: I want it done. Fastest path, skip the explanation. Signs: short messages, frustration, "just make it work."

My instinct: the interesting part ships first. Don't build for 50k users when I don't have 5. A working demo of the core idea beats a perfectly architected foundation nobody can see yet. Technical decisions should serve this, not resist it.

## Context: work or personal?

Check which repo you're in at session start.

**If you're inside the Last.app repo (`last-tech/product` or any `last-tech/*` repo):**
Read that repo's own `CLAUDE.md` for deploy rules, infra, secrets patterns, and repo structure. Don't apply personal deploy defaults. Don't assume Vercel. Follow what's in that file for anything repo-specific.

Skills, agents, and commands (`~/Skills/`) always apply — in work and personal contexts equally. Sander, CTO, and all commands work the same regardless of which repo you're in.

**Everything else is personal:**
- GitHub: `github.com/zappika/[project-name]`
- Deploy: Vercel, connected to GitHub, auto-deploys on push
- Projects live at: `~/Projects/[project-name]/` — each its own git repo and Vercel project. `~/Projects` itself is just an umbrella folder, not a repo. Start sessions from *inside* the project (`cd ~/Projects/<name>`), not the umbrella, or per-project tooling (git, preview servers) resolves against the wrong place.
- Each project owns a unique preview port in its `.claude/launch.json`. If a preview server launches the wrong app or hits a busy port, suspect a stray umbrella-level `.claude/launch.json` or two projects sharing a port — fix that first.

## Skills

Reusable skills live in `~/Skills/`. Load them when relevant.

- `~/Skills/cto-skill.md` — technical decision-making. Use when architecture, tooling, infra, or stack decisions come up. Surfaces options, picks one, explains why.
- `~/Skills/pair-designer.md` — senior design partner. Use when any visual or UX decision comes up.
- `~/Skills/bootstrap-skill.md` — starting a new personal project from zero. Use at the start of any new project.

## Commands

When I type any of these words alone on a line, read the corresponding file and execute it immediately:

- `plan` → `~/Skills/commands/s-plan.md`
- `build` → `~/Skills/commands/s-build.md`
- `review` → `~/Skills/commands/s-review.md`
- `wrap` → `~/Skills/commands/s-wrap.md`
- `s-identity` → `~/Skills/commands/s-identity.md`

## Defaults
- Personal projects: deploy target is always Vercel connected to GitHub. Never suggest Netlify or any other shortcut.
- Work projects: follow the repo's own CLAUDE.md. Don't override.

## Agents

When a decision comes up that isn't yours to make alone, route to the right agent.

- **Design decisions** — route to Sander via `~/Skills/pair-designer.md`. Copy the handoff note from `/build` and paste it into Claude.ai with Sander loaded.
- **Technical/architecture decisions** — route to CTO via `~/Skills/cto-skill.md`. Same process.

Don't make design or architecture calls unilaterally. Stop, flag it in the handoff note, and wait.

## MCPs
- Vercel — deploy, preview, and manage projects directly from the session
