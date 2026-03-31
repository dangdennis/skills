---
name: bug
description: Add a new bug or todo to the project's tracker (alias for /todo)
argument-hint: <description of the bug or task>
---

# Add Bug / Todo

This is an alias for `/todo`. See the todo skill for full documentation.

Add a well-written bug or task to the project's tracker. Takes a short description, enriches it with codebase context, assigns an appropriate priority, and commits.

## How to Invoke

```
/bug the file tree flickers on resize
/todo add support for multiple cursors
```

The argument is a rough description. You will enrich it into a proper bug entry.

---

## Step 1: Find the Tracker

Locate the project's bug/todo tracker. Check in order:

1. **Local files**: Look for `bugs.md`, `BUGS.md`, `TODO.md`, `todo.md`, `ISSUES.md`, or similar in the repo root and `docs/` directory
2. **Project instructions**: Read `CLAUDE.md`, `CONTRIBUTING.md`, `README.md` for pointers to where bugs are tracked
3. **GitHub Issues**: Run `gh issue list --state open --limit 5` to check if the project uses GitHub Issues

If no tracker is found, ask the user where to put it.

Remember which tracker type you found (file or GitHub Issues) for Step 4.

---

## Step 2: Read the Tracker

Read the existing tracker to understand:
- **Format**: How are entries structured? What fields are used? (priority, status, tags, etc.)
- **Conventions**: How are entries written? What tone, level of detail, formatting?
- **Priority scheme**: What priority levels exist? (P0-P3, critical/high/medium/low, etc.)
- **Sections**: Is the file organized into sections? Where should the new entry go?

Match the existing style exactly. Do not invent new formatting.

---

## Step 3: Write the Entry

Take the user's rough description and write a proper tracker entry:

1. **Understand the issue**: Use Grep/Glob/Read to find the relevant code. Understand what the user is describing — find the actual file, function, or behavior involved.

2. **Assign priority**: Based on impact and the project's priority scheme:
   - **P0**: Data loss, crash, fundamentally broken core functionality
   - **P1**: Significant usability issue, feature doesn't work as expected
   - **P2**: Polish — inconsistency, visual glitch, minor misbehavior
   - **P3**: Cosmetic, edge case, nice-to-have improvement

   When in doubt, lean toward the higher priority (more severe). Users report things because they matter to them.

3. **Write clearly**: The entry should include:
   - A concise title that describes the problem or desired behavior
   - Enough context for someone unfamiliar to understand the issue
   - Specific file/function references if you found relevant code
   - Expected vs actual behavior for bugs
   - Do NOT include a fix or solution — just describe the problem

4. **Match format**: Use the exact same markdown structure, heading level, and field names as existing entries in the tracker.

---

## Step 4: Save and Commit

### If file-based tracker:

1. Append the new entry to the appropriate section of the file
2. Stage ONLY the tracker file (not other uncommitted changes):
   ```
   git add bugs.md   # or whatever the file is
   ```
3. Commit with a clear message:
   ```
   git commit -m "Add P2 bug: <short description>"
   ```
4. Push:
   ```
   git push
   ```

### If GitHub Issues:

1. Create the issue using `gh issue create`:
   ```
   gh issue create --title "<title>" --body "<body>"
   ```
2. Apply appropriate labels if the project uses them

---

## Step 5: Confirm

Tell the user:
- What was added (show the entry)
- What priority was assigned and why
- Where it was added (file + section, or GitHub issue URL)

---

## Guidelines

- **Don't over-write.** A bug entry is 2-5 lines, not an essay. Match the project's existing verbosity level.
- **Don't diagnose.** Describe the problem, not the solution. Leave root cause analysis for when the bug is being fixed.
- **Don't duplicate.** Scan existing entries to make sure this isn't already tracked. If it is, tell the user and point them to the existing entry.
- **Feature vs bug.** If the user describes a new feature rather than a bug, that's fine — add it under the appropriate section (many trackers have a "Feature requests" section). Adjust the title accordingly.
- **Priority is a judgment call.** If the user says "this is critical" or "minor thing", respect their assessment. Otherwise, use your best judgment based on impact.
