extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.level = "res://level1/level_1.tscn"
	$main/explanation/Label.text = "level1 text"
	$main/background/ColorRect.visible = true
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
