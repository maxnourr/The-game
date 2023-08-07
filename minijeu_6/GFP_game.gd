extends Node


#timer
var time = 10

# screen
var width = 0 #will be initialised in ready() 
var height = 0

#game
var win = false 
var number_obstacles = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	$Button2.hide() #no restart
	$Timer.wait_time = time #set timer
	
	#set screen data
	width = get_viewport().size.x
	height = get_viewport().size.y
	resize() #resize the elements
		

#resize and position each element depending of the screen dimensions
func resize():
	width = get_viewport().size.x
	height = get_viewport().size.y
	#at the center
	$bacteria.position.x = get_viewport().size.x/2
	$bacteria.position.y = get_viewport().size.y/1.2
	
	#scale bacterias
	$bacteria.scale.x = get_viewport().size.x*0.5/1152
	$bacteria.scale.y = $bacteria.scale.x
	
	
	$GFP.position.x = randf_range(0,get_viewport().size.x)
	$GFP.position.y = randf_range(0,get_viewport().size.y)
	

	
	func _on_Obstacle_timeout():
		var obs_spawn_location = $ObstaclePath/ObstacleSpawnLoc
		obs_spawn_location.unit_offset = randf()
		var obstacle = obstacle.instance()
		obstacle.position = obs_spawn_location.position
		
		var direction = obs_spawn_location.rotation + PI/2
		direction += rand_range(-PI/4,+ PI/4)
		obstacle.rotation = direction
		
		var velocity = Vector2(rand_range(obstacle.min_speed, obstacel.max_speed),0)
		obstacle.linear_velocity = velocity.rotated(direction)
		
	
	
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
		
		#update time
		$TEXT/time.text = str(max(0,T))
		
		#check if won
		if $GFP.taken == true:
			win = true
			$TEXT/win_state.text = "yes you won!!"
			$Timer.stop()
			restart()
			
		
		#if time runs out (do not use signal because of malus
		if T == 0:
			if  win == false:
				$TEXT/win_state.text = "haha looser"
				restart()


func restart(): 
	$Button2.show() # show restart
	$TEXT/explanation.text = "The bacteria is now with GFP"
	

#called if start is pressed, set timer and instanciate tubes
func _on_button_pressed():
	$Button.hide() #hide start	
	#set timer
	$TEXT/time.text = str(round($Timer.time_left))
	$Timer.start()

#called if restart pressed
func _on_button_2_pressed():
	if win :
		$Timer.wait_time -= 1
		number_obstacles += 1
		#less time  and more obstacles so it's more difficult
	get_tree().reload_current_scene()
