#!/bin/bash

# Fonction pour vérifier les mises à jour disponibles
check_updates() {
    echo "Recherche de mises à jour disponibles..."
    sudo apt update >/dev/null 2>&1  # Met à jour les informations sur les paquets disponibles
    updates=$(apt list --upgradable 2>/dev/null | grep -c upgradable)  # Compte les paquets pouvant être mis à jour

    if [ $updates -gt 0 ]; then
        echo "Il y a $updates mises à jour disponibles."
        echo "Voulez-vous procéder à la mise à jour ? (O/n)"
        read answer
        if [ "$answer" = "O" ] || [ "$answer" = "o" ] || [ "$answer" = "" ]; then
            sudo apt upgrade -y  # Met à jour tous les paquets
            echo "Mise à jour terminée."
        else
            echo "Mise à jour annulée."
        fi
    else
        echo "Aucune mise à jour disponible."
    fi
}

# Appel de la fonction pour vérifier les mises à jour
check_updates
