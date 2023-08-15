extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$player/Sprite2D.modulate = PlayerVar.player_color
	for n in Genome.plasmids.size(): #check tout les plasmids
			for i in Genome.plasmids[n].size(): #check tout les genes du plasmid n
				Express.express(Genome.plasmids[n][i])
				if(Genome.plasmids[n][i].State == false): #arrête la lecture du plasmid
					break
		


func _on_editor_button_down():
	get_tree().change_scene_to_file("res://build.tscn")
