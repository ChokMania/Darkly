
# Explications
Dans toutes les pages, nous pouvons acceder aux cookies de session.

En allant dans le Devtool>Application nous pouvons voir qu'il y a un cookie:

<pre><code>I_am_admin</code></pre>

Et il possede une value:

<pre><code>68934a3e9455fa72420237eb05902327</code></pre>

Qui est en MD5. Donc on applique un MD5 et on trouve que cette value traduite est :

<pre><code>False</code></pre>
Ainsi on remplace ce **False** par un True (en MD5) et on trouve le flag. 


# Comment éviter cela ?
Ne pas utiliser les cookies comme outils de verification d'admin, et faire une authentification basée sur des users avec privilèges. 