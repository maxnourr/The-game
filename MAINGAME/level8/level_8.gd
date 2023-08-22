extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.level = "res://level8/level_8.tscn"
	$main/background/ColorRect.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
