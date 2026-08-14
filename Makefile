# Path: Makefile
SHELL := /bin/sh
.DEFAULT_GOAL := help

ARGS ?=
BASE_URL ?= /dev-tools/

.PHONY: require-pnpm
require-pnpm:
	@command -v pnpm >/dev/null 2>&1 || { echo "pnpm is required. Install from https://pnpm.io/installation"; exit 1; }

.PHONY: help
help: ## Show available commands
	@awk 'BEGIN {FS = ":.*## "; print "Available targets:"} /^[a-zA-Z0-9_.-]+:.*## / {printf "  %-18s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: install
install: require-pnpm ## Install dependencies (scripts skipped)
	@pnpm install --ignore-scripts

.PHONY: dev
dev: require-pnpm ## Run the Vite dev server
	@pnpm dev

.PHONY: build
build: require-pnpm ## Production build with default BASE_URL (/)
	@pnpm build

.PHONY: build-pages
build-pages: require-pnpm ## Production build using BASE_URL=$(BASE_URL) (matches GitHub Pages)
	@BASE_URL="$(BASE_URL)" pnpm build

.PHONY: preview
preview: require-pnpm ## Serve the last build locally (port 5050)
	@pnpm preview

.PHONY: lint
lint: require-pnpm ## Run oxlint
	@pnpm lint

.PHONY: lint-fix
lint-fix: require-pnpm ## Run oxlint --fix
	@pnpm lint:fix

.PHONY: fmt
fmt: require-pnpm ## Run oxfmt
	@pnpm fmt

.PHONY: fmt-check
fmt-check: require-pnpm ## Run oxfmt --check
	@pnpm fmt:check

.PHONY: typecheck
typecheck: require-pnpm ## Run vue-tsc type checking
	@pnpm typecheck

.PHONY: test
test: require-pnpm ## Run unit tests (pass ARGS="...")
	@pnpm test $(ARGS)

.PHONY: test-e2e
test-e2e: require-pnpm ## Run Playwright e2e tests (pass ARGS="...")
	@pnpm test:e2e $(ARGS)

.PHONY: precommit
precommit: require-pnpm ## Install, lint --fix, typecheck (matches package.json precommit)
	@pnpm install --ignore-scripts && pnpm lint:fix && pnpm typecheck

.PHONY: clean
clean: ## Remove dist/ build output
	@rm -rf dist


clean:
	rm -rf dist
