# Ansible Server Configuration on AWS

This project demonstrates how to use **Ansible** for automated server configuration and deployment of a static website on an AWS EC2 instance.

## Project Goal

The objective is to:

* Configure a Linux server automatically
* Install and configure Nginx
* Deploy a static website
* Manage SSH access
* Structure the automation using Ansible roles

---

## Architecture

Control Node → Local machine with Ansible
Managed Node → AWS EC2 (Ubuntu)

Ansible connects via SSH using a private key.

---

## Project Structure

```
ansible-project/
│── inventory.ini
│── setup.yml
│
└── roles/
    ├── base/
    ├── nginx/
    ├── app/
    └── ssh/
```

---

## Requirements

* AWS EC2 instance running (Ubuntu recommended)
* Port **22** and **80** open in the Security Group
* SSH key (.pem)
* Ansible installed on your local machine

Install Ansible:

```bash
sudo apt update
sudo apt install ansible -y
```

---

## Inventory Configuration

Edit `inventory.ini`:

```ini
[web]
your_server ansible_host=YOUR_EC2_PUBLIC_IP ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/key.pem
```

Test the connection:

```bash
ansible all -i inventory.ini -m ping
```

---

## Run the Playbook

Run all roles:

```bash
ansible-playbook -i inventory.ini setup.yml
```

Run a specific role:

```bash
ansible-playbook -i inventory.ini setup.yml --tags "app"
```

---

## Roles Description

### base

* Updates the system
* Installs common utilities
* Installs and configures fail2ban

### nginx

* Installs Nginx
* Starts and enables the service

### app

* Uploads the static website archive
* Extracts it to `/var/www/html`

### ssh

* Adds a public SSH key to the server

---

## Access the Website

Once the playbook is executed:

```
http://YOUR_EC2_PUBLIC_IP
```

---

## Stretch Goal – GitHub Deployment

Instead of uploading a tar archive, the app role can pull the project directly from GitHub:

```yaml
- name: Clone repository
  git:
    repo: https://github.com/username/repository.git
    dest: /var/www/html
    version: main
```

---

## Key Concepts Learned

* Configuration Management
* Infrastructure as Code (IaC)
* Idempotent automation
* Ansible roles and tags
* Automated deployment on AWS

---

## Demo

(Optional: add screenshots of your running website)

---

## Author

**Axel AHO**
HESTIM – DevOps & Cloud Enthusiast
