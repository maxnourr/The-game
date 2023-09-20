extends Node
var max_price = 600

# Called when the node enters the scene tree for the first time.
func _ready():
	$main/explanation/Label.text = "[center]Certain molecules can inhibit the genomes. \n Some genes can change your shape, use that to your advantage[/center]"
	$Price.text = str(PlayerVar.cost)+"/"+str(max_price)
	
	GlobalVar.level = "res://level8/level_8.tscn"
	$background/ColorRect.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cell_wall_area_entered(area):
	PlayerVar.win = 2
