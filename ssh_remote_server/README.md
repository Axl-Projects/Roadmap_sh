# DevOps Project – SSH Server Setup (Using Local Virtual Machine)

## 📌 Project Overview

The goal of this project is to learn and practice the **basics of Linux and SSH** by setting up a remote-like Linux server and configuring it to allow secure SSH connections using **multiple SSH key pairs**.

Instead of using a cloud provider (DigitalOcean, AWS, Oracle Cloud, etc.), this project was completed using a **local Virtual Machine (VM)** running on my own laptop.  
This approach still satisfies all the technical requirements of the project and is commonly used for learning and testing DevOps concepts.

---

## 🖥️ Environment

- **Host OS**: Windows
- **Virtualization Tool**: VirtualBox (or VMware)
- **Guest OS**: Ubuntu Server
- **Network Mode**: Bridged Adapter
- **SSH Server**: OpenSSH

Using a bridged network allows the VM to behave like a real server on the local network, making SSH connections possible from the host machine.

---

## 🎯 Project Objectives

- Set up a Linux server (VM)
- Install and configure SSH
- Create **two SSH key pairs**
- Configure the server to accept both SSH keys
- Connect to the server using:
  ```bash
  ssh -i <private-key> user@server-ip
- Configure ~/.ssh/config for simplified SSH access
(Optional) Prepare the system for security hardening (fail2ban)

## Install and Enable SSH on the VM

sudo apt update
sudo apt install -y openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh
sudo systemctl status ssh

## Generate SSH Key Pairs (on the Host Machine)

ssh-keygen -t ed25519 -f ~/.ssh/devops_key_1
ssh-keygen -t ed25519 -f ~/.ssh/devops_key_2

This generates:

- Private keys:

devops_key_1

devops_key_2

- Public keys:

devops_key_1.pub

devops_key_2.pub

## Copy Public Keys to the VM

ssh-copy-id -i ~/.ssh/devops_key_1.pub user@VM_IP
ssh-copy-id -i ~/.ssh/devops_key_2.pub user@VM_IP

The public keys are added to:

~/.ssh/authorized_keys

## Test SSH Access Using Each Key

ssh -i ~/.ssh/devops_key_1 user@VM_IP
ssh -i ~/.ssh/devops_key_2 user@VM_IP


Both connections work successfully without requiring a password.

## Configure SSH Alias (Optional but Recommended)

Edit the SSH config file on the host machine:

nano ~/.ssh/config

**Add**:

Host devops-vm
    HostName VM_IP
    User user
    IdentityFile ~/.ssh/devops_key_1


**Now connect with**:

ssh devops-vm

## Security Notes

Private keys are never committed to the repository.

Only the steps and configuration process are documented.

Permissions were correctly set on SSH files:

**chmod 700 ~/.ssh**
**chmod 600 ~/.ssh/authorized_keys**

## Outcome

Successfully configured a Linux server (local VM)

Enabled SSH access using two different SSH key pairs

Verified secure, passwordless SSH connections

Gained hands-on experience with:

Linux

SSH

Key-based authentication

Network configuration in virtualized environments

## Notes

Although the project was completed using a local virtual machine, the same steps apply to cloud-based servers such as AWS, DigitalOcean, or Oracle Cloud. This setup provides a solid foundation for future DevOps projects involving server hardening, automation, and monitoring.