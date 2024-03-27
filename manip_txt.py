import csv


# Définition des données à ajouter au fichier CSV
donnees = [
    ["Jean", 25, "Paris"],
    ["Marie", 30, "Lyon"],
    ["Pierre", 22, "Marseille"],
    ["Sophie", 35, "Toulouse"]
]

# Chemin du fichier CSV à créer
fichier_csv = "donnees.csv"

# Écriture des données dans le fichier CSV
with open(fichier_csv, mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['Nom', 'Âge', 'Ville'])  # Écriture de l'en-tête
    writer.writerows(donnees)  # Écriture des données
    print("Le fichier CSV a été créé avec succès!")
