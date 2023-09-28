extends Node
#le singleton responsable des variables de la bactérie (couleurs, resistances etc...)
var default_player_color = Color(1, 1, 1, 0.624)
var cost = 0
var win = 0 #win n'est pas un booléen ici, 0 = neutre, 1 = win, 2 = loose


var PlayerX
var PlayerY
var Play
var alive = true
var moving = true
var follow = false
var player_color = default_player_color #couleur du joueur

#bacterie 1
var ampr= false
var FtsZ = false
var Luxl = false
var Biofertiliser = false
var EC20 = false
var SPAC = false
var Mucus = false
var Interlekin = false
var gfp = false #bool à oui si gfp présent

#bacterie 2
var ampr_2= false
var FtsZ_2 = false
var Luxl_2 = false
var Biofertiliser_2 = false
var EC20_2 = false
var SPAC_2 = false
var Mucus_2 = false
var Interlekin_2 = false
var gfp_2 = false #bool à oui si gfp présent
var player_color_2 = default_player_color #couleur du joueur



#quand un élément précis rentre en contacte avec notre bactérie, son booléen associé passe à true-------
var lactose = false
var UV = false
var acidr = false
var AHL = false




#------------------------------
#met les valeurs à defaut, giga usefull
func default():
	player_color =  default_player_color
	lactose = false
	alive = true
	win = 0
	UV = false
	moving = true
	Play = false
	follow = false
	acidr = false
	AHL = false
	SPAC_2 = false
	SPAC = false
	player_color_2 = default_player_color #couleur du joueur
	
	return1()
	return2()

func return1():
	ampr = false
	FtsZ = false
	EC20 = false
	Luxl = false
	Biofertiliser = false
	Mucus = false
	Interlekin = false
	gfp = false
	
func return2():
	ampr_2 = false
	FtsZ_2 = false
	EC20_2 = false
	Luxl_2 = false
	Biofertiliser_2 = false
	Mucus_2 = false
	Interlekin_2 = false
	gfp_2 = false
	
	
