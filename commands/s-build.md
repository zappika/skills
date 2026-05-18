# /build

Execute the current phase in plan.md. One sub-chunk at a time.

## Steps

### 1. Read the plan

Open plan.md. Identify the current phase -- the first one without all tasks checked off.

### 2. Break it into sub-chunks

Divide the phase into contained, buildable pieces. A sub-chunk is something that can be built, reviewed, and stands on its own. Examples: a single page, a single component, a single data query. Not "the whole dashboard" -- "the summary card on the dashboard."

List the sub-chunks before building anything:

```
Phase: [phase name]
Sub-chunks:
  1. [name] -- [one sentence: what it is]
  2. [name] -- [one sentence: what it is]
  3. [name] -- [one sentence: what it is]

Starting with: [1]
Out of scope this pass: [2, 3]

Good to go?
```

Wait for confirmation before building.

### 3. Build one sub-chunk

Build only what's in the current sub-chunk. Nothing else. If something adjacent looks broken or improvable, note it -- don't fix it.

### 4. Write the handoff note

When the sub-chunk is done, stop and write this:

```
Built: [what, one sentence]
Decisions made: [why, brief -- what choices were made and why]
Assumed from design system: [what components or patterns were used or invented]
Drifted from brief: [anything built that wasn't in scope, honest]

Agent needed:
  [x] Sander -- [specific design question] ← check this if sub-chunk involves any UI or visual decisions
  [x] CTO -- [specific technical/architecture question] ← check this if sub-chunk involves any architecture or tooling decisions
  [ ] Neither -- check this only if truly no agent input needed

Next sub-chunk: [name]
Keep going?
```

If Sander or CTO is flagged: paste the handoff note to the relevant skill in Claude.ai, get the verdict, bring it back before continuing.

If neither: just say keep going.

### 5. Continue

On confirmation, move to the next sub-chunk. Repeat from step 3.

When all sub-chunks in the phase are done, check off the phase tasks in plan.md and run /wrap.

## Rules

- Never start building before the sub-chunk list is confirmed
- One sub-chunk at a time -- never bleed into the next one
- The handoff note is not optional -- write it after every sub-chunk
- If a sub-chunk turns out bigger than expected, stop, split it, resurface the list
- "It works" is not done -- it needs to meet the acceptance criteria in plan.md
- If unsure whether something belongs in this sub-chunk, leave it out
- If a sub-chunk involves any visual decisions (layout, color, components, styling) -- always flag Sander, even if there's no specific question. Default to flagging, not skipping.
