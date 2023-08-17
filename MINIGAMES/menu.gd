extends Control


func _ready():
	Global.music_menu()
	GlobalVar.load_game()

func _on_select_game_pressed():
	Global.button_sound()
	GlobalVar.to_game_list()


func _on_music_pressed():
	Global.button_sound()
	GlobalVar.music = !GlobalVar.music
	if GlobalVar.music == false:
		Global.music_stop()
	else:
		Global.music_menu()

func _on_quit_pressed():
	Global.button_sound()
	GlobalVar.save_game()
	get_tree().quit()

func _on_button_pressed():
	Global.button_sound()
	GlobalVar.blanck()


func _on_select_game_2_pressed():
	Global.button_sound()
	GlobalVar.to_best_list()


func _on_credit_pressed():
	Global.button_sound()
	GlobalVar.to_credit()
