extends Node
var x = 0
var step = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	GlobalVar.level = "res://level5/level_5.tscn"
	$background/ColorRect.visible = false
	$main/explanation/Label.text = "[center]It is one thing to stick to the mucus, it is an other to stop. Find a way to only express SpaC for a short period of time[/center]"
	step = false
	x = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if PlayerVar.Play:
		x +=1
	
	if x > 1000 and PlayerVar.SPAC == true:
		PlayerVar.win = 2


func _on_area_2d_2_area_entered(area):
	if PlayerVar.SPAC == true:
		step = true


func _on_area_2d_area_entered(area):
	if step:
		PlayerVar.win = 1
	else:
		PlayerVar.win = 2
