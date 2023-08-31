extends Node

#3 different state
var pos_type = ["happy","sad"]
var left = 0 #for the movement of bacterias
var type = "sad" #current state

#textures
var blue = preload("figures/scared bacteria blue.png")
var happy = preload("figures/happy.png")
var sad = preload("figures/sad.png")

func _ready():
	$bacteria.set_texture(sad)

func blue_medium():
	$Sprite2D.set_texture(blue)

#to change the texture
func texture(T):
	if T == "happy":
		$bacteria.set_texture(happy)
	elif T == "sad":
		$bacteria.set_texture(sad)
		
func _process(delta):
	#movement of the bacterias
	if left in range(0,50):
		left +=1
		$bacteria.position.x -= 0.2
		if left ==50:
			left = -50
	else:
		left +=1
		$bacteria.position.x += 0.2
