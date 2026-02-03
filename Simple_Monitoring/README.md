# Basic System Monitoring with Netdata

## Project Overview

The goal of this project is to learn the **basics of system monitoring** by setting up a real-time monitoring dashboard using **Netdata**.  
This project helps understand how to monitor system health, visualize metrics, configure alerts, and automate setup and cleanup using shell scripts.

By completing this project, you gain hands-on experience with:
- Monitoring fundamentals
- Linux system metrics
- Automation with shell scripts
- DevOps best practices

---

## Objectives

- Install Netdata on a Linux system
- Monitor basic system metrics:
  - CPU usage
  - Memory usage
  - Disk I/O
- Access the Netdata dashboard via a web browser
- Customize at least one dashboard aspect
- Configure an alert (CPU usage > 80%)
- Automate setup, testing, and cleanup using shell scripts

---

## Technologies Used

- **Linux (Ubuntu / WSL)**
- **Netdata**
- **Bash scripting**
- **curl**
- **stress / stress-ng** (for testing)

---

## Project Structure

Simple_Monitoring/
├── setup.sh
├── test_dashboard.sh
├── cleanup.sh
└── README.md

---

## Setup Instructions

### 1. Install Netdata

Run the setup script:

```bash
chmod +x setup.sh
./setup.sh

2. Access the Dashboard

Once Netdata is running, open your browser and go to:

http://localhost:19999

---

**Dashboard Customization**

Customizations were done by modifying Netdata configuration files under:

/etc/netdata/

**Alerts Configuration**

An alert was configured to trigger when CPU usage exceeds 80%.

Alert configuration file example:

/etc/netdata/health.d/cpu.conf

**Testing the Monitoring Setup**

To simulate system load and test metrics:

chmod +x test_dashboard.sh
./test_dashboard.sh

**Cleanup**

To completely remove Netdata from the system:

chmod +x cleanup.sh
./cleanup.sh