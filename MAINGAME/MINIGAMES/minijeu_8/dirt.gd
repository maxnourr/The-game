extends Area2D
static var type = "dirt"
#static var instance_number = 0

func _ready():
	pass
	#instance_number += 1

func sprite_disappear():
	queue_free() 
