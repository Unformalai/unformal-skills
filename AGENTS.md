# Unformal CLI and agent skills

Use `main` as the integration branch. This repository publishes creator automation
for the Unformal REST API; it does not implement an A2A/MCP respondent server.

- Read `README.md` and `cli/README.md` before changing commands or installation docs.
- CLI source is `cli/src/index.ts`; compile with `npm run build` in `cli/`.
- Keep command help, README options and HTTP request field names aligned with the app API.
- Validate help with `UNFORMAL_NO_UPDATE_CHECK=1 node cli/dist/index.js --help`.
- Never commit API keys, local CLI config or user responses.
- Publishing to npm/ClawHub is separate from source integration and requires authorization.
- Preserve existing skill intent; update version metadata intentionally when publishing.
