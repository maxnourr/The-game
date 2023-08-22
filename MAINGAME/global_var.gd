extends Node
var first_open = true
var game = ["res://main.tscn","n","","","",""]
var do_game = game.duplicate()
var coins = 0
var current_level = 0
var max_level = 0
var level

var win = false
var rng = RandomNumberGenerator

var button = load("res://click.mp3")
var game_m = load("res://FT5records.mp3")
var game_m1 = load("res://FT5records game 1.mp3")
var game_m2 = load("res://FT5records game 2.mp3")
var game_me = load("res://FT5records menu.mp3")
var music = true

func click():
	$click.play()
	await get_tree().create_timer(0.8).timeout
	

func body():
	if $body.playing == false:
		$body.play()
	$build/office_ambiance.stop()
	$game_musichard.stop()
	$menu_music.stop()
	$game_musicrandom.stop()
	$build.stop()
	
	
func theme_build():
	$build/office_ambiance.play()
	$body.stop()
	if music and not $build.playing:
		$game_musichard.stop()
		$menu_music.stop()
		$game_musicrandom.stop()
		$build.play()
		
func button_sound():
	$button_sound.play()
	await get_tree().create_timer(0.8).timeout
	
	
func music_game1():
	$build/office_ambiance.stop()
	$body.stop()
	if music and not $game_musicrandom.playing:
		$game_musichard.stop()
		$menu_music.stop()
		$game_musicrandom.play()
		$build.stop()
	
func music_game2():
	$build/office_ambiance.stop()
	$body.stop()
	if music and not $game_musichard.playing:
		$menu_music.stop()
		$game_musicrandom.stop()
		$game_musichard.play()
		$build.stop()
		

func music_menu():
	$build/office_ambiance.stop()
	$body.stop()
	if music and not $menu_music.playing:
		$game_musichard.stop()
		$game_musicrandom.stop()
		$menu_music.play()
		$build.stop()
		
func music_stop():
	$game_musichard.stop()
	$game_musicrandom.stop()
	$menu_music.stop()
	$build.stop()

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
		
