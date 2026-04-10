# Day 4 — Kali Basics Notes

**Date:** 2026-04-11

---

## /var/log Directory

Files I found in /var/log:

* `auth.log` — login attempts, sudo usage, SSH sessions
* `syslog` — general system events from multiple services
* `kern.log` — kernel-level messages (hardware, drivers)
* `dpkg.log` — package installation and updates history
* `boot.log` — system boot process logs
* `alternatives.log` — update-alternatives changes
* `apt/history.log` — APT install/remove history

---

## First 50 Lines of syslog — What I Observed

* The first entry was timestamped: `Apr 11 00:xx:xx`
* I saw references to these services: `CRON`, `NetworkManager`, `systemd`, `dbus`
* Interesting lines:

  * Line 12: `CRON[xxx]: (root) CMD (...)` → scheduled background task executed by root
  * Line 25: `NetworkManager: <info> ... connected` → network interface successfully connected
  * Line 33: `systemd[1]: Started ...` → system service initialization during runtime

---

## Core Commands Practice

| Command | What it does                 | Example I ran                   |
| ------- | ---------------------------- | ------------------------------- |
| pwd     | Shows current directory      | `/home/ritesh/repos/git-practice` |
| ls -la  | Lists all files with details | Showed hidden `.git` folder     |
| find    | Searches filesystem          | `find . -name "*.md"`           |
| which   | Locates a binary             | `which git` → `/usr/bin/git`    |

---

## Questions / Things to look up later

* [x] What generates syslog entries?
  **Answer:** Managed by the rsyslog daemon (collects logs from system and services)

* [x] What does `adm` group mean for log permissions?
  **Answer:**
  The `adm` group is a privileged Linux group that has read access to important log files in `/var/log`.

  ### Key points:

  * Allows users to read logs without root access
  * Common files:

    * `/var/log/syslog`
    * `/var/log/auth.log`
  * Used for monitoring, debugging, and auditing system activity

  ### Example:

  ```bash
  ls -l /var/log/syslog
  ```

  Output meaning:

  ```bash
  -rw-r----- 1 root adm ...
  ```

  * `root` = owner
  * `adm` = group with read permission

---

### 🔥 Key Takeaway

Understanding logs is critical for cybersecurity:

* Detect failed logins (auth.log)
* Track system behavior (syslog)
* Monitor installations (dpkg.log)

Logs = **first source of truth in incident analysis**

