extends Node

static var coin = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_minigame_1_pressed():
	get_tree().change_scene_to_file("res://minijeu_1/ampi_game.tscn")


func _on_minigame_3_pressed():
	get_tree().change_scene_to_file("res://minijeu_3/plasmid_game.tscn")


func _on_minigame_4_pressed():
	get_tree().change_scene_to_file("res://minijeu_4/clothe_game.tscn")


func _on_minigame_5_pressed():
	get_tree().change_scene_to_file("res://minijeu_5/wash_game.tscn")
