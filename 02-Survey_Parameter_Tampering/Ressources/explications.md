# Explications
Dans la page "survey", il y un formulaire afin de voter pour le "grade" de Laurie, Mathieu, Thor, Ly, Zaz :

```html
<form action="#" method="post" data-children-count="1">
	<input type="hidden" name="sujet" value="2">
	<select name="valeur" onchange="javascript:this.form.submit();">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
		<option value="10">10</option>
	</select>
</form>
```
On observe que le formulaire s'applique dès lors qu'un changement a été appliqué avec la **value** de l'option choisie :
<code>javascript:this.form.submit();</code> 
Donc il suffit de changer la value pour fausser le survey.

# Comment l'éviter ?
Il suffit de mettre un check dans le backend de la value avant d'appliquer le changement.

# Comment l'exploiter ?