# Agent Guide for virgil-web

Rails 8.1 chat application with LLM integration (ruby_llm gem). Makes HTTP requests to `virgo-web:8888` service.

## Quick Commands

```bash
bin/setup             # Install deps, prepare DB
bin/rails server      # Start dev server (port 3000)
bin/ci                # Run full CI suite locally
bin/rails test        # Unit and integration tests
bin/rails test:system # Capybara browser tests
bin/rubocop           # Lint with rubocop-rails-omakase
bin/brakeman          # Security scan (Rails)
bin/bundler-audit     # Security scan (gems)
bin/importmap audit   # Security scan (JS deps)
```

## Architecture

**Custom dirs**:
- `app/tools/` — reusable tool definitions (fetch_links, fetch_markdown, custom_search)
- `app/prompts/` — prompt templates
- `app/agents/` — agent configs
- `app/schemas/` — JSON schemas
- `app/services/` — service objects (mostly empty stubs)

## Dependencies & Database

- Ruby 4.0.3 (per `.ruby-version`)
- Rails 8.1.3 with SQLite3
- `ruby_llm` gem for LLM integration
- `capybara` + `selenium-webdriver` for system tests
- Importmap-rails for JS (no Node.js build)
- Thruster + Puma server

Database: SQLite (dev/test). Runs `bin/rails db:prepare` on setup.

## Notes for Agents

- Security scans are strict (brakeman exits on warn + error)
- Importmap audit must pass; no node_modules allowed
- Always run `bin/ci` before committing (or run individual steps in order: setup → rubocop → audit → brakeman → rails test)
