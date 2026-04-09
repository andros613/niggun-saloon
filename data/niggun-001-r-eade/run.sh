#!/usr/bin/env bash
set -euo pipefail
exec "$(dirname "$0")/../../tools/render.sh" niggun_001 "$@"
