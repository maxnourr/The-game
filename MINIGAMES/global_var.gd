extends Node

var game = ["res://minijeu_1/ampi_game.tscn","res://minijeu_2/node.tscn","res://minijeu_3/Plasmid_Game.tscn","res://minijeu_4/feed_bacteria_game.tscn","","res://minijeu_6/node.tscn","res://minijeu_7/wash_game.tscn","res://minijeu_8/game_1.tscn","res://minijeu_9/game9.tscn","res://minijeu_10/node.tscn","","res://minijeu_12/centrifuge_game.tscn","res://minijeu_13/game.tscn","res://minijeu_14/GFP_game.tscn","res://minijeu_15/clothe_game.tscn"]

#en attendant tout les jeux
var for_random_mode = ["res://minijeu_1/ampi_game.tscn","res://minijeu_2/node.tscn","res://minijeu_3/Plasmid_Game.tscn","res://minijeu_4/feed_bacteria_game.tscn","res://minijeu_6/node.tscn","res://minijeu_7/wash_game.tscn","res://minijeu_8/game_1.tscn","res://minijeu_9/game9.tscn","res://minijeu_10/node.tscn","res://minijeu_12/centrifuge_game.tscn","res://minijeu_13/game.tscn","res://minijeu_14/GFP_game.tscn","res://minijeu_15/clothe_game.tscn"]

var do_game = for_random_mode.duplicate()
var coins = 0
var on_randon = false
var rng = RandomNumberGenerator

func pass_game():
	randomize()
	if do_game.is_empty():
		do_game = for_random_mode.duplicate()
	var game_to_load = do_game[randi() % do_game.size()]
	var i = do_game.find(game_to_load)
	do_game.erase(game_to_load)
	to_load(game_to_load)

func to_load(to_load):
	if to_load != "":
		get_tree().change_scene_to_file(to_load)
	
func to_menu():
	get_tree().change_scene_to_file("res://menu.tscn")
	
func to_game_list():
	get_tree().change_scene_to_file("res://game_list.tscn")
