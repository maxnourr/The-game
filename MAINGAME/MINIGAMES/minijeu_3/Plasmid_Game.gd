extends Node

#timer
static var time = 20

#temperature
var temp = 0
var rng = RandomNumberGenerator.new()

#game
var goal = 0 #temperature goal
var timelapse = 0 #time at the good temp
var to_wait = 250 #goal time at the good temp
var is_reatched = false #are you at the good temp ? 
var min = -20 #min temp
var max = 60 #max temp

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button3/Label.set_text("coins : " + str(GlobalVar.coins))
	$Button2.hide() #no restart
	$Timer.wait_time = time #set timer
	
	#random temp goal
	goal = rng.randi_range(min,max)
	
	if GlobalVar.on_hard_core:
		_on_button_pressed()

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
	var T = max(0,round($Timer.time_left))
		#update time
		
	#if timer running we update
	if not $Timer.is_stopped():
		
		$clock/time.text = str(max(0,T))
		#if time runs out (do not use signal because of malus
		if T == 0:
			$BackGround.color=Color(1, 0.231, 0.231)
			$TEXT/win_state.text = "haha looser"
			restart()
		
		$TEXT/number.text = str(temp)
		
		#verif temp and play the right texture
		if temp < goal:
			$plate.texture("ice")
			if is_reatched:
				is_reatched = false
				timelapse = 0
		elif temp > goal:
			$plate.texture("fire")
			if is_reatched:
				is_reatched = false
				timelapse = 0
		if temp==goal:
			$plate.texture("normal")
			
			if !is_reatched: 
				is_reatched = true
			else: 
				timelapse += 1 #wait at the good time
				if timelapse == to_wait :
					GlobalVar.win = true
					$BackGround.color=Color(0.643, 1, 0.486)
					$TEXT/win_state.text = "you win"
					GlobalVar.coins +=1
					$Timer.stop()
					restart()

func restart(): 
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
		$TEXT/explanation.text = "Each bacteria strain have a prefered temperature to grow\n when working with bacterias\n you have to be careful to use the right temperature\n fun fact: bacterias also like to be shaked !"

#called if start is pressed, set timer and instanciate tubes
func _on_button_pressed():
	$TEXT.show()
	$screen.hide()
	$Button.hide() #hide start	
	$Button3.hide()
	#set timer
	$clock.visible = true
	$clock/time.text = str(round($Timer.time_left))
	$Timer.start()

#called if restart pressed
func _on_button_2_pressed():
	if GlobalVar.win:
		time = max(8,time-4)
	if GlobalVar.on_randon == true:
		GlobalVar.pass_game()
	else:
		GlobalVar.to_load(GlobalVar.minigame[2])

#increase temp
func _on_up_pressed():
	if temp < max:
		temp += 1

#decrease temp
func _on_down_pressed():
	if temp > min:
		temp -= 1


func _on_button_3_pressed():
	reset()
	GlobalVar.to_minigame_list()
	
func reset():
	time = 20
