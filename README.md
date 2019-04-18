# GESTION PRODUITS

## Prérequis
Cette application est compatible `PHP5` et a été testée avec une base de données `MySQL 5.7`.

## Installation
- Copier les fichiers du dossier `www` dans un dossier accessible par le serveur Web.
- Assurez vous que le dossier `uploads` est accessible en lecture et écriture par le serveur Web : `chmod 777 uploads`
- Importez la base de données test à partir du dump SQL `database/gestion_produits.sql`.
- Connectez vous à l'application avec l'url adaptée avec les informations suivantes :
    - Login : `admin`
    - Mot de passe : `password`

## Fonctionnalités
L'application permet de :
- Lister les produits
- Afficher la fiche produit en lecture seule
- Ajouter des produits
- Modifier les produits
- Supprimer les produits
- Pour chaque produit, il est possible d'ajouter autant de photos que nécessaire

## Orchestrateur
Afin de mettre en place un Orchestrateur (Docker Swarm) et de faciliter l'intégration de cette application, plusieurs commandes ont été exécutées :
- docker swarm init --advertise-addr 192.168.9.115
  ==> Initialisation de notre swarm

- docker service create --name registry --publish published=5000,target=5000 registry:2
  ==> Création de notre registry

- docker tag 'tagImage' 127.0.0.1:5000/'nomImage'
  Par exemple : docker tag 99999999 127.0.0.1:5000/php (le tag peut être récupéré par la commande docker images)
  ==> Création des images destinées à l'Orchestrateur

- docker-compose push
  ==> On pousse les images sur notre swarm

- docker stack deploy --compose-file docker-compose.yml stackOrchestrator
  ==> Création d'une stack déployée sur le swarm

Le docker-compose.yml a été mis à jour en conséquence.