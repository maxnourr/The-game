extends Node
var max_price = 600

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in Genome.plasmids.size():
			PlayerVar.cost += 100
			for i in Genome.plasmids[n].size():
				PlayerVar.cost += Genome.plasmids[n][i].Price
				
	$Price.text = str(PlayerVar.cost)
	$Price.text += "/"
	$Price.text += str(max_price)
	
	Global.level = "res://level8/level_8.tscn"
	$main/background/ColorRect.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cell_wall_area_entered(area):
	PlayerVar.win = 2
