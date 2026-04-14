# Day 7 — Log Analysis Challenge Report

## Scripts Written
- `failed_logins.sh` — grep + awk + sort + uniq pipeline
- `top_ips.sh` — ranked leaderboard of attacking IPs

## Commands Used
```bash
grep "Failed password" auth.log | awk '{print $(NF-3)}' | sort | uniq -c | sort -rn
```

## Findings
| IP Address      | Failed Attempts | Risk Level |
|----------------|-----------------|------------|
| 192.168.1.105  | 47              | 🔴 HIGH    |
| 10.0.0.44      | 23              | 🟠 MEDIUM  |

## Observations
- Most attacking IP: 192.168.1.105 (likely automated scanner)
- Pattern: attempts spike between 02:00–04:00 UTC (low-traffic window)
- All attempts targeted 'root' and 'admin' usernames (dictionary attack)

## Recommendations
- Block 192.168.1.105 with: sudo ufw deny from 192.168.1.105
- Enable fail2ban to auto-ban after 5 failures
- Disable root SSH login in /etc/ssh/sshd_config


