extends Node
#le singleton responsable des variables de la bactérie (couleurs, resistances etc...)
var default_player_color = Color(1,1,1)
var player_color = default_player_color #couleur du joueur
var gfp #bool à oui si gfp présent
var cost = 0
var amp = false
var ampr= false
var alive = true


#quand un élément précis rentre en contacte avec notre bactérie, son booléen associé passe à true-------
var lactose = false


#------------------------------
#met les valeurs à defaut, giga usefull
func default():
	player_color =  Color(1,1,1)
	gfp = false
	lactose = false
	amp = false
	ampr = false
	alive = true
	
