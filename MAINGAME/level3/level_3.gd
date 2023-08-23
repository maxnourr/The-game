extends Node
var x = 0
var base1
var base2

# Called when the node enters the scene tree for the first time.
func _ready():
	if(Genome.genomes.size() == 1):
		Genome.genomes.push_back(Genome.GFP)
	base1 = $AMP.position.y
	base2 = $AMP2.position.y
	Global.level = "res://level3/level_3.tscn"
	$main/explanation/Label.text = " \n \n \n \n \n ampiciline resistance mutation can happen \n in order to be sure that our genes \n are the right one, it can be usefull \n to visualy change the bacteria."
	$background/ColorRect.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if x>=314:
		x = 0
	x += 40*delta
	$AMP.position.y = base1 + cos(0.1*x)*100
	$AMP2.position.y = base2 + cos(0.1*x + 3.14)*100


func _on_area_2d_area_entered(area):
	if PlayerVar.gfp == true:
		PlayerVar.win = 1
	else:
		PlayerVar.win = 2
	
	PlayerVar.moving = false
