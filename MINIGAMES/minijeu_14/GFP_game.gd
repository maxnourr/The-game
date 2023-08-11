extends Node

#timer
var time = 10
static var nb_obstacle = 1
var rng = RandomNumberGenerator.new()
var linktube = preload("res://minijeu_14/obstacle.tscn") #to create new tube

#game
var win = false 
#var number_obstacles = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	$Button2.hide() #no restart
	$Timer.wait_time = time #set timer
	
	$Button3/Label.set_text("coins : " + str(GlobalVar.coins))
	
	$Obstacle.set_player($bacteria)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
	#if timer running we update
	if not $Timer.is_stopped():
		#do not successed to remove time from timer
		var T = max(0,round($Timer.time_left))
		
		#update time
		$TEXT/time.text = str(max(0,T))
		

		
		if $Obstacle.touched == true:
			win = false
			$TEXT/win_state.text = "haha looser"
			restart()
		
		#check if won
		
		if $GFP.taken == true:
			win = true
			$TEXT/win_state.text = "yes you won!!"
			$Timer.stop()
			restart()
			
		if $GFP.destroyed ==true :
			win = false
			$TEXT/win_state.text = "haha looser"
			restart()
			
		
		#if time runs out (do not use signal because of malus
		if T == 0:
			if  win == false:
				$TEXT/win_state.text = "haha looser"
				restart()


func restart(): 
	$Obstacle.running = false
	$bacteria.running = false
	$Obstacle.touched = false
	$Button2.show() # show restart
	$TEXT/explanation.text = "The bacteria is now with GFP"
	

#called if start is pressed, set timer and instanciate tubes
func _on_button_pressed():
	$Button.hide() #hide start	
	#set timer
	$TEXT/time.text = str(round($Timer.time_left))
	$bacteria.running = true
	$Obstacle.running = true
	
	$Obstacle.visible = true
	#$Obstacle.position.x = rng.randi_range(0,get_viewport().size.x)
	#$Obstacle.position.y = rng.randi_range(0,get_viewport().size.y)
	
	
	$GFP.position.x = randf_range(get_viewport().size.x/6,5*get_viewport().size.x/6)
	$GFP.position.y = randf_range(0,get_viewport().size.y/2)
	
	if nb_obstacle >1:
		for n in nb_obstacle-1:
			var obstacle = linktube.instantiate()
			randomize()
			
			if n in range(0,nb_obstacle/2):
				obstacle.position.x = rng.randi_range(0,get_viewport().size.x/6-100)
				obstacle.position.y = rng.randi_range(0,get_viewport().size.y)
			else:
				obstacle.position.x = rng.randi_range(5*get_viewport().size.x/6+100,get_viewport().size.x)
				obstacle.position.y = rng.randi_range(0,get_viewport().size.y)
			
			obstacle.set_player($bacteria)
			add_child(obstacle)
			
	$Timer.start()

#called if restart pressed
func _on_button_2_pressed():
	if win:
		nb_obstacle += 1
		GlobalVar.coins += 1
	if GlobalVar.on_randon == true and win:
		GlobalVar.pass_game()
	else:
		get_tree().reload_current_scene()


func _on_button_3_pressed():
	GlobalVar.to_game_list()
