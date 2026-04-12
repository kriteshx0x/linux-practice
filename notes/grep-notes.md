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


