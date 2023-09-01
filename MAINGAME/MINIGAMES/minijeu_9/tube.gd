extends Area2D

var nb_turn = 0
var current = 2
var clock = true
var wait = 0
var to_wait =25
var tubes = [preload("figures/1@4x.png"),preload("figures/2@4x.png"),preload("figures/3@4x.png"),preload("figures/4@4x.png"),preload("figures/5@4x.png")]

func _ready():
	$Sprite2D.set_texture(tubes[2])
	
func swing(velocity):
	if velocity <40:
		nb_turn = 1
	elif velocity >60:
		nb_turn = 5
	else:
		nb_turn = 3
		
func _process(delta):
	
	wait += 1
	if wait >=to_wait and nb_turn != 0:
		wait = 0
		if nb_turn == 1:
			to_wait =50
			if current == 3:
				clock = false
				current = 2
			elif current == 1:
				clock = true
				current = 2
			elif clock == true:
				current = 3
			else :
				current = 1
		else:
			if current == 4:
				clock = false
				current = 3
			elif current == 0:
				clock = true
				current = 1
			elif clock == true:
				current +=1
			else :
				current -=1
			
			if nb_turn == 3:
				to_wait = 25
			else:
				to_wait = 3
		$Sprite2D.set_texture(tubes[current])
	
