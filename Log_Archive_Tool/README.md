# Log Archive CLI Tool

This project is a simple **command-line tool** written in **Bash** that archives log files from a given directory by compressing them into a `.tar.gz` file.  
It is useful for **log rotation**, **system cleanup**, and **backup purposes**, while keeping logs available for future reference.

This project helps practice:
- Bash scripting
- Working with files and directories
- CLI tools
- Linux system fundamentals

---

## Features

- Accepts a log directory as a command-line argument
- Compresses logs into a timestamped `.tar.gz` archive
- Stores archives in a dedicated directory
- Logs the date and time of each archive operation
- Works on any Unix/Linux system

---

## Project Structure

```text
log-archive/
├── log-archive.sh
├── archives/
│   └── archive.log
└── README.md
