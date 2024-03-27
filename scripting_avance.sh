#!/bin/bash

# Répertoire source à sauvegarder
source_dir="Plateforme"

# Répertoire de sauvegarde
backup_dir="$HOME/Documents/sauvegardes"

# Nom du fichier d'historique des sauvegardes
history_file="$backup_dir/history.txt"

# Création du répertoire de sauvegarde s'il n'existe pas
mkdir -p "$backup_dir"

# Fonction pour effectuer la sauvegarde
perform_backup() {
    # Nom du fichier de sauvegarde avec timestamp
    backup_file="$backup_dir/Plateforme_$(date +'%Y%m%d_%H%M%S').tar.gz"

    # Création de l'archive tar.gz du répertoire source
    tar -czf "$backup_file" "$source_dir"

    # Enregistrement de la sauvegarde dans l'historique
    echo "$(date +'%Y-%m-%d %H:%M:%S') : $backup_file" >> "$history_file"

    echo "Sauvegarde effectuée avec succès : $backup_file"
}

# Vérifier si le répertoire source existe
if [ ! -d "$source_dir" ]; then
    echo "Le répertoire source '$source_dir' n'existe pas."
    exit 1
fi

# Vérifier si l'historique des sauvegardes existe
if [ ! -f "$history_file" ]; then
    touch "$history_file"
fi

# Effectuer la sauvegarde
perform_backup
