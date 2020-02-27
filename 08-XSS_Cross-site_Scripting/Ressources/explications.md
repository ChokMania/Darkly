# Explications
Sur la page "feedback" du site, il est possible de remplir les champs **Name** et **Message** pour laisser un commentaire.

En écrivant le mot <code>script</code> dans le champ message, on obtient le flag dédié.

C'est un peu tiré par les cheveux comme "faille" mais en gros ça revient à mettre des balises ```<script>``` dans un champ.
On appelle ce genre de faille XSS (Cross Site Scripting).

Il peut en effet arriver que l'input d'un utilisateur récupérée via un champ puisse être éxecutée comme du code.

Voici un exemple classique permettant de vérifier si un site y est sensible:
```html
<script> alert(1) </script>
```

# Comment l'éviter
On peut faire de l'escaping qui va "censurer" les éléments potentiellement dangereux d'une input utilisateur (comme les caractères "<>").

Il existe également des [middlewares](https://helmetjs.github.io/docs/xss-filter/) qui permettent de filtrer ce genre d'attaques:

