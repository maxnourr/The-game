extends Node

#3 different state
var pos_type = ["fire","ice","normal"]
var left = 0 #for the movement of bacterias

#textures
var sad = preload("res://minijeu_4/figures/Badbact@4x.png")
var happy = preload("res://minijeu_4/figures/Happy bact@4x.png")

#to change the texture
func texture(T):
	if T == "happy":
		$bacteria.set_texture(happy)
		$bacteria2.set_texture(happy)
		$bacteria3.set_texture(happy)
	elif T == "sad":
		$bacteria.set_texture(sad)
		$bacteria2.set_texture(sad)
		$bacteria3.set_texture(sad)
		
func _process(delta):
	#movement of the bacterias
	if left in range(0,50):
		left +=1
		$bacteria.position.x -= 0.2
		$bacteria2.position.x -= 0.2
		$bacteria3.position.x -= 0.2
		if left ==50:
			left = -50
	else:
		left +=1
		$bacteria.position.x += 0.2
		$bacteria2.position.x += 0.2
		$bacteria3.position.x += 0.2
