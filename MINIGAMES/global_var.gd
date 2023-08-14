extends Node

var game = ["res://minijeu_1/ampi_game.tscn","res://minijeu_2/node.tscn","res://minijeu_3/Plasmid_Game.tscn","res://minijeu_4/feed_bacteria_game.tscn","res://minijeu_5/node.tscn","res://minijeu_6/node.tscn","res://minijeu_7/wash_game.tscn","res://minijeu_8/game_1.tscn","res://minijeu_9/game9.tscn","res://minijeu_10/node.tscn","res://minijeu_11/game.tscn","res://minijeu_12/centrifuge_game.tscn","res://minijeu_13/game.tscn","res://minijeu_14/GFP_game.tscn","res://minijeu_15/clothe_game.tscn"]

var do_game = game.duplicate()
var coins = 0
var score = 0
var max_score = 0

var win = false
var on_randon = false
var on_hard_core = false
var first = true
var rng = RandomNumberGenerator

func pass_game():
	if win or first: 
		if not first:
			score +=1
		else:
			GlobalVar.score = 0
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
