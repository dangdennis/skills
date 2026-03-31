---
name: readme
description: Generate or update project README documentation
argument-hint: [section to focus on]
---

Generate a high-quality project README.md.

Read the codebase to understand what the project does, who it's for, and how it works. Then write a README with these sections:

1. **Title + tagline**: Project name and a one-line description
2. **Who this is for**: 1-2 sentences explaining the target audience and how this tool helps them
3. **10-second tutorial**: A few shell snippets showing real usage examples that give the reader a quick feel for the tool's capabilities and interface. Use realistic-looking output. Keep it concise — the reader should "get it" in 10 seconds.
4. **Quick install**: The fastest way to get the tool (e.g. homebrew, cargo install, download binary)
5. **Features**: A scannable list of key features/capabilities
6. **Building from source**: How to clone, build, and run tests
7. **Author / License**: Author name and license. If unknown, ask the user before writing.

Style guidelines:
- Keep it concise and scannable — no walls of text
- Use code blocks with shell examples, not prose descriptions
- Don't oversell — let the examples speak for themselves
- No badges, no emojis unless the project already uses them
