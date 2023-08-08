
extends Node

#static because we want to increase the number with the difficulty (each turn)
static var nb_tube = 1
var goal = 3

#timer
var time = 5
var malus = false #change the time if activated
var malus_time = 3

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
	
	#size circle dep on bacterias + step dep on screen dimensions
	max_size = $bacterias.scale.x*1.5
	$circle.scale.x = max(0,max_size)
	$circle.scale.y = $circle.scale.x
	step = max(0,(max_size/2)/time)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
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
	$Tube.on_game = false
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
		$bacterias.texture("happy")
		GlobalVar.coins +=1
		restart()
	elif area.type == "BLUE": #do nothing
		$TEXT/win_state.text = "I'm blue didadudidaduda"
		$bacterias.blue_medium()
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
		tube.on_game = true
		
		if round(n) <= 0:
			tube.set_type("AMPI") #need at least 1
		elif round(n) == 1:
			tube.set_type("SOC")
		elif round(n) == 2:
			tube.set_type("BLUE")
		else: #random type
			tube.set_type(tube.type_list[randi() % tube.type_list.size()])
		
		#add random out of the central square
		#it is a horrible way to do it but it's working, godot destroyed my brain
		randomize()
		var test = rng.randi_range(0,1)
		if test == 1:
			randomize()
			test = rng.randi_range(0,1)
			if test ==1:
				tube.position.x = rng.randi_range(25,1152/2-500)
				tube.position.y = rng.randi_range(200,648-200)
			else :
				tube.position.x = rng.randi_range(1152/2+500,1152-25)
				tube.position.y = rng.randi_range(200,648-200)
		else:
			randomize()
			test = rng.randi_range(0,1)
			if test==1:
				tube.position.x = rng.randi_range(25,1152-25)
				tube.position.y = rng.randi_range(200,648/2-400)
			else:
				tube.position.x = rng.randi_range(25,1152-25)
				tube.position.y = rng.randi_range(648/2+400,648-200)
	
		
		
	#set timer
	$TEXT/time.text = str(round($Timer.time_left))
	$Timer.start()

#called if restart pressed
func _on_button_2_pressed():
	if not lose :
		nb_tube += 1
	if GlobalVar.on_randon == true and nb_tube-1 == goal and lose == false:
		GlobalVar.pass_game()
	else :
		get_tree().reload_current_scene()


func _on_button_3_pressed():
	GlobalVar.to_menu()
