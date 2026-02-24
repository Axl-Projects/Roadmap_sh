# 🚀 Dockerized Node.js App with CI/CD Deployment to AWS EC2

## 📌 Project Overview

This project demonstrates a complete DevOps workflow:

- Build a secure Node.js service
- Dockerize the application
- Push the image to Docker Hub
- Automatically deploy to a remote AWS EC2 server using GitHub Actions
- Manage sensitive data using GitHub Secrets

The application includes a protected route using Basic Authentication.

---

## 🧱 Tech Stack

- Node.js
- Express.js
- Docker
- GitHub Actions (CI/CD)
- AWS EC2 (Ubuntu)
- Docker Hub
- GitHub Secrets

---

## ⚙️ Application Features

### Public Route


GET /


Returns:


Hello, world!


---

### 🔐 Protected Route


GET /secret


- Requires Basic Authentication
- Returns a secret message stored in environment variables

---

## 🌍 Environment Variables

Used locally in `.env` and injected in production via GitHub Secrets:


SECRET_MESSAGE=
USERNAME=
PASSWORD=


---

## 🐳 Dockerization

### Build image locally

```bash
docker build -t node-secret-app .
Run container locally
docker run -p 3000:3000 --env-file .env node-secret-app
☁️ Remote Server (AWS EC2)

Server setup includes:

Ubuntu instance

Docker installed

Port 80 exposed

SSH access via key authentication

🔄 CI/CD Pipeline

The deployment is fully automated using GitHub Actions.

Workflow Steps

Checkout source code

Build Docker image

Push image to Docker Hub

Connect to EC2 via SSH

Pull latest image

Stop & remove old container

Run new container with environment variables

🔐 Secrets Management

The following secrets are stored in GitHub:

EC2_HOST
EC2_USER
EC2_SSH_KEY
DOCKER_USERNAME
DOCKER_PASSWORD
SECRET_MESSAGE
APP_USERNAME
APP_PASSWORD

These values are injected at runtime and never stored in the repository.

📡 Deployment

Every push to:

main

automatically triggers deployment.

The application becomes available at:

http://<EC2_PUBLIC_IP>
📁 Project Structure
.
├── .github/workflows/deploy.yml
├── Dockerfile
├── .dockerignore
├── .gitignore
├── index.js
├── package.json
└── README.md
🧪 Test the Application
Public endpoint
http://<EC2_PUBLIC_IP>
Protected endpoint
http://<EC2_PUBLIC_IP>/secret