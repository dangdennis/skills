# Skills

A collection of custom Claude Code skills.

## Installation

### Option 1: Global install (recommended)

Symlinks skills into `~/.claude/skills/` so they're available as `/skill-name` in every project, on every machine.

```bash
git clone https://github.com/joewalnes/skills.git
cd skills
make install
```

Skills are symlinked, not copied — edits made by Claude in any project write back to this repo, making it easy to commit and push upstream.

To remove:

```bash
make uninstall
```

### Option 2: Plugin install (namespaced)

Install as a Claude Code plugin. Skills are available as `/skills:skill-name`.

```
/plugin install https://github.com/joewalnes/skills
```

### Other commands

```bash
make list       # Show available skills and install status
```

## Skills

| Skill | Description |
|-------|-------------|
| `hello-world` | A simple test greeting skill |
| `sitrep` | Quick situation report — recap progress, uncommitted work, gaps, and next steps |

## Development

Test locally:

```bash
claude --plugin-dir .
```

## License

MIT
