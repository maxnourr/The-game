extends Node
var x


# Called when the node enters the scene tree for the first time.
func _ready():
	
	GlobalVar.level = "res://level7/level_7.tscn"
	$background/ColorRect.visible = false
	$main/explanation/Label.text = "[center]Here is your biggest challenge so far. Use what you have learned to catch the toxic cadmium and leave the body with it.[/center]"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if PlayerVar.Play:
		if !PlayerVar.follow:
			if $cadmium.position.x < 590:
				$cadmium.position.x += delta*100
			else:
				$cadmium.position.y += delta*100



func _on_area_2d_area_entered(area):
	if $cadmium.position.x > 600:
		PlayerVar.win = 1
	else:
		PlayerVar.win = 2 
