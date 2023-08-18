extends Node

var first_open = true
var game = ["res://tuto/tuto.tscn","res://level1/level1.tscn","res://level2/level2.tscn","res://level3/level3.tscn","res://level4/level4.tscn","res://end/end.tscn"]
var do_game = game.duplicate()
var coins = 0
var current_level = 0
var max_level = 0

var win = false
var rng = RandomNumberGenerator

var button = load("res://click.mp3")
var game_m = load("res://FT5records.mp3")
var game_m1 = load("res://FT5records game 1.mp3")
var game_m2 = load("res://FT5records game 2.mp3")
var game_me = load("res://FT5records menu.mp3")
var music = true
	
func button_sound():
	$button_sound.play()
	await get_tree().create_timer(0.8).timeout
	
	
func music_game1():
	if music and not $game_musicrandom.playing:
		$game_musichard.stop()
		$menu_music.stop()
		$game_musicrandom.play()
	
func music_game2():
	if music and not $game_musichard.playing:
		$menu_music.stop()
		$game_musicrandom.stop()
		$game_musichard.play()

func music_menu():
	if music and not $menu_music.playing:
		$game_musichard.stop()
		$game_musicrandom.stop()
		$menu_music.play()
		
func music_stop():
	$game_musichard.stop()
	$game_musicrandom.stop()
	$menu_music.stop()

func to_load(G):
	win = false
	if G in game:
		get_tree().change_scene_to_file(G)
	
func to_menu():
	get_tree().change_scene_to_file("res://menu.tscn")
	
func to_game_list():
	get_tree().change_scene_to_file("res://game_list.tscn")
	
func to_credit():
	get_tree().change_scene_to_file("res://credit.tscn")
	
# Note: This can be called from anywhere inside the tree. This function is
# path independent.
# Go through everything in the persist category and ask them to return a
# dict of relevant variables.
func save_game():
	var save_dict = {
		"coins" : coins,
		"current_level" : current_level,
		"max_level" : max_level
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
		max_level = save_dict.max_level
	
func blanck():
	current_level = 0
	coins = 0
	max_level = 0
		