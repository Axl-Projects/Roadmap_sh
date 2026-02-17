# Systemd Dummy Service

## Project Overview

The goal of this project is to understand the fundamentals of **systemd** by creating and managing a custom Linux service.

We build a background service that:

* Runs indefinitely
* Writes a message to a log file every 10 seconds
* Starts automatically at boot
* Restarts automatically if it fails
* Can be managed using `systemctl`
* Can be monitored using `journalctl`

This project provides hands-on experience with real-world Linux service management — an essential skill for **DevOps, Cloud, and Backend roles**.

---

## Objectives

* Create a long-running bash script
* Configure a custom systemd service
* Enable automatic startup on boot
* Ensure auto-restart on failure
* Manage the service lifecycle
* Monitor logs using journalctl

---

## Technologies Used

* Linux (Ubuntu / Debian / WSL with systemd)
* Bash scripting
* systemd

---

## Project Structure

```
Dummy_systemd_service/
├── dummy.sh
├── dummy.service
└── README.md
```

---

## How It Works

The service executes a bash script that runs in an infinite loop and writes a timestamped message to:

```
/var/log/dummy-service.log
```

every 10 seconds.

systemd ensures:

* The service runs in the background
* It restarts if it crashes
* It starts automatically when the system boots

---

## Setup Instructions

### Create the Script

```bash
sudo nano /usr/local/bin/dummy.sh
```

```bash
#!/bin/bash
while true
do
  echo "Dummy service is running at $(date)" >> /var/log/dummy-service.log
  sleep 10
done
```

Make it executable:

```bash
sudo chmod +x /usr/local/bin/dummy.sh
```

---

### Create the Log File

```bash
sudo touch /var/log/dummy-service.log
sudo chmod 644 /var/log/dummy-service.log
```

---

### Create the systemd Service

```bash
sudo nano /etc/systemd/system/dummy.service
```

```ini
[Unit]
Description=Dummy Background Service
After=network.target

[Service]
ExecStart=/usr/local/bin/dummy.sh
Restart=always
User=root

[Install]
WantedBy=multi-user.target
```

---

### Reload systemd

```bash
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
```

---

### Start the Service

```bash
sudo systemctl start dummy
```

---

## Service Management Commands

### Start

```bash
sudo systemctl start dummy
```

### Stop

```bash
sudo systemctl stop dummy
```

### Enable at Boot

```bash
sudo systemctl enable dummy
```

### Disable

```bash
sudo systemctl disable dummy
```

### Check Status

```bash
sudo systemctl status dummy
```

---

## Logs

### systemd logs

```bash
sudo journalctl -u dummy -f
```

### Application log file

```bash
tail -f /var/log/dummy-service.log
```

---

## Auto-Restart Test

Kill the process manually:

```bash
sudo pkill -f dummy.sh
```

Check the status again:

```bash
sudo systemctl status dummy
```

The service will restart automatically.

---

## ⚠️ WSL Users

Systemd is not enabled by default in WSL.

Check with:

```bash
ps -p 1
```

If systemd is not available, use:

* WSL with systemd enabled
* A Linux VM
* A cloud instance

---

## Skills Gained

* Creating and managing systemd services
* Linux process lifecycle
* Log monitoring and debugging
* Service auto-restart configuration
* Boot-time service activation

---

## Future Improvements

* Run the service as a non-root user
* Use systemd to handle log output directly
* Add environment variables
* Containerize the service

---

## Author

**Axel AHO**

DevOps | Cloud | AI Engineer in progress
