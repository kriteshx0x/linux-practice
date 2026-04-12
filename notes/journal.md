# Day 4 gives you two foundations running in parallel:

  Git skill:         You now manage TWO repos — git-practice and linux-config
                     You're building the habit of: scaffold → note → commit → push

  Linux skill:       /var/log is your new best friend
                     syslog tells the story of your system
                     Core commands (find, which, ls -la) are daily tools

  Security context:  auth.log = attack evidence
                     syslog = system story
                     find = forensic search
                     which = binary verification


# Day 5 notes — grep and log filtering

## What I learned today
- grep is the primary tool for searching through log files
- Logs are huge — you cannot read them manually; grep filters what matters
- auth.log records every login attempt with IP, username, timestamp
- awk can extract specific columns (fields) from structured log output
- Chaining grep | awk | sort | uniq -c | sort -rn gives ranked threat intelligence

## Key commands I ran
```bash
grep -i 'error' /var/log/syslog        # case-insensitive search
grep -n 'error' /var/log/syslog        # with line numbers  
grep -r 'error' /var/log/              # recursive across all log files
grep -c 'Failed password' /var/log/auth.log   # count of failed SSH logins
tail -f /var/log/syslog                # live log watcher
```

## The IP extraction pipeline
```bash
grep 'Failed password' /var/log/auth.log | awk '{print $11}' | sort | uniq -c | sort -rn
```
This gives a ranked list of IPs that tried to brute-force SSH login.

## What this connects to
- SOC analysts do this manually before SIEM tools were common
- Splunk/ELK do the same thing with a GUI and search language
- This is blue-team/defensive security work
- Day 7 will turn this into an automated bash script
