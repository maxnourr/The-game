extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.level = "res://level4/level_4.tscn"
	$main/background/ColorRect.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	if PlayerVar.SPAC:
		PlayerVar.win = 1
		

func _on_area_2d_2_area_entered(area):
	PlayerVar.win = 2
	PlayerVar.moving = false
