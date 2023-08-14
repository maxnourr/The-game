extends Node

var game = ["res://minijeu_1/ampi_game.tscn","res://minijeu_2/node.tscn","res://minijeu_3/Plasmid_Game.tscn","res://minijeu_4/feed_bacteria_game.tscn","res://minijeu_5/node.tscn","res://minijeu_6/node.tscn","res://minijeu_7/wash_game.tscn","res://minijeu_8/game_1.tscn","res://minijeu_9/game9.tscn","res://minijeu_10/node.tscn","res://minijeu_11/game.tscn","res://minijeu_12/centrifuge_game.tscn","res://minijeu_13/game.tscn","res://minijeu_14/GFP_game.tscn","res://minijeu_15/clothe_game.tscn"]

var do_game = game.duplicate()
var coins = 0
var start_score = 0
var max_score = 0

var win = false
var on_randon = false
var on_hard_core = false
var first = true
var rng = RandomNumberGenerator

func pass_game():
	if win or first: 
		if first:
			start_score = coins
			first = false
		randomize()
		if do_game.is_empty():
			do_game = game.duplicate()
		var game_to_load = do_game[randi() % do_game.size()]
		do_game.erase(game_to_load)
		to_load(game_to_load)
	else: 
		to_game_list()

func to_load(G):
	win = false
	if G in game:
		get_tree().change_scene_to_file(G)
	
func to_menu():
	get_tree().change_scene_to_file("res://menu.tscn")
	
func to_game_list():
	get_tree().change_scene_to_file("res://game_list.tscn")
	
# Note: This can be called from anywhere inside the tree. This function is
# path independent.
# Go through everything in the persist category and ask them to return a
# dict of relevant variables.
func save_game():
	
	var save_dict = {
		"max_score" : max_score,
		"coins" : coins
	}
	
	var file = FileAccess.open("savegame.save",FileAccess.WRITE)
	file.store_var(save_dict)
	file.close()
	
func load_game():
	var file = FileAccess.open("savegame.save",FileAccess.READ)
	if file !=null:
		var save_dict = file.get_var()
		max_score = save_dict.max_score
		coins = save_dict.coins
	
func blanck():
	max_score = 0
	coins = 0
	

