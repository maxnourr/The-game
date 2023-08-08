extends Control



func _on_select_game_pressed():
	get_tree().change_scene_to_file("res://game_list.tscn")


func _on_music_pressed():
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().quit()
