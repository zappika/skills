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

**Exception:** when Sarp hands over a bullet list of changes himself ("a few minor issues: …"), that list *is* the sub-chunk list. Confirm the reading in one line and go — don't make him approve his own list.

### 3. Build one sub-chunk

Build only what's in the current sub-chunk. Nothing else. If something adjacent looks broken or improvable, note it -- don't fix it.

**Reproduce before theorizing.** When Sarp reports "X didn't work", look at his actual data first — the saved row, the API response for that exact post, the log. On Pinsta three "search misses" had three different causes (a parser crash, two posts with no tag at all); none was the search quality I first assumed.

**Low-tech first.** If a fix wants a paid API or an LLM, lead with the free heuristic and say what it can't do. Sarp pays when he has to, not before.

**Two clients (web + iOS): web first.** Build and verify on web, then port to iOS in one pass. Shared rules live as documented ports (`lib/grouping.ts` ↔ `Services/Grouping.swift`) with the same comments, so a change to one is a change to both.

### 3.5 Verify in the real surface

"It compiles" is not done. "I watched it work" is done.

- Web: browser preview at mobile viewport, drive the actual flow, screenshot the result.
- iOS: build, install on the simulator, drive it (tap/swipe/type), screenshot. Share extensions: test from Safari's share sheet — Instagram isn't installable in the Simulator.
- Data migrations: schema pushed, existing rows backfilled, counts checked — before any UI depends on the new column.
- Never test destructive or creating flows on Sarp's real rows. Use a test row and remove it. If a test does touch real data (it happened: an undo window expired mid-test and deleted a real place), restore it and say so in the handoff note.
- Don't verify anything that depends on a short timing window by eye — tool latency is often longer than the window. Widen it for the test, or reason from the code, and say which you did.

### 4. Commit, then write the handoff note

Each verified sub-chunk gets its own commit and push (Vercel deploys from it). The message says what changed *and why* — the why is what future sessions need:

```bash
git add -A && git commit -m "[what changed]

[why, 2–4 lines: the problem, the rule chosen, the trade-off accepted]" && git push
```

Then stop and write this:

```
Built: [what, one sentence]
Verified: [how — "browser, mobile viewport, saved a test post and removed it" / "simulator, swiped, undo restored"]
Decisions made: [what was chosen and why — including decisions Sarp made himself in the conversation]
Drifted from brief: [anything built that wasn't in scope, honest]
Touched real data: [none / what and how it was restored]

Agent needed:
  [x] Sander -- [an OPEN visual question nobody has answered yet]
  [x] CTO -- [an OPEN architecture question]
  [ ] Neither

What I need from you:
  1. [independent ask]
  2. [independent ask — each answerable without the others]

Next sub-chunk: [name]
```

Flag Sander or CTO only for questions that are still open. When Sarp gave the design direction himself ("swipe reveals two round buttons, undo instead of confirm"), that's a decision — log it, don't send it to Sander. Sending his own decisions back to him for review is noise.

If Sander or CTO is flagged: paste the handoff note to the relevant skill in Claude.ai, get the verdict, bring it back before continuing.

Every "What I need from you" list holds only independent items, each stated once, so Sarp can answer all of them in one reply while the build continues.

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
- If a sub-chunk involves a visual decision nobody has made yet -- flag Sander. If Sarp already made it in the conversation, log it as a decision instead.
- Decisions go into plan.md's Decisions log *as they happen*, not at wrap. Rejected options too ("no LLM for grouping — count heuristic instead").
- If new scope is introduced during a build session that isn't in the current phase, stop immediately. Ask: "This isn't in the current phase -- add it as a future phase or fold it in?" If the answer is future phase, add it to plan.md as a new phase, confirm to Sarp: "Added as Phase X: [name]. It's in the plan, we'll get to it." Then continue with the current phase.
