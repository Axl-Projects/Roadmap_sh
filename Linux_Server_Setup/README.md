# Linux Server Hardening on AWS EC2

## Project Overview

The goal of this project is to provision a fresh Ubuntu server on AWS EC2 and apply essential security best practices to prepare it for production use.

This includes user management, SSH hardening, firewall configuration, intrusion prevention, automatic updates, service management, and log inspection.

---

## Cloud Provider

- AWS EC2
- Ubuntu Server

---

## Objectives

- Create a non-root sudo user
- Secure SSH access (key-based authentication only)
- Configure UFW firewall
- Enable automatic security updates
- Install and configure Fail2Ban
- Set correct timezone and hostname
- Manage services using systemctl
- Inspect system logs
- Perform a final security verification checklist

---

## Initial Access

```bash
ssh -i my-key.pem ubuntu@<PUBLIC_IP>

User Setup

Create a new sudo user:

sudo adduser axel
sudo usermod -aG sudo axel

Copy SSH authorized keys:

sudo mkdir -p /home/axel/.ssh
sudo cp ~/.ssh/authorized_keys /home/axel/.ssh/
sudo chown -R axel:axel /home/axel/.ssh
sudo chmod 700 /home/axel/.ssh
sudo chmod 600 /home/axel/.ssh/authorized_keys

SSH Hardening

Edit SSH configuration:

sudo nano /etc/ssh/sshd_config

Disable:

PermitRootLogin no
PasswordAuthentication no

Reload SSH:

sudo systemctl reload ssh

Firewall Configuration (UFW)

sudo apt install ufw -y
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status

System Updates & Automatic Security Patching

sudo apt update && sudo apt upgrade -y
sudo apt install unattended-upgrades -y
sudo dpkg-reconfigure unattended-upgrades

Fail2Ban Installation

sudo apt install fail2ban -y

Configuration:

sudo nano /etc/fail2ban/jail.local
[sshd]
enabled = true
maxretry = 5

Restart service:

sudo systemctl restart fail2ban

Server Configuration

Set Timezone
sudo timedatectl set-timezone Africa/Casablanca
Set Hostname
sudo hostnamectl set-hostname axel-prod-server

Service Management

sudo systemctl status nginx
sudo systemctl start nginx
sudo systemctl stop nginx
sudo systemctl enable nginx

Log Inspection

Journalctl
journalctl -xe
journalctl -u ssh
Important Log Files
/var/log/auth.log
/var/log/syslog