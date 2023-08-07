
extends Node

#static because we want to increase the number with the difficulty (each turn)
static var nb_tube = 1
var goal = 3

#timer
var time = 5
var malus = false #change the time if activated
var malus_time = 3

# screen
var width = 0 #will be initialised in ready() 
var height = 0

#tubes
var linktube = preload("ampi.tscn") #to create new tube
var rng = RandomNumberGenerator.new()

#circle
var step = 0 #will be initialisate in ready(), change in diameter at each delta
var max_size = 1 

#game
var lose = false 

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button3/Label.set_text("coins : " + str(GlobalVar.coins))
	$Button2.hide() #no restart
	$Timer.wait_time = time #set timer
	
	#set screen data
	width = get_viewport().size.x
	height = get_viewport().size.y
	resize() #resize the elements
		

#resize and position each element depending of the screen dimensions
func resize():
	
	#at the center
	$bacterias.position.x = get_viewport().size.x/2
	$bacterias.position.y = get_viewport().size.y/2
	
	#at the center
	$circle.position.x = get_viewport().size.x/2
	$circle.position.y = get_viewport().size.y/2
	
	#scale bacterias
	$bacterias.scale.x = get_viewport().size.x*0.5/1152
	$bacterias.scale.y = $bacterias.scale.x
	
	#size circle dep on bacterias + step dep on screen dimensions
	max_size = $bacterias.scale.x*1.5
	$circle.scale.x = max(0,max_size)
	$circle.scale.y = $circle.scale.x
	step = max(0,(max_size/2)/time)
	
	#we do not resize tube because... because
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#resize if size change !
	if width != get_viewport().size.x or height != get_viewport().size.y:
		width = get_viewport().size.x
		height = get_viewport().size.y
		resize()
		
	#if timer running we update
	if not $Timer.is_stopped():
		
		#if malus we remove some time
		#do not successed to remove time from timer
		var T = max(0,round($Timer.time_left))
		if malus:
			T = max(0,T-3) 
		
		#update time
		$TEXT/time.text = str(max(0,T))
			
		#update circle size
		$circle.scale.x = max(max_size/2,$circle.scale.x - step*delta)
		$circle.scale.y = $circle.scale.x
		
		#if time runs out (do not use signal because of malus
		if T == 0:
			if lose == false:
				$TEXT/win_state.text = "haha looser"
				lose = true 
				restart()

func restart(): 
	
	if lose == true:
		$Button2.set_text("Restart")
	else:
		$Button2.set_text("Continue")
	$Button2.show() # show restart
	$Button3.show()
	$Button3/Label.set_text("coins : "+str(GlobalVar.coins))
	if nb_tube == 1:
		$TEXT/explanation.text = "Ampicillin is an antibiotic\nmodified bacterias have antibiotic resistance\n adding AMPI will avoid contamination"
	elif nb_tube == 2:
		$TEXT/explanation.text = "SOC is a nutrition buffer\n it help bacterias grow, even unwanted bacterias !\n if you SOC without AMPI, you risk contamination"
	elif nb_tube == 3:
		$TEXT/explanation.text = "Blue dye is just blue dye..."

#called when a tube enter the bacterias
func _on_bacterias_area_entered(area):

	if area.type == "AMPI": # we want ampicillin
		$Timer.stop()
		$TEXT/win_state.text = "you win"
		GlobalVar.coins +=1
		restart()
	elif area.type == "BLUE": #do nothing
		$TEXT/win_state.text = "I'm blue didadudidaduda"
	elif area.type == "SOC": #good medium grow even unwanted bacterias
		$TEXT/win_state.text = "Bacterias are happy ! malus :("   
		malus = true 
		step = max(0,(max_size/2)/(max(0,time-malus_time))) #change step if malus !

#called if start is pressed, set timer and instanciate tubes
func _on_button_pressed():
	$Button.hide() #hide start
	$Button3.hide()
	
	#instantiate tubes
	for n in nb_tube:
		var tube = linktube.instantiate()
		add_child(tube)
		
		if round(n) <= 0:
			tube.set_type("AMPI") #need at least 1
		elif round(n) == 1:
			tube.set_type("SOC")
		elif round(n) == 2:
			tube.set_type("BLUE")
		else: #random type
			tube.set_type(tube.type_list[randi() % tube.type_list.size()])

			
		#scale dep on current screen size !
		tube.scale.x = get_viewport().size.x*0.6/1152
		tube.scale.y = tube.scale.x
		
		#add random out of the central square
		#it is a horrible way to do it but it's working, godot destroyed my brain
		randomize()
		var test = rng.randi_range(0,1)
		if test == 1:
			randomize()
			test = rng.randi_range(0,1)
			if test ==1:
				tube.position.x = rng.randi_range(25,get_viewport().size.x/2-get_viewport().size.x/1152*500)
				tube.position.y = rng.randi_range(100,get_viewport().size.y-100)
			else :
				tube.position.x = rng.randi_range(get_viewport().size.x/2+get_viewport().size.x/1152*500,get_viewport().size.x-25)
				tube.position.y = rng.randi_range(100,get_viewport().size.y-100)
		else:
			randomize()
			test = rng.randi_range(0,1)
			if test==1:
				tube.position.x = rng.randi_range(25,get_viewport().size.x-25)
				tube.position.y = rng.randi_range(100,get_viewport().size.y/2-get_viewport().size.y/1152*400)
			else:
				tube.position.x = rng.randi_range(25,get_viewport().size.x-25)
				tube.position.y = rng.randi_range(get_viewport().size.y/2+get_viewport().size.y/1152*400,get_viewport().size.y-100)
	
		
		
	#set timer
	$TEXT/time.text = str(round($Timer.time_left))
	$Timer.start()

#called if restart pressed
func _on_button_2_pressed():
	
	if GlobalVar.on_randon == true and nb_tube == goal and lose == false:
		GlobalVar.pass_game()
	else:
		if not lose :
			nb_tube += 1
		get_tree().reload_current_scene()


func _on_button_3_pressed():
	GlobalVar.to_menu()
