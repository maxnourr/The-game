extends Node

var win = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$tube.check($"seringue true".fill)
	$tube2.check($"seringue true".fill)
	$tube3.check($"seringue true".fill)
	
	if $tube.score == $tube.required_score:
		win = true
		

func _on_chaudron_area_entered(area):
	area.fill += 5 # Replace with function body.
