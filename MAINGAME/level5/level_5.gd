extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.level = "res://level5/level_5.tscn"
	$main/background/ColorRect.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
