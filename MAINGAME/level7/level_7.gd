extends Node
var x

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.level = "res://level7/level_7.tscn"
	$main/background/ColorRect.visible = false
	x = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if PlayerVar.Play and !PlayerVar.follow:
			if $cadmium.position.x < 590:
				$cadmium.position.x +=1
			else:
				$cadmium.position.y +=1
	x += 1
	if x > 900 and PlayerVar.SPAC:
		PlayerVar.win = 2



func _on_area_2d_area_entered(area):
	if $cadmium.position.x > 600:
		PlayerVar.win = 1
	else:
		PlayerVar.win = 2 
