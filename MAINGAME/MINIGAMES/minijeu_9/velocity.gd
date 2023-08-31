extends Area2D
var min = 0
var max = 100
var step = 1.8

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var rot = $RigidBody2D.currentVelocity*step-90
	if rot >= 90:
		$val.rotation_degrees =90
	else:
		$val.rotation_degrees = rot
