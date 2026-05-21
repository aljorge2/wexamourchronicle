# ─────────────────────────────────────────────────────────────────
# The Wexamour Chronicle — Local Development Commands
# ─────────────────────────────────────────────────────────────────
# Usage:
#   make serve    → start local preview at http://localhost:1313
#   make build    → build production-ready site into /public
#   make clean    → delete the /public build folder
#   make new      → create a new article (usage: make new NAME=my-article-slug)
# ─────────────────────────────────────────────────────────────────

.PHONY: serve build clean new

# Start Hugo dev server with live reload.
# Includes draft posts (-D) so you can preview before publishing.
serve:
	hugo server -D --disableFastRender --navigateToChanged

# Build the site for production (minified, no drafts).
build:
	hugo --gc --minify

# Remove the generated /public directory.
clean:
	rm -rf public

# Create a new article in the dispatches section.
# Usage: make new NAME=my-article-slug
new:
	hugo new dispatches/$(NAME).md
