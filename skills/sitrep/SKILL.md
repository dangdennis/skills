---
name: sitrep
description: Quick situation report — recap where we left off, what's in progress, what's uncommitted, and what to do next. Use when resuming a session or asking "where were we?"
allowed-tools: Read, Glob, Grep, Bash, Agent, TaskList
---

# Situation Report

Give a brief, scannable status report for the current session and working directory. Prioritize signal over completeness — skip sections that have nothing to report.

## Gather context

Run these in parallel:

1. `git status` — uncommitted changes, untracked files, current branch
2. `git diff --stat` — what's been modified
3. `git log --oneline -5` — recent commits for context
4. `git stash list` — anything stashed
5. Check for running background tasks (TaskList tool)
6. Scan the conversation history you have in context for what was last discussed

## Report format

Use this structure. **Omit any section that's empty.** Keep each section to 1–3 lines max.

```
## Sitrep

**Branch:** `branch-name` · **Last commit:** `short message`

**In progress:** What we were working on and how far we got.

**Uncommitted changes:** Brief summary of dirty files — group by intent (e.g. "new feature in X, test updates in Y") not just file names.

**Background:** Any tasks/processes still running.

**Todos:** Open tasks from this session (from TaskList or conversation context).

**Gaps:** Things that look unfinished — e.g. TODO/FIXME/HACK added this session, temp debug code, tests that were skipped or commented out, docs not updated to match code changes, half-done refactors.

**Next steps:** 1–3 concrete actions to resume work.
```

## Rules

- Be *brief*. This is a glance, not a report. One sentence per item.
- Don't explain what a sitrep is. Jump straight to the output.
- Don't read file contents unless something looks suspicious in the diff — just use filenames and git output.
- If the session is fresh with no history, say so and summarize repo state instead.
- For gaps, scan `git diff` output for obvious markers: `TODO`, `FIXME`, `HACK`, `console.log`, `debugger`, `binding.pry`, `print(`, commented-out test assertions, `.only` / `.skip` in tests.
