extends Control


func _ready():
	if GlobalVar.first_open:
		GlobalVar.load_game()
		GlobalVar.first_open = false
	Global.music_menu()

func _on_select_game_pressed():
	Global.button_sound()
	GlobalVar.to_minigame_list()


func _on_music_pressed():
	Global.button_sound()
	Global.music = !Global.music
	if Global.music == false:
		Global.music_stop()
	else:
		Global.music_menu()

func _on_quit_pressed():
	Global.button_sound()
	GlobalVar.save_game()
	GlobalVar.to_menu()

func _on_button_pressed():
	Global.button_sound()
	if $MarginContainer/VBoxContainer/restart.text == "restart":
		$MarginContainer/VBoxContainer/restart.text = "you are sure ? click if yes"
	elif $MarginContainer/VBoxContainer/restart.text == "you are sure ? click if yes":
		$MarginContainer/VBoxContainer/restart.text = "restart"
		GlobalVar.blanck()
		Global.reset()

func _on_credit_pressed():
	Global.button_sound()
	GlobalVar.to_credit()


func _on_how_pressed():
	Global.button_sound()
	GlobalVar.to_rule()


func _on_template_pressed():
	Global.button_sound()
	GlobalVar.to_template()


func _on_best_player_pressed():
	Global.button_sound()
	GlobalVar.to_best_list()
