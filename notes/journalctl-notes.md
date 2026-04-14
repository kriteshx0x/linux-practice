## journalctl mastery
- System log analysis & incident response

## concept
systemd stores all logs in a binary journal (not plain text files). journalctl is the tool to query this journal — filtering by time, service, severity, and more.
Logs are stored in /var/log/journal/ and survive reboots.

## why it matters
In incident response, logs are your first evidence.
A real analyst runs journalctl to find failed logins, crashed services, and kernel panics. 
Blue team skill #1.

## Commands:

- journalctl -xe
→ Detailed logs (system activity + explanations)
→ Observed: service starts, CRON jobs, normal operations

- journalctl -u ssh
→ SSH-specific logs
→ Found: failed logins (invalid user, failed password)
→ Indicates brute-force / unauthorized attempts

- journalctl --since '1 hour ago'
→ Time-based filtering
→ Shows recent kernel + system activity

- journalctl -p err --since today
→ Only error logs
→ Found minor issues (keyring, Bluetooth services)

- journalctl -b -1
→ Previous boot logs
→ Shows kernel + hardware initialization

## Key Concepts

-u → service logs
-p → priority (errors)
--since → time filter
-b → boot logs

## Cybersecurity Insight

Logs reveal:
Attack attempts (SSH failures)
System behavior
Debugging info

