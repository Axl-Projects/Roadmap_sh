# Server Performance Analysis Script (`server-stats.sh`)

## Project URL: https://roadmap.sh/projects/server-stats

## Project Overview

The goal of this project is to provide a **simple, easy-to-run script** that analyzes basic server performance stats on **any Linux server**.

This script is designed for system administrators, developers, and DevOps engineers who want a quick overview of server health without installing heavy monitoring tools.

It provides the following stats:

* Total CPU usage
* Total memory usage (Free vs Used including percentage)
* Total disk usage (Free vs Used including percentage)
* Top 5 processes by CPU usage
* Top 5 processes by memory usage

**Stretch goals (optional)**:

* OS version
* Uptime
* Load average
* Logged-in users
* Failed login attempts

---

## Features

1. **CPU Usage:** Shows total CPU usage using the `mpstat` command.
2. **Memory Usage:** Reports memory usage in MB and as a percentage using `free -m`.
3. **Disk Usage:** Displays total disk usage across all mounted filesystems using `df -h --total`.
4. **Top Processes:** Lists the top 5 processes by CPU and memory consumption using `ps --sort`.
5. **Optional Extra Stats:**

   * OS version (`lsb_release -a` or `/etc/os-release`)
   * Uptime (`uptime`)
   * Load average (`/proc/loadavg`)
   * Currently logged-in users (`who`)

---

## Requirements

* Linux server or WSL (Windows Subsystem for Linux)
* Commands required:

  * `mpstat` (from `sysstat` package)
  * `free`
  * `df`
  * `ps`
  * `lsb_release` (optional, for OS info)

Install dependencies if missing:

```bash
sudo apt update
sudo apt install sysstat lsb-release -y
```

---

## Usage

1. Make the script executable:

```bash
chmod +x server-stats.sh
```

2. Run the script:

```bash
./server-stats.sh
```

3. Optional: Save output to a log file:

```bash
./server-stats.sh | tee server_stats.log
```

---

## Example Output

```
Server Performance Stats
-------------------------------
** CPU Usage **
Total CPU Used: 15%

** Memory Usage **
Memory Usage: 4000/8000MB (50%)

** Disk Usage **
Used: 120G, Free: 80G, Usage: 60%

** Top 5 Processes by CPU Usage **
PID  PPID CMD          %MEM %CPU
1234 1    myprocess    5.0  12.0
...

** Top 5 Processes by Memory Usage **
PID  PPID CMD          %MEM %CPU
5678 1    java         15.0 3.0
...

*** EXTRA STATS ***
OS Version:
Ubuntu 22.04 LTS

Uptime:
 12:30:45 up 5 days,  4:12,  2 users,  load average: 0.25, 0.30, 0.35

Load Average:
0.25 0.30 0.35 1/120 5678

Logged in users:
axel     pts/0    2026-02-01 10:12 (192.168.1.100)
```

---

## How it Works

1. Each section of the script is a **function**, e.g., `get_cpu_usage_info`, `get_memory_usage_info`.
2. Functions are called from a **main()** function that organizes the output.
3. Commands like `awk` and `ps` are used to parse and display system stats cleanly.
4. Optional extra stats (OS version, uptime, load average) provide more insight.

---

## Benefits

* Lightweight → no need to install heavy monitoring tools
* Quick overview of server health
* Modular and easy to extend
* Can be run on any Linux server

---

## Stretch Goals

* Include **network stats** (e.g., bandwidth usage)
* Detect **disk I/O issues**
* Monitor **failed login attempts** (`lastb`)
* Add **email reporting**

---

## Author

Developed by **Axel AHO** for system administration and DevOps practice.
