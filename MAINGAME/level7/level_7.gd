extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.level = "res://level7/level_7.tscn"
	$main/background/ColorRect.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if PlayerVar.Play and !PlayerVar.follow:
			if $cadmium.position.x < 590:
				$cadmium.position.x +=1
			else:
				$cadmium.position.y +=1

