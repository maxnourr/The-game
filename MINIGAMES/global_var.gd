extends Node

var game = ["res://minijeu_1/ampi_game.tscn","res://minijeu_3/Plasmid_Game.tscn","res://minijeu_4/clothe_game.tscn","res://minijeu_5/wash_game.tscn"]
var do_game = ["res://minijeu_1/ampi_game.tscn","res://minijeu_3/Plasmid_Game.tscn","res://minijeu_4/clothe_game.tscn","res://minijeu_5/wash_game.tscn"]
var coins = 0
var on_randon = false
var rng = RandomNumberGenerator

func pass_game():
	var game_to_load = do_game[randi() % do_game.size()]
	var i = do_game.find(game_to_load)
	do_game.erase(game_to_load)
	to_load(game_to_load)

func to_load(to_load):
	get_tree().change_scene_to_file(to_load)
	
func to_menu():
	get_tree().change_scene_to_file("res://ugly_menu.tscn")
