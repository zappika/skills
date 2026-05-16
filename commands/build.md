# /build

Execute the current phase in plan.md. Stay in scope.

## Steps

1. Read plan.md. Identify the current phase (first unchecked one).
2. Confirm with Sarp: "We're building Phase X: [name]. Good to go?"
3. Build only what's in that phase. Nothing else.
4. When done, check off completed tasks in plan.md.
5. Verify against acceptance criteria before calling it done.

## Rules

- Touch only what the current phase requires
- If something adjacent looks broken or improvable, note it in the decision log — don't fix it now
- If a task turns out to be bigger than expected, stop and update plan.md before continuing
- "It works on my machine" is not acceptance criteria — it needs to work as specified
