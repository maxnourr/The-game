extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if PlayerVar.follow:
		position.x = PlayerVar.PlayerX
		


func _on_area_entered(area):
	if area.name == "bacteria":
		if PlayerVar.EC20:
			PlayerVar.follow = true
		
		
