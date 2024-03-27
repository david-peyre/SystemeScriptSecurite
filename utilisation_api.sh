#!/bin/bash

# Configuration initiale
API_KEY="live_6LLDAGz5RzrmVZ3Vp3SnTJSzVtIXcSTGFzwOSBwYkyaTHDfPdvZrfjdf0IHiPBxm".
API_URL="https://api.thecatapi.com/v1/images/search?limit=5"  # URL de l'API pour obtenir des images.
LOG_FILE="catapi.log"  # Fichier où les interactions seront enregistrées.

# Fonction pour ajouter des entrées de journal
log() {
    # Ajouter des entrées de log avec date et heure au fichier LOG_FILE.
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Préparation de l'envoi de la requête API
# Nettoyer le code de statut HTTP des sauts de ligne et des espaces
HTTP_STATUS=$(curl -s -o response.json -w "%{http_code}" "${API_URL}&api_key=${API_KEY}")
HTTP_STATUS=$(echo "$HTTP_STATUS" | tr -d '\n' | tr -d ' ')

# Lecture de la réponse de l'API
RESPONSE_BODY=$(<response.json)

# Vérification et enregistrement de la réponse de l'API
if [ "$HTTP_STATUS" -eq 200 ]; then
    # Si la requête est réussie, enregistrer la réponse et les URLs des images de chats
    log "Successful response from API"  # Enregistrer la réussite de la réponse dans le fichier de log.
    log "Response: $RESPONSE_BODY"  # Enregistrer le corps de la réponse.
    echo "Cat image URLs:"  # Afficher les URLs des images de chats en sortie standard.
    echo $RESPONSE_BODY | jq '.[].url'  # Extraire et afficher les URLs à partir de la réponse JSON.
else
    # Si une erreur survient, enregistrer le code d'erreur et la réponse de l'API
    log "API request failed with status $HTTP_STATUS"  # Enregistrer l'échec de la requête dans le fichier de log.
    log "Response: $RESPONSE_BODY"  # Enregistrer le corps de la réponse en cas d'erreur.
    echo "Failed to get data from API. Check $LOG_FILE for details."  # Informer l'utilisateur de vérifier le fichier de log pour les détails de l'échec.
fi

# Nettoyage après l'exécution
rm response.json  # Supprimer le fichier temporaire contenant la réponse de l'API pour nettoyer l'espace de travail.
