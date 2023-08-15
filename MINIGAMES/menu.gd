extends Control


func _ready():
	GlobalVar.load_game()

func _on_select_game_pressed():
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(0.8).timeout
	GlobalVar.to_game_list()


func _on_music_pressed():
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(0.8).timeout
	pass # Replace with function body.

func _on_quit_pressed():
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(0.8).timeout
	GlobalVar.save_game()
	get_tree().quit()

func _on_button_pressed():
	$AudioStreamPlayer2D.play()
	await get_tree().create_timer(0.8).timeout
	GlobalVar.blanck()
