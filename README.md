## **Manuel d'installation**

### **1. Prérequis**

Assure-toi que les éléments suivants sont installés :

1. **Python 3.x** : Requis pour exécuter le projet.
2. **MySQL** : Utilisé comme base de données.
3. **Pip** : Le gestionnaire de paquets Python (souvent installé avec Python).
   Flask==2.2.3
   Flask-SQLAlchemy==2.5.1
   PyMySQL==1.0.2

## Installation des dépendances

Installez les bibliothèques nécessaires avec :

```bash
pip install -r requirements.txt
```

### **2. Installation du projet**

#### a) **Télécharger le projet**

1. Place le dossier contenant tous les fichiers du projet sur ton ordinateur.

   * Nom du dossier principal : `Projet Basketball`.

## **Manuel d'usage**

### **1. Fonctionnalités disponibles**

1. **Accueil** :
   * Accéder à la page principale en allant sur [http://127.0.0.1:5000/](http://127.0.0.1:5000/).
   * Choisir entre "Accès utilisateur" et "Accès administrateur".
2. **Liste des joueurs (`/players`)** :
   * Voir la liste de tous les joueurs enregistrés dans la base.
3. **Détails d'un joueur (`/player/<Player_ID>`)** :
   * Obtenir les informations détaillées d’un joueur en remplaçant `<Player_ID>` par un ID valide dans l'URL.
4. **Gestion des clubs (`/admin/manage_clubs`)** :
   * Afficher et gérer les clubs enregistrés dans la base.
5. **Ajouter un joueur (`/admin/add_player`)** :
   * Ajouter un joueur via un formulaire simple.

---

### **2. Utilisation**

#### **a) Page d'accueil**

1. Lance l'application Flask.
2. Ouvre l'URL [http://127.0.0.1:5000/](http://127.0.0.1:5000/) dans ton navigateur.

#### **b) Gérer les joueurs**

1. Accéder à `/players` pour voir tous les joueurs.
2. Ajouter un joueur via `/admin/add_player` :
   * Remplis le formulaire avec les informations nécessaires (nom, date de naissance, club, etc.).

#### **c) Gérer les clubs**

1. Accède à `/admin/manage_clubs` pour afficher ou gérer les clubs.
2. Ajoute, modifie ou supprime des clubs directement via la base (à implémenter si besoin).
