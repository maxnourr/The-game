extends Area2D
var scalx
var scaly

# Called when the node enters the scene tree for the first time.
func _ready():
	scalx = 0.4
	scaly = 0.4
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if PlayerVar.FtsZ == true and PlayerVar.Play:
		scale.x = scalx
		scale.y = scaly
		if scalx < 0.7:
			scalx += 0.01
		if scaly >0.1:
			scaly += -0.01
