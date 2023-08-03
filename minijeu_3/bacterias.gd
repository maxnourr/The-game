extends Node

var pos_type = ["fire","ice","normal"]
var B = [$bacteria,$bacteria2,$bacteria3]

var type = "normal"
var bact = preload("res://bact.png")
var fire = preload("res://fire_bact.png")
var ice = preload("res://ice_bact.png")

func _ready():
	texture(type)

func texture(T):
	if T == "fire":
		for Bact in B:
			Bact.set_texture(fire)
	elif T == "ice":
		for Bact in B:
			Bact.set_texture(ice)
	elif T == "normal":
		for Bact in B:
			Bact.set_texture(bact)
	
