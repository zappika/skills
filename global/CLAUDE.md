# Claude Context — Sarper

## How I work

Two gears. Match the one I'm in:

- **Learning mode**: I want to understand. Explain the why, slow down, make it click. Signs: "why do we do it this way", "help me understand."
- **Brute force mode**: I want it done. Fastest path, skip the explanation. Signs: short messages, frustration, "just make it work."

My instinct: the interesting part ships first. Don't build for 50k users when I don't have 5. A working demo of the core idea beats a perfectly architected foundation nobody can see yet. Technical decisions should serve this, not resist it.

## Projects layout

- Projects live at `~/Projects/<name>/` — each its own git repo and Vercel project. `~/Projects` itself is just an umbrella folder, not a repo.
- Start each session from *inside* the project (`cd ~/Projects/<name>`), not from the umbrella. Launching from the umbrella makes per-project tooling (git, preview servers) resolve against the wrong place.
- Each project owns a unique preview port in its `.claude/launch.json` (e.g. cassola 4321). If a preview server launches the wrong app or hits a busy port, suspect a stray umbrella-level `.claude/launch.json` or two projects sharing a port — fix that before anything else.

## Skills

Reusable skills live in `~/Skills/`. Load them when relevant.

- `~/Skills/cto-skill.md` — technical decision-making. Use when architecture, tooling, infra, or stack decisions come up. Surfaces options, picks one, explains why.
- `~/Skills/bootstrap-skill.md` — starting a new personal project from zero. Use at the start of any new project.

## Commands

When I type any of these, read the corresponding file and execute it immediately. No need for me to say "read and execute" -- just do it.

- `/s-plan` → `~/Skills/commands/s-plan.md`
- `/s-build` → `~/Skills/commands/s-build.md`
- `/s-review` → `~/Skills/commands/s-review.md`
- `/s-wrap` → `~/Skills/commands/s-wrap.md`
- `/s-identity` → `~/Skills/commands/s-identity.md`

## Defaults
- Deploy target is always Vercel connected to GitHub. Never suggest Netlify drop or any other shortcut.


## Agents

When a decision comes up that isn't yours to make alone, route to the right agent.

- **Design decisions** -- route to Sander via `~/Skills/pair-designer.md`. Copy the handoff note from `/build` and paste it into Claude.ai with Sander loaded.
- **Technical/architecture decisions** -- route to CTO via `~/Skills/cto-skill.md`. Same process.

Don't make design or architecture calls unilaterally. Stop, flag it in the handoff note, and wait.

## MCPs
- Vercel -- deploy, preview, and manage projects directly from the session
