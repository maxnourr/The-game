extends RigidBody2D

var acceleration = 50
var deceleration = -50
var currentVelocity = 0
var setter = false
var notroundedVelocity = 0


func _physics_process(delta):
	# Display current velocity
	
	
	if setter != false :
	# Accelerate the object's velocity when the space button is pressed
		if Input.is_action_pressed("ui_up"):
			notroundedVelocity = currentVelocity + (acceleration * delta) 
			currentVelocity =  round(notroundedVelocity) 
		else:
			notroundedVelocity = currentVelocity + (deceleration * delta) 
			currentVelocity =  round(notroundedVelocity)
		if currentVelocity < 0:
			currentVelocity = 0
		elif currentVelocity > 100:
			currentVelocity = 100
			
		$velocity.text = str(round(currentVelocity))
