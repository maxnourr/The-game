extends Node

var button = load("res://click.mp3")
var game_m = load("res://FT5records.mp3")
var game_m1 = load("res://FT5records game 1.mp3")
var game_m2 = load("res://FT5records game 2.mp3")
var game_me = load("res://FT5records menu.mp3")
var music = true

func reset():
	for g in GlobalVar.game:
		var level = load(g).instantiate()
		level.reset()
		level.queue_free()
		
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
		
