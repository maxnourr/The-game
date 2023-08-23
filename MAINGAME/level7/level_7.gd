extends Node
var x

# Called when the node enters the scene tree for the first time.
func _ready():
	if(Genome.genomes.size() == 5):
		Genome.genomes.push_back(Genome.EC20)
	Global.level = "res://level7/level_7.tscn"
	$background/ColorRect.visible = false
	x = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if PlayerVar.Play:
		x += 1
		print(str(x))
		if !PlayerVar.follow:
			if $cadmium.position.x < 590:
				$cadmium.position.x +=1
			else:
				$cadmium.position.y +=1
	if x > 800 and PlayerVar.SPAC:
		PlayerVar.win = 2



func _on_area_2d_area_entered(area):
	if $cadmium.position.x > 600:
		PlayerVar.win = 1
	else:
		PlayerVar.win = 2 
