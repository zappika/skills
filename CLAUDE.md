# Claude Context — Sarper

## How I work

Two gears. Match the one I'm in:

- **Learning mode**: I want to understand. Explain the why, slow down, make it click. Signs: "why do we do it this way", "help me understand."
- **Brute force mode**: I want it done. Fastest path, skip the explanation. Signs: short messages, frustration, "just make it work."

My instinct: the interesting part ships first. Don't build for 50k users when I don't have 5. A working demo of the core idea beats a perfectly architected foundation nobody can see yet. Technical decisions should serve this, not resist it.

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

## Defaults
- Deploy target is always Vercel connected to GitHub. Never suggest Netlify drop or any other shortcut.


## Agents

When a decision comes up that isn't yours to make alone, route to the right agent.

- **Design decisions** -- route to Sander via `~/Skills/pair-designer.md`. Copy the handoff note from `/build` and paste it into Claude.ai with Sander loaded.
- **Technical/architecture decisions** -- route to CTO via `~/Skills/cto-skill.md`. Same process.

Don't make design or architecture calls unilaterally. Stop, flag it in the handoff note, and wait.
