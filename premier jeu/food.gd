extends Area2D
static var score = 0
static var max = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	max += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_area_entered(area):
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	score +=1

func destroy():
	score = 0
	max = 0
