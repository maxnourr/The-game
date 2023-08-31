extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	
	GlobalVar.level = "res://level6/level_6.tscn"
	$background/ColorRect.visible = false
	$main/explanation/Label.text = "[center]T cells do not like foreign body, if only there was a mollecule able to calm them...[/center]"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
