#!/usr/bin/env bash
# Convenience wrapper — run from session7-continuity root
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
exec node "$ROOT/vendor/continuity-keeper/tools/continuity/cli.mjs" "$@"
