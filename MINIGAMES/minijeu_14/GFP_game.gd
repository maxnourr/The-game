extends Node

#timer
var time = 10
static var nb_obstacle = 1
var rng = RandomNumberGenerator.new()
var linktube = preload("res://minijeu_14/obstacle.tscn") #to create new tube

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button2.hide() #no restart
	$Timer.wait_time = time #set timer
	
	$Button3/Label.set_text("coins : " + str(GlobalVar.coins))
	
	$Obstacle.set_player($bacteria)
	
	if GlobalVar.on_hard_core:
		_on_button_pressed()

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
	#if timer running we update
	if not $Timer.is_stopped():
		#do not successed to remove time from timer
		var T = max(0,round($Timer.time_left))
		
		#update time
		$clock/time.text = str(max(0,T))
		

		
		if $Obstacle.touched == true:
			$BackGround.color=Color(1, 0.231, 0.231)
			$TEXT/win_state.text = "haha looser"
			restart()
		
		#check if won
		
		if $GFP.taken == true:
			GlobalVar.win = true
			$BackGround.color=Color(0.643, 1, 0.486)
			$TEXT/win_state.text = "yes you won!!"
			GlobalVar.coins += 1
			$Timer.stop()
			restart()
			
		if $GFP.destroyed ==true :
			$BackGround.color=Color(1, 0.231, 0.231)
			$TEXT/win_state.text = "haha looser"
			restart()
			
		
		#if time runs out (do not use signal because of malus
		if T == 0:
			$BackGround.color=Color(1, 0.231, 0.231)
			$TEXT/win_state.text = "haha looser"
			restart()


func restart(): 
	$TEXT/explanation.text = "You can modify bacteria so they express GFP\nwhen they do they appear fluorescent and green\n it is use for verification of expression"
	$Obstacle.running = false
	$bacteria.running = false
	$Obstacle.touched = false
	
	if GlobalVar.on_hard_core:
		_on_button_2_pressed()
	else:
		if not GlobalVar.win:
			$Button2.set_text("Restart")
		else:
			$Button2.set_text("Continue")
		$Button2.show() # show restart
		$Button3.show()
		$Button3/Label.set_text("coins : "+str(GlobalVar.coins))
	

#called if start is pressed, set timer and instanciate tubes
func _on_button_pressed():
	$screen.hide()
	$Button.hide() #hide start	
	$Button3.hide()
	#set timer
	$clock/time.text = str(round($Timer.time_left))
	$bacteria.running = true
	$Obstacle.running = true
	
	$Obstacle.visible = true
	#$Obstacle.position.x = rng.randi_range(0,get_viewport().size.x)
	#$Obstacle.position.y = rng.randi_range(0,get_viewport().size.y)
	
	
	$GFP.position.x = randf_range(1152/6,5*1152/6)
	$GFP.position.y = randf_range(0,648/2)
	
	if nb_obstacle >1:
		for n in nb_obstacle-1:
			var obstacle = linktube.instantiate()
			randomize()
			
			if n in range(0,nb_obstacle/2):
				obstacle.position.x = rng.randi_range(0,1152/6-100)
				obstacle.position.y = rng.randi_range(0,648)
			else:
				obstacle.position.x = rng.randi_range(5*1152/6+100,1152)
				obstacle.position.y = rng.randi_range(0,648)
			
			obstacle.set_player($bacteria)
			add_child(obstacle)
	
	$clock.visible = true		
	$Timer.start()

#called if restart pressed
func _on_button_2_pressed():
	if GlobalVar.win:
		nb_obstacle += 1
	if GlobalVar.on_randon == true:
		GlobalVar.pass_game()
	else:
		GlobalVar.to_load(GlobalVar.game[13])


func _on_button_3_pressed():
	reset()
	GlobalVar.to_game_list()
	
func reset():
	nb_obstacle = 1
