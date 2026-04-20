#!/bin/bash
# failed_logins.sh — Count failed SSH login attempts per IP

LOG_FILE=${1:-/var/log/auth.log}

echo "=== Failed Login Attempts ==="
grep "Failed password" "$LOG_FILE" \
  | awk '{print $(NF-3)}' \
  | sort \
  | uniq -c \
  | sort -rn
