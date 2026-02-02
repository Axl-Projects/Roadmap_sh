# Nginx Log Analyzer

## Project URL: https://roadmap.sh/projects/nginx-log-analyser

This project is a simple **command-line log analysis tool** written in **Bash**.  
It analyzes an **NGINX access log file** and extracts useful statistics such as the most frequent IP addresses, requested paths, response status codes, and user agents.

This project is designed to help practice:
- Shell scripting
- Log analysis
- Text processing with Unix tools
- Real-world DevOps / SRE tasks

---

## Features

The script provides the following information from an NGINX access log:

- Top 5 IP addresses with the most requests
- Top 5 most requested paths
- Top 5 response status codes
- Top 5 user agents

---

## Project Structure

```text
Nginx_Log_Analyzer/
├── log-analyzer.sh
└── README.md
└── archive.log
