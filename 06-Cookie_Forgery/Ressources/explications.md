# Explications
Dans toutes les pages, nous pouvons acceder aux cookies de session.

En allant dans le Devtool>Application nous pouvons voir qu'il y a un cookie:

<pre><code>I_am_admin</code></pre>

Et il possede une value:

<pre><code>68934a3e9455fa72420237eb05902327</code></pre>

Qui est en MD5. Donc on applique un MD5 et on trouve que cette value traduite est :

<pre><code>false</code></pre>
Ainsi on remplace ce **false** par **true** (en MD5) et on trouve le flag.


# Comment l'éviter ?
Ne pas utiliser les cookies comme outils de verification d'admin, et faire une authentification basée sur une base de donnée. 