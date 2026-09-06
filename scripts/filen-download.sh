#!/usr/bin/env bash
# filen renders its progress bar/speed only on a TTY; run under a PTY and tee the raw output to a log file.
# Usage: filen-download.sh <log-file> <cloud-source> <local-destination>
set -eo pipefail
LOG="$1"
shift
python3 - "$@" <<'PYEOF' 2>&1 | tee -a "$LOG"
import pty, sys
pty.spawn(["filen", "download", *sys.argv[1:]])
PYEOF
