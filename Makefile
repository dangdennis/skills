SKILLS_DIR := $(CURDIR)/skills
TARGET_DIR := $(HOME)/.claude/skills

SKILL_DIRS := $(wildcard $(SKILLS_DIR)/*)

.PHONY: install uninstall list

install:
	@mkdir -p "$(TARGET_DIR)"
	@for skill in $(SKILL_DIRS); do \
		name=$$(basename "$$skill"); \
		target="$(TARGET_DIR)/$$name"; \
		if [ -L "$$target" ] && [ "$$(readlink "$$target")" = "$$skill" ]; then \
			echo "  ok  $$name (already linked)"; \
		elif [ -e "$$target" ]; then \
			echo "  SKIP  $$name — already exists at $$target (not overwriting)"; \
		else \
			ln -s "$$skill" "$$target"; \
			echo "  link  $$name → $$skill"; \
		fi; \
	done
	@echo ""
	@echo "Done. Skills are available as /skill-name in all projects."

uninstall:
	@for skill in $(SKILL_DIRS); do \
		name=$$(basename "$$skill"); \
		target="$(TARGET_DIR)/$$name"; \
		if [ -L "$$target" ] && [ "$$(readlink "$$target")" = "$$skill" ]; then \
			rm "$$target"; \
			echo "  unlink  $$name"; \
		elif [ -e "$$target" ]; then \
			echo "  SKIP  $$name — exists but not our symlink (not touching)"; \
		else \
			echo "  ok  $$name (not installed)"; \
		fi; \
	done

list:
	@echo "Skills in this repo:"
	@for skill in $(SKILL_DIRS); do \
		name=$$(basename "$$skill"); \
		desc=$$(awk '/^description:/{sub(/^description: */, ""); print; exit}' "$$skill/SKILL.md" 2>/dev/null || echo "(no description)"); \
		echo "  $$name — $$desc"; \
	done
	@echo ""
	@echo "Installed symlinks in $(TARGET_DIR):"
	@for skill in $(SKILL_DIRS); do \
		name=$$(basename "$$skill"); \
		target="$(TARGET_DIR)/$$name"; \
		if [ -L "$$target" ] && [ "$$(readlink "$$target")" = "$$skill" ]; then \
			echo "  ✓ $$name"; \
		elif [ -e "$$target" ]; then \
			echo "  ✗ $$name (exists, not our link)"; \
		else \
			echo "  - $$name (not installed)"; \
		fi; \
	done
