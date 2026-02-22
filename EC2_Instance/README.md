# Déploiement d'un site statique sur AWS EC2

## Description
Ce projet consiste à déployer un site web statique sur une instance **Ubuntu EC2** dans AWS.  
Il permet de se familiariser avec le cloud computing et l’hébergement web sur AWS.

---

## Prérequis
- Compte AWS actif
- Clé SSH (`.pem`)
- Terminal Linux ou équivalent pour SSH
- Navigateur web

---

## Étapes de déploiement

### 1. Lancer l’instance EC2
- Ubuntu Server 22.04 LTS
- Type : `t2.micro` (Free Tier)
- Security Group :
  - SSH (22) : autorisé pour ton IP
  - HTTP (80) : ouvert à tous
- Auto-assign Public IP activé
- Création/utilisation d’une clé SSH

### 2. Connexion à l’instance
```bash
chmod 400 my-key-pair.pem
ssh -i "my-key-pair.pem" ubuntu@<PUBLIC_IP>

3. Installer le serveur web
sudo apt update && sudo apt upgrade -y
sudo apt install nginx -y
sudo systemctl status nginx
4. Déployer le site statique

Créer le fichier HTML avec CSS intégré :

sudo nano /var/www/html/index.html

Coller le code HTML avec CSS fourni.

Recharger Nginx :

sudo systemctl reload nginx
5. Accéder au site

Ouvrir un navigateur et taper :

http://<PUBLIC_IP>
Contenu du site

HTML simple avec un conteneur central

CSS intégré pour le style (fond clair, texte centré, bouton stylisé)

Stretch Goals

Ajouter plusieurs pages HTML

Fichier CSS externe

Nom de domaine personnalisé (Route 53)

HTTPS via Let’s Encrypt

Auteur

Axel AHO
Projet réalisé pour l’apprentissage pratique d’AWS EC2 et du déploiement de sites statiques.