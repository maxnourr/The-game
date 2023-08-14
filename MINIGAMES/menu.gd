extends Control


func _ready():
	GlobalVar.load_game()

func _on_select_game_pressed():
	get_tree().change_scene_to_file("res://game_list.tscn")


func _on_music_pressed():
	pass # Replace with function body.

func _on_quit_pressed():
	GlobalVar.save_game()
	get_tree().quit()

func _on_button_pressed():
	GlobalVar.blanck()
