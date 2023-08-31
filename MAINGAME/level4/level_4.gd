extends Node


# Called when the node enters the scene tree for the first time.
func _ready():

	GlobalVar.level = "res://level4/level_4.tscn"
	$background/ColorRect.visible = false
	$main/explanation/Label.text = "[center]Welcome in the body! You will need to stay there for a bit, try sticking to the mucus![/center]"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	if PlayerVar.SPAC:
		PlayerVar.win = 1
		

func _on_area_2d_2_area_entered(area):
	PlayerVar.win = 2
	PlayerVar.moving = false
