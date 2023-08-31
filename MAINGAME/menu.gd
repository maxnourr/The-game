extends Control
var switch = 0

func _ready():
	if GlobalVar.first_open:
		GlobalVar.load_game()
		GlobalVar.first_open = false
	Global.music_menu()
	
	
func _process(delta):
	switch += 1
	if switch > 50:
			switch = 0
			if $bacteria.texture == load("res://sprites/gauche.png"):
				$bacteria.texture = load("res://sprites/droite.png")
			else:
				$bacteria.texture = load("res://sprites/gauche.png")

func _on_select_game_pressed():
	Global.button_sound()
	GlobalVar.to_game_list()


func _on_music_pressed():
	Global.button_sound()
	Global.music = not Global.music
	if Global.music == false:
		Global.music_stop()
	else:
		Global.music_menu()

func _on_quit_pressed():
	Global.button_sound()
	GlobalVar.save_game()
	get_tree().quit()

func _on_restart_pressed():
	Global.button_sound()
	if $MarginContainer/VBoxContainer/restart.text == "restart":
		$MarginContainer/VBoxContainer/restart.text = "you are sure ? click if yes"
	elif $MarginContainer/VBoxContainer/restart.text == "you are sure ? click if yes":
		$MarginContainer/VBoxContainer/restart.text = "restart"
		GlobalVar.blanck()


func _on_credit_pressed():
	Global.button_sound()
	GlobalVar.to_credit()

func _on_minigames_pressed():
	Global.button_sound()
	GlobalVar.to_minigames()
