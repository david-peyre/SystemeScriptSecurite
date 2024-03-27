#!/bin/bash

# Mettre à jour la liste des paquets et les paquets existants
echo "Mise à jour des paquets..."
sudo apt update && sudo apt upgrade -y

# Installer Apache
echo "Installation d'Apache..."
sudo apt install -y apache2

# Installer MariaDB (un substitut pour MySQL)
echo "Installation de MariaDB..."
sudo apt install -y mariadb-server

# Sécuriser l'installation de MariaDB
echo "Sécurisation de MariaDB..."
sudo mysql_secure_installation

# Installer PHP et ses extensions nécessaires pour phpMyAdmin et Apache
echo "Installation de PHP et extensions nécessaires..."
sudo apt install -y php php-mysql libapache2-mod-php php-cli php-cgi php-gd

# Installer phpMyAdmin
echo "Installation de phpMyAdmin..."
sudo apt install -y phpmyadmin

# Configurer Apache pour exécuter phpMyAdmin
echo "Configuration d'Apache pour phpMyAdmin..."
sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

# Redémarrer Apache pour appliquer les changements
echo "Redémarrage d'Apache..."
sudo systemctl restart apache2

# Installer Node.js et NPM
echo "Installation de Node.js et NPM..."
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs

# Installer Git
echo "Installation de Git..."
sudo apt install -y git

echo "Installation terminée"
