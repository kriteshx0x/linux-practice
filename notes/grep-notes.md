## The firest thing i download the syslog file because i was not having syslog file in my system .
- sudo apt install rsyslog
this command installs the file in /var/log/syslog.

# grep cheatsheet — Day 5

## What is grep?
grep (Global Regular Expression Print) searches text files line by line
and prints every line that matches a pattern.

---

## Core flags

| Flag | What it does | Example |
|------|-------------|---------|
| `-i` | Case-insensitive search | `grep -i 'error' syslog` |
| `-n` | Show line numbers | `grep -n 'error' syslog` |
| `-r` | Recursive (search all files in a dir) | `grep -r 'error' /var/log/` |
| `-c` | Count matching lines only | `grep -c 'error' syslog` |
| `-v` | Invert — show lines that do NOT match | `grep -v 'info' syslog` |
| `-A N` | Show N lines AFTER each match | `grep -A 3 'error' syslog` |
| `-B N` | Show N lines BEFORE each match | `grep -B 2 'error' syslog` |
| `-E` | Extended regex (use OR, +, ?, etc.) | `grep -E 'err|warn' syslog` |
| `-l` | List filenames that contain the match | `grep -l 'error' /var/log/*.log` |
| `-w` | Match whole words only | `grep -w 'fail' syslog` |

---

## Cybersecurity-specific commands

```bash
# Find all failed SSH login attempts
grep 'Failed password' /var/log/auth.log

# Count total failed attempts
grep -c 'Failed password' /var/log/auth.log

# Find successful logins (what got through?)
grep 'Accepted password' /var/log/auth.log

# Find errors in all logs at once
grep -r 'error' /var/log/

# Case-insensitive error search with line numbers
grep -in 'error' /var/log/syslog

# Show 3 lines before + after each match (full context)
grep -B 3 -A 3 'Failed password' /var/log/auth.log

# Search for two patterns at once (regex OR)
grep -E 'error|critical|warning' /var/log/syslog
```

---

## The IP extraction pipeline (threat hunting)

```bash
grep 'Failed password' /var/log/auth.log \
  | awk '{print $11}' \
  | sort \
  | uniq -c \
  | sort -rn
```

**What each pipe does:**
- `grep` → filter only failed login lines
- `awk '{print $11}'` → extract field 11 (the IP address)
- `sort` → group identical IPs together
- `uniq -c` → count each unique IP
- `sort -rn` → sort numerically, highest count first

---

## Quality-of-life tip
Add this to ~/.bashrc to get coloured grep output automatically:
```bash
alias grep='grep --color=auto'
```

---

## Log file anatomy
```
Nov 12 10:01:44   kali   sshd[1293]:  Failed password for root from 192.168.1.105 port 52342
$timestamp        $host  $process     $message
```
Fields in awk: $1=Nov $2=12 $3=time $4=host $5=process $6-$10=message $11=IP

