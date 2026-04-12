## The firest thing i download the syslog file because i was not having syslog file in my system .
- sudo apt install rsyslog
this command installs the file in /var/log/syslog.

## grep - the log seach engine.
## commands :- 

grep -i 'error' /var/log/syslog
# -i = case insensitive. Finds Error, ERROR, error, eRrOr — all of them.

grep -n 'error' /var/log/syslog
# -n = line numbers. Output: 1042: Nov 12 10:01:03 ... error ...
# The number before the colon is the line number in the file

grep -r 'error' /var/log/
# -r = recursive. Searches EVERY file inside /var/log/
# Output shows filename:line content — e.g. /var/log/syslog: Nov 12 error...

grep -c 'error' /var/log/syslog
# -c = count only. Returns a single number like: 247
# Translation: 247 lines in syslog contain the word 'error'

## tail -f -- watching logs in real time 
## commands :-

Terminal A — paste this and leave it running
- tail -f /var/log/syslog
# This command does NOT return to a prompt. It stays running.
# You'll see the last 10 lines, then it waits for new entries.
# Leave Terminal A alone. Switch to Terminal B now.

Terminal B — run these to trigger log activity
- sudo apt update
# apt (package manager) logs heavily to syslog — watch Terminal A
- ping -c 3 8.8.8.8
# 3 ICMP pings to Google's DNS — generates network log entries
- sudo systemctl restart ssh
# Restarting SSH service generates entries in both syslog and auth.log
- ls /etc/
# Even simple commands can show in logs via auditd if enabled

## find failed ssh login :-

* 1st i created some fake login and failed ssh attempts .
* i used this all commands in my terminal and also finds some interesting logs and it was also thilling .
 
- grep 'Failed password' /var/log/auth.log
# No -i flag — 'Failed password' is EXACTLY how Linux writes it

- grep -c 'Failed password' /var/log/auth.log
# Total count of failed attempts — one number like: 47

- grep 'Failed password' /var/log/auth.log | tail -20
# pipe to tail: shows only the 20 most RECENT failed attempts

- grep 'Failed password' /var/log/auth.log | wc -l
# wc -l = word count, lines mode. Same result as grep -c

- grep 'Accepted password' /var/log/auth.log
# Shows SUCCESSFUL logins — useful to compare with failed ones











