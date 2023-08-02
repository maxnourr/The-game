
extends Node

static var nb_tube = 10

#timer
var time = 10
var malus = false
var malus_time = 5

# screen
var width = 0
var height = 0

#tubes
var linktube = preload("res://ampi.tscn")
var rng = RandomNumberGenerator.new()

#circle
var step = 0
var max_size = 1

#game
var lose = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button2.hide()
	$Timer.wait_time = time
	
	width = get_viewport().size.x
	height = get_viewport().size.y
	resize()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.

func resize():
	$bacterias.position.x = get_viewport().size.x/2
	$bacterias.position.y = get_viewport().size.y/2
	
	$circle.position.x = get_viewport().size.x/2
	$circle.position.y = get_viewport().size.y/2
	
	$bacterias.scale.x = get_viewport().size.x*0.5/1152
	$bacterias.scale.y = $bacterias.scale.x
	
	max_size = $bacterias.scale.x*1.5
	$circle.scale.x = max(0,max_size)
	$circle.scale.y = $circle.scale.x
	step = max(0,(max_size/2)/time)
	
func _process(delta):
	
	if width != get_viewport().size.x or height != get_viewport().size.y:
		width = get_viewport().size.x
		height = get_viewport().size.y
		resize()
		
	
	if not $Timer.is_stopped():
		var T = max(0,round($Timer.time_left))
		if malus:
			T = max(0,T-3)
		
		$TEXT/time.text = str(max(0,T))
			
		$circle.scale.x = max(max_size/2,$circle.scale.x - step*delta)
		$circle.scale.y = $circle.scale.x
		
		if T == 0:
			if lose == false:
				$TEXT/win_state.text = "haha looser"
				$Button2.show()
			lose = true



func _on_bacterias_area_entered(area):

	if area.type == "AMPI":
		$Timer.stop()
		$TEXT/win_state.text = "you win"
		$Button2.show()
	elif area.type == "BLUE":
		$TEXT/win_state.text = "I'm blue didadudidaduda"
	elif area.type == "SOC":
		$TEXT/win_state.text = "Bacteria's happy ! malus time"   
		malus = true
		step = max(0,(max_size/2)/(max(0,time-malus_time)))

func _on_button_pressed():
	$Button.hide()
	
	for n in nb_tube:
		var tube = linktube.instantiate()
		add_child(tube)
		
		if round(n) <= 0:
			tube.set_type("AMPI") #need at least 1
		elif round(n) == 1:
			tube.set_type("SOC")
		elif round(n) == 2:
			tube.set_type("BLUE")
		else:
			tube.set_type(tube.type_list[randi() % tube.type_list.size()])

			
		
		tube.scale.x = get_viewport().size.x*0.6/1152
		tube.scale.y = tube.scale.x
		
		var test = rng.randi_range(0,1)
		if test == 1:
			tube.position.x = rng.randi_range(25,get_viewport().size.x/2-get_viewport().size.x/1152*350)
		else :
			tube.position.x = rng.randi_range(get_viewport().size.x/2+get_viewport().size.x/1152*350,get_viewport().size.x-25)
		
		test = rng.randi_range(0,1)
		if test == 1:
			tube.position.y = rng.randi_range(100,get_viewport().size.x/2-get_viewport().size.x/1152*250)
		else :
			tube.position.y = rng.randi_range(get_viewport().size.y/2+get_viewport().size.y/1152*250,get_viewport().size.y-100)
		
		
		#tube.position.x = get_viewport().size.x/2
		#print(get_viewport().size.x/2)
		#print(get_viewport().size.x/1152*350)
		#print(get_viewport().size.x/2-get_viewport().size.x/1152*350)
		#print(get_viewport().size.x/2+get_viewport().size.x/1152*350)
		#while tube.position.x in rangef(get_viewport().size.x/2-get_viewport().size.x/1152*350,get_viewport().size.x/2+get_viewport().size.x/1152*350):
		#	print("hello")
		#	tube.position.x = rng.randi_range(25,get_viewport().size.x-25)
		
		
		#tube.position.y = get_viewport().size.y/2
		#while tube.position.y in range(get_viewport().size.y/2-get_viewport().size.y/1152*250,get_viewport().size.y/2+get_viewport().size.y/1152*250):
		#	print("hello 2")
		#	tube.position.y = rng.randi_range(100,get_viewport().size.y-100)
		
		
		
	
	$TEXT/time.text = str(round($Timer.time_left))
	
	$Timer.start()


func _on_button_2_pressed():
	get_tree().reload_current_scene()
	nb_tube += 1
