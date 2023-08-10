extends Area2D

#3 different state
var left = 0 #for the movement of bacterias
var remove = false

		
func _process(delta):
	if remove and rotation != PI:
		rotation = PI
	elif not remove and rotation !=0:
		rotation = 0
	#movement of the bacterias
	if left in range(0,50):
		left +=1
		position.x -= 0.2
		position.x -= 0.2
		position.x -= 0.2
		if left ==50:
			left = -50
	else:
		left +=1
		position.x += 0.2
		position.x += 0.2
		position.x += 0.2
