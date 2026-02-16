# Static Website Deployment with Nginx on AWS EC2

## Project Overview

This project demonstrates how to deploy a static website on a remote Linux server using:

- AWS EC2
- Nginx
- SSH
- rsync

The goal is to understand the fundamentals of web servers, remote access, and automated deployment.

---

## Technologies Used

- AWS EC2 (Ubuntu)
- Nginx
- rsync
- SSH
- HTML / CSS

---

## Architecture

Local machine → rsync over SSH → EC2 instance → Nginx serves static site

---

## Steps



### 1 Launch EC2 instance

- Ubuntu Server
- Configure Security Group:
  - Port 22 → SSH
  - Port 80 → HTTP

### 2 Connect via SSH

```bash
chmod 400 key_pair.pem
ssh -i key_pair.pem ubuntu@<PUBLIC_IP>

3️ Install Nginx
sudo apt update
sudo apt install nginx -y

4️ Create web directory
sudo mkdir -p /var/www/mysite
sudo chown -R ubuntu:ubuntu /var/www/mysite

5️ Configure Nginx

Edit:

sudo nano /etc/nginx/sites-available/default


Set:

root /var/www/mysite;
index index.html;


Reload:

sudo nginx -t
sudo systemctl reload nginx

6️ Deploy with rsync
rsync -avz -e "ssh -i key_pair.pem" ./site/ ubuntu@<PUBLIC_IP>:/var/www/mysite

🚀 Result

The static website is accessible via:

http://<PUBLIC_IP>


🎯 Key Learnings

Remote server provisioning

Nginx configuration

File permissions in Linux

SSH authentication

Automated deployment with rsync



