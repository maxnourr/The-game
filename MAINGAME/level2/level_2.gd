extends Node
var x = 0
var base1
var base2
var base3
# Called when the node enters the scene tree for the first time.
func _ready():
	base1 = $AMP.position.y
	base2 = $AMP2.position.y
	base3 = $AMP3.position.y
	Global.level = "res://level2/level_2.tscn"
	$main/explanation/Label.text = " \n \n \n \n \n ampicilline is a common antibiotic.\n In order to only keep genetically modified \n bacterias, we use it paired with \n a resistance gene \n"
	$main/background/ColorRect.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if x>=314:
		x = 0
	x +=1
	$AMP.position.y = base1 + cos(0.1*x)*100
	$AMP2.position.y = base2 + cos(0.1*x + 3.14)*100
	$AMP3.position.y = base3 + cos(0.1*x)*100
	
