extends Node

#global
var first_open = true
var coins = 0

#maingame
var game = ["res://tuto/tuto.tscn","res://level1/level_1.tscn","res://level2/level_2.tscn","res://level3/level_3.tscn","res://level4/level_4.tscn","res://level5/level_5.tscn","res://level6/level_6.tscn","res://level7/level_7.tscn","res://level8/level_8.tscn"]
var current_level = 0
var max_level = 0
var level

#minigames
var minigame = ["res://MINIGAMES/minijeu_1/ampi_game.tscn","res://MINIGAMES/minijeu_2/node.tscn","res://MINIGAMES/minijeu_3/Plasmid_Game.tscn","res://MINIGAMES/minijeu_4/feed_bacteria_game.tscn","res://MINIGAMES/minijeu_5/node.tscn","res://MINIGAMES/minijeu_6/node.tscn","res://MINIGAMES/minijeu_7/wash_game.tscn","res://MINIGAMES/minijeu_8/game_1.tscn","res://MINIGAMES/minijeu_9/game9.tscn","res://MINIGAMES/minijeu_10/node.tscn","res://MINIGAMES/minijeu_11/game.tscn","res://MINIGAMES/minijeu_12/centrifuge_game.tscn","res://MINIGAMES/minijeu_13/game.tscn","res://MINIGAMES/minijeu_14/GFP_game.tscn","res://MINIGAMES/minijeu_15/clothe_game.tscn"]
var minijeu = "res://MINIGAMES/scene_global.tscn"
var game_to_load
var do_game = minigame.duplicate()

var start_score = 0
var current_score = 0
var max_normal_score = 0
var max_score = 0

var win = 0
var on_randon = false
var on_hard_core = false
var first = true

var best_score = []
var best_player = []

#rng
var rng = RandomNumberGenerator.new()

func pass_game():
	if win == 1 or first: 
		if first:
			start_score = coins
			first = false
		randomize()
		if do_game.is_empty():
			do_game = minigame.duplicate()
		game_to_load = do_game[randi() % do_game.size()]
		do_game.erase(game_to_load)
		to_load(game_to_load)
	else: 
		Global.reset()
		to_minigame_list()
		
func to_load(G):
	win = 0
	if G in game :
		get_tree().change_scene_to_file(G)
	elif G in minigame or G == "res://MINIGAMES/minijeu_template/game.tscn":
		game_to_load = G
		get_tree().change_scene_to_file(minijeu)
		
	
func to_menu():
	get_tree().change_scene_to_file("res://menu.tscn")
	
func to_game_list():
	get_tree().change_scene_to_file("res://game_list.tscn")
	
func to_credit():
	get_tree().change_scene_to_file("res://credit.tscn")
	
func to_minigames():
	get_tree().change_scene_to_file("res://MINIGAMES/minimenu.tscn")
	
func to_minigame_list():
	get_tree().change_scene_to_file("res://MINIGAMES/minigame_list.tscn")
	
func to_best_list():
	get_tree().change_scene_to_file("res://MINIGAMES/best list.tscn")
	
func to_rule():
	get_tree().change_scene_to_file("res://MINIGAMES/rule.tscn")

func to_mainrule():
	get_tree().change_scene_to_file("res://rule.tscn")
	
func to_template():
	to_load("res://MINIGAMES/minijeu_template/game.tscn")
# Note: This can be called from anywhere inside the tree. This function is
# path independent.
# Go through everything in the persist category and ask them to return a
# dict of relevant variables.
func save_game():
	var save_dict = {
		"coins" : coins,
		"current_level" : current_level,
		"max_level" : max_level,
		"max_normal_score" : max_normal_score,
		"max_score" : max_score,
		"best_score" : best_score,
		"best_player" : best_player
	}
	var file = FileAccess.open("savegame.save",FileAccess.WRITE)
	file.store_var(save_dict)
	file.close()
	
func load_game():
	var file = FileAccess.open("savegame.save",FileAccess.READ)
	if file !=null:
		var save_dict = file.get_var()
		coins = save_dict.coins
		current_level = save_dict.current_level
		max_level = 8
		#max_level = save_dict.max_level
		
		
		max_normal_score = save_dict.max_normal_score
		max_score = save_dict.max_score
		best_score = save_dict.best_score
		best_player = save_dict.best_player
	
func blanck():
	coins = 0
	current_level = 0
	max_level = 1
	
	max_normal_score = 0
	max_score = 0
	best_player = []
	best_score = []
		
func best_list(N):
	var placed = false
	if best_score.is_empty():
		placed = true
		best_score.append(current_score)
		best_player.append(N)
	else:
		var S = best_score.size()
		for i in range(S):
			if placed == false:
				if best_player[i] == N:
					if current_score > best_score[i]:
						best_score.insert(i,current_score)
						best_player.insert(i,N)
						best_score.remove_at(i+1)
						best_player.remove_at(i+1)
					placed = true
				elif current_score > best_score[i]:
					best_score.insert(i,current_score)
					best_player.insert(i,N)
					placed = true
			elif best_player[i] == N:
				best_score.remove_at(i)
				best_player.remove_at(i)
		
		if best_score.size() > 5:
			best_player.pop_back()
			best_score.pop_back()
		
		if best_score.size() <5 and placed == false:
			best_score.append(current_score)
			best_player.append(N)
