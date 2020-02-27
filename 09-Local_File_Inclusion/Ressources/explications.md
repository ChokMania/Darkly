# Explications

En navigant sur le site, on remarque sur certaines pages que leur URL contient **?page=** 
(ex: http://IP/index.php?page=survey).

Dans ce cas, le mot **survey** réfère au fichier qu'il faut charger sur cette page. On peut alors changer cette URL pour accéder aux autres fichiers du dossier et même remonter l'aborescence:

http://IP/index.php?page=../../../../../../../etc/passwd

Avec l'URL ci-dessus on peut en effet accéder à des données sensibles (mot de passe). Le fichier passwd stocké dans le dossier /etc/ est en effet un cas de figure assez [classique](https://www.offensive-security.com/metasploit-unleashed/file-inclusion-vulnerabilities/).

On appelle cette attaque une Local File Inclusion.

Il est également possible d'éxecuter des programmes sur le serveur en utilisant une méthode similaire (Remote File Inclusion).

# Comment l'éviter

Pour se prémunir de ce type d'attaque, on peut utiliser une base de données pour stocker directement le contenu des fichiers.

On peut aussi utiliser la base données pour y stocker le chemin des fichiers et leur assigner des ID; l'utilisateur n'aura accès qu'à ces ID sans pouvoir changer le chemin d'accès.