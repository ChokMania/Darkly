# Explications
Dans le footer present sur a peu près toutes les pages, il y a trois lines vers Facebook, Twitter, Instagram:

```html
<ul class="icons">
	<li><a href="index.php?page=redirect&;site=facebook" class="icon fa-facebook"></a></li>
	<li><a href="index.php?page=redirect&;site=twitter" class="icon fa-twitter"></a></li>
	<li><a href="index.php?page=redirect&;site=instagram" class="icon fa-instagram"></a></li>
</ul>
```
On observe qu'il ne s'agit pas d'un simple lien, mais d'une redirection vers le site en question:
<pre><code>index.php?page=redirect&;site=</code></pre>

On peut ainsi rediriger vers n'importe quel site, comme dans l'exemple:
<pre><code>index.php?page=redirect&site=www.google.fr</code></pre>

# Comment l'éviter ?
Il suffit de mettre un check dans le backend du site sur lequel la demande a été efféctué avant d'effectuer le redirect.
Ou il suffit de mettre le lien directement sans faire de redirection.
