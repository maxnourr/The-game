extends Node

#timer
var time = 10

#game
var win = false 
#var number_obstacles = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	$Button2.hide() #no restart
	$Timer.wait_time = time #set timer
	#at the center
	$bacteria.position.x = get_viewport().size.x/2
	$bacteria.position.y = get_viewport().size.y/1.2
		
	$GFP.position.x = randf_range(0,get_viewport().size.x)
	$GFP.position.y = randf_range(0,get_viewport().size.y)
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
	#if timer running we update
	if not $Timer.is_stopped():
		$Obstacle.run($bacteria,delta)
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
		#less time  and more obstacles so it's more difficult
	get_tree().reload_current_scene()
