extends Node
#le singleton responsable des variables de la bactérie (couleurs, resistances etc...)
var default_player_color = Color(1, 1, 1, 0.624)
var player_color = default_player_color #couleur du joueur
var gfp = false #bool à oui si gfp présent
var cost = 0

var PlayerX
var PlayerY
var Play
var acidr = false
var ampr= false
var alive = true
var win = 0 #win n'est pas un booléen ici, 0 = neutre, 1 = win, 2 = loose
var moving = true
var follow = false

#quand un élément précis rentre en contacte avec notre bactérie, son booléen associé passe à true-------
var lactose = false
var UV = false
var Mucus = false
var Interlekin = false
var EC20 = false
var SPAC = false


#------------------------------
#met les valeurs à defaut, giga usefull
func default():
	player_color =  default_player_color
	gfp = false
	lactose = false
	ampr = false
	alive = true
	win = 0
	UV = false
	Mucus = false
	SPAC = false
	moving = true
	Interlekin = false
	Play = false
	EC20 = false
	acidr = false
