extends Control

var width = 0
var height =0

func _ready():
	pass

			
func _on_game_1_pressed():
	get_tree().change_scene_to_file("res://game_1.tscn")

func _on_game_2_pressed():
	pass # Replace with function body.

func _on_game_3_pressed():
	pass # Replace with function body.


func _on_return_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
