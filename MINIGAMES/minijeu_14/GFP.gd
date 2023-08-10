extends Area2D

var taken= false
var destroyed = false
var type = "gfp"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area.type == "bacteria":
		taken = true
	if area.type == "obstacle":
		destroyed = true
	hide()
	area.change("gfp")
	
