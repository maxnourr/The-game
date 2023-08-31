extends Node

#3 different state
var pos_type = ["fire","ice","normal"]
var left = 0 #for the movement of bacterias
var type = "normal" #current state

#textures
var normal = preload("figures/bact.png")
var fire = preload("figures/fire_bact.png")
var ice = preload("figures/ice_bact.png")

func _ready():
	texture(type)

#to change the texture
func texture(T):
	if T == "fire":
		$bacteria.set_texture(fire)
		$bacteria2.set_texture(fire)
		$bacteria3.set_texture(fire)
	elif T == "ice":
		$bacteria.set_texture(ice)
		$bacteria2.set_texture(ice)
		$bacteria3.set_texture(ice)
	elif T == "normal":
		$bacteria.set_texture(normal)
		$bacteria2.set_texture(normal)
		$bacteria3.set_texture(normal)
		
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
