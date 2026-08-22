#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
APP="${UNFORMAL_APP:-$ROOT/../unformal}"
cp "$ROOT/unformal-api/SKILL.md" "$APP/public/SKILL.md"
echo "Synced unformal-api/SKILL.md → $APP/public/SKILL.md"
