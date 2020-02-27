# Explications
Dans la page "Recover", il y un formulaire pour envoyer une demande de mot de passe :
```html
<form action="#" method="POST">
	<input type="hidden" name="mail" value="webmaster@borntosec.com" maxlength="15">
	<input type="submit" name="Submit" value="Submit">
</form>
```
On observe que la **value** contient l'email pour recover le mot de passe.
Ainsi il est possible de changer cet email et de mettre le sien.

# Comment l'éviter ?
Il suffit de mettre l'email dans le backend (donc non accessible dans le front) comme dans l'exemple suivant :
```php
//mail(string $to, string $subject, string $message) : bool
if (isset($_POST) && $_POST['submit']) {
	mail ("webmaster@borntosec.com",
		  "Recover Password",
		  "Someone ask for a new password");
}
```

# Comment l'exploiter ?