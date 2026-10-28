# @unformal/cli

CLI for [Unformal](https://unformal.ai) — create and manage AI-powered conversational forms. Replace static forms with AI conversations that adapt to each respondent and extract structured data.

Source reviewed 2026-10-28. Development and integration use `main`.

## Install

```bash
npm i -g @unformal/cli
# or run directly with npx
npx @unformal/cli <command>
```

## Authenticate

### Option A: agent-ready signup (no browser)

Create an account straight from the terminal. The key comes back immediately; a 6-digit code hits your inbox to activate it.

```bash
unformal signup --email you@example.com
# -> API key printed, inactive until verified
unformal verify --email you@example.com --code 123456
# -> key is now active
unformal init --key unf_...
```

Intended for AI agents: two API calls, one human action (reading six digits). No password, no OAuth dance.

### Option B: existing key

If you already have an API key (from [unformal.ai/studio/settings](https://unformal.ai/studio/settings) or a previous signup), just run:

```bash
unformal init --key unf_YOUR_KEY
```

Or export `UNFORMAL_API_KEY=unf_...` in your shell.

## Commands

### Auth (no API key required)
```bash
# New account
unformal signup --email you@example.com       # Create account, get inactive key + email code
unformal verify --email you@example.com --code 123456    # Activate key
unformal resend-verification --email you@example.com     # New code if the first expired

# Existing account, key lost or never saved
unformal login --email you@example.com                   # Email a 6-digit login code
unformal login --email you@example.com --code 123456 --save    # Verify + save fresh API key
```

### Create and manage Pulses
```bash
unformal create --intention "Qualify leads for our enterprise plan" --mode interview
unformal list
unformal get PULSE_ID
unformal update PULSE_ID --max-questions 10
```

### Read responses
```bash
unformal conversations PULSE_ID            # Summary table of all conversations
unformal conversation CONV_ID              # Full transcript + structured answers + echo
unformal export PULSE_ID --format json --output all.json   # Bulk dump
unformal export PULSE_ID --format csv --output all.csv
```

### Aggregate insights
```bash
unformal resonance PULSE_ID                # Themes, NPS, per-question stats, quotes, open-ended highlights
unformal analytics PULSE_ID                # Completion rate, duration, field coverage, sentiment
```

### Account
```bash
unformal usage                             # Credit balance + totals
```

`signup`, `login`, `conversation`, `resonance`, and `analytics` support `--json`.
`export` selects JSON or CSV with `--format`; other commands use their documented output.
Use `unformal <command> --help` for the flags implemented by that command.

## API

Everything the CLI does is available on the HTTP API. See the versioned [`unformal-api/SKILL.md`](../unformal-api/SKILL.md) for curl examples, response shapes, and adaptive input types. Public API documentation is at [unformal.ai/docs/api](https://unformal.ai/docs/api).

## License

MIT
