extends Node
var x = 0
var base1
var base2

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.level = "res://level1/level_1.tscn"
	$main/explanation/Label.text = "level1 text"
	$background/ColorRect.visible = true
	base1 = $acid.position.y
	base2 = $acid2.position.y
	$main/explanation/Label.text = "[center]Welcome little bacteria to your first mission. \n today, we're going to the guts!!!! However first we need to survive the stomach acids. To do so, find a way to hide yourself [/center] "
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if x>=314:
		x = 0
	x += 40*delta
	$acid.position.y = base1 + cos(0.1*x)*100
	$acid2.position.y = base2 + cos(0.1*x + 3.14)*100


func _on_area_2d_area_entered(area):
	PlayerVar.win = 1
	PlayerVar.moving = false
