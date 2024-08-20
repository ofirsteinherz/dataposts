# Makefile for Git operations

# Default target
.PHONY: commit

# Commit changes to the main branch with a custom commit message
commit:
	@if [ -z "$(m)" ]; then \
		echo "Error: Please provide a commit message using 'make commit m=\"Your commit message\"'"; \
		exit 1; \
	fi
	git add .
	git commit -m "$(m)"
	git push origin main

# Hard reset the repository to the last pushed state, including ignored files
hard-reset:
	@git fetch origin
	@git reset --hard origin/main
	@git clean -fdx