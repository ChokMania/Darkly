# Explications
Dans le footer de toutes pages il y un lien "Bornsec qui nous mene vers une page "**TAMERE**" (en sha216).
Quand on inspecte cette page, on peut trouver un commentaire assez long , mais avec 2 informations interessantes :
<pre>You must cumming from : "https://www.nsa.gov/" to go to the next step
</pre>
<pre>Let's use this browser : "ft_bornToSec". It will help you a lot.</pre>

On utilise la commande suivante :
<pre><code>curl -e https://www.nsa.gov/ -A "ft_bornToSec" 'http://192.168.1.175/?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c' | grep flag
</code></pre>

Qui avec le <code>-e https://www.nsa.gov/</code> nous permet de preciser notre Referrer (là d'ou l'on vient) et le <code>-A "ft_bornToSec"</code> qui nous permet quant a lui, il nous permet de préciser note User Agent (browser)

# Comment l'éviter ?
Mettre une page de connexion s'il y a des donnes à proteger et ne pas laisser un referer ou un browser y acceder.