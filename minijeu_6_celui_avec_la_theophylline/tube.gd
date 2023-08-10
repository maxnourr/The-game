extends Area2D
var inside = false
var filled = 0;
var required = 130

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if inside:
		filled += 1
		
	$Label.text = str(filled)
	$Label.text += "/"
	$Label.text += str(required)
	
	



func _on_area_entered(area):
	inside = true


func _on_area_exited(area):
	inside = false
