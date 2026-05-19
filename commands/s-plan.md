# /plan

Brainstorm and write a plan.md before any code is touched.

## Steps

1. Check if plan.md exists in the project root. If it does, read it first -- summarize current state, which phase is active, and ask "Continue from this plan or start fresh?" before doing anything else.
2. Ask Sarp what he's trying to build. One question: "What does done look like?"
3. Identify the thinnest vertical slice that shows something real — not infrastructure, not login screens, the interesting part first.
4. Break it into phases. Each phase ends with something visible or testable. Maximum 3-5 phases to start.
5. Write plan.md in the project root.

## plan.md format

```
# Plan: [Project Name]

## Goal
[One paragraph: what this does and what done looks like.]
**Progress:** `0%`


## Phase 1: [Name] ← start here, the interesting part
- [ ] 🟥 Task
- [ ] 🟥 Task
Acceptance criteria: [How to know this phase is complete]

## Phase 2: [Name]
- [ ] 🟥 Task
- [ ] 🟥 Task
Acceptance criteria: [How to know this phase is complete]

## Decision log
- [Date]: [Decision made and why]
```

## Rules

- The interesting part goes in Phase 1, not the plumbing
- Don't start Phase 2 until Phase 1 acceptance criteria are met
- Update the decision log whenever a significant choice is made
- If scope creep appears mid-build, add it as a future phase — don't fold it in
- Update task emojis as you go: 🟥 to do, 🟨 in progress, 🟩 done. Update the Progress percentage when a phase completes.
