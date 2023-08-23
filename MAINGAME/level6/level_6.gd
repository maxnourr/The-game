extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	if(Genome.genomes.size() == 4):
		Genome.genomes.push_back(Genome.IL10)
	Global.level = "res://level6/level_6.tscn"
	$background/ColorRect.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
