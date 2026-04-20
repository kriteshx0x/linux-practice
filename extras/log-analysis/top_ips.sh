#!/bin/bash
# top_ips.sh — Show top 5 IPs by failed login count

LOG_FILE=${1:-/var/log/auth.log}

echo "=== Top 5 Attacking IPs ==="
printf "%-8s %s\n" "COUNT" "IP ADDRESS"
echo "-----------------------------"
grep "Failed password" "$LOG_FILE" \
  | awk '{print $(NF-3)}' \
  | sort | uniq -c \
  | sort -rn \
  | head -5 \
  | awk '{printf "%-8s %s\n", $1, $2}'

