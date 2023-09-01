
extends Node

#timer
var time = 15

#trash
static var nb_trash = 10
var removed = 0
var linktube = preload("trash.tscn") #to create new tube
var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	$Button3/Label.set_text("coins : " + str(GlobalVar.coins))
	$Button2.hide() #no restart
	$Timer.wait_time = time #set timer
	
	if GlobalVar.on_hard_core:
		_on_button_pressed()
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
	#if timer running we update
	if not $Timer.is_stopped():
		#if malus we remove some time
		#do not successed to remove time from timer
		var T = max(0,round($Timer.time_left))
		#update time
		$clock/time.text = str(max(0,T))
		
		#if time runs out (do not use signal because of malus
		if T == 0:
			$BackGround.color=Color(1, 0.231, 0.231)
			$TEXT/win_state.text = "haha looser"
			restart()

func restart(): 
	$TEXT/explanation.text = "we really have some special water jets\n in the lab in case of projections"
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
	#instantiate tubes
	for n in nb_trash:
		var trash = linktube.instantiate()
		add_child(trash)
		
		if n in range(0,nb_trash/2):
			randomize()
			trash.position.x = rng.randi_range(575-350-450/2,575-350+450/2)
			trash.position.y = rng.randi_range(325-250/2,325+250/2)
		else:
			randomize()
			trash.position.x = rng.randi_range(575+350-450/2,575+350+450/2)
			trash.position.y = rng.randi_range(325-250/2,325+250/2)
	
	#set timer
	$clock.visible = true
	$clock/time.text = str(round($Timer.time_left))
	$Timer.start()

#called if restart pressed
func _on_button_2_pressed():
	if GlobalVar.win:
		nb_trash += 10
	if GlobalVar.on_randon == true:
		GlobalVar.pass_game()
	else:
		GlobalVar.to_load(GlobalVar.minigame[6])

#if exit area, we remove from list
func _on_eye_area_exited(area):
	if area.type == "trash" and !$Timer.is_stopped():
		area.queue_free()
		removed +=1
		if removed == nb_trash:
			$Timer.stop()
			$BackGround.color=Color(0.643, 1, 0.486)
			$TEXT/win_state.text = "you win"
			$eye.set_type("good")
			GlobalVar.win = true
			GlobalVar.coins +=1
			restart()
	
#move trash if touch by water
func _on_water_area_entered(area):
	if area.type == "trash" and !$Timer.is_stopped():
		area.position.x += (area.position.x-$water.position.x)*0.5
		area.position.y += (area.position.y-$water.position.y)*0.5


func _on_button_3_pressed():
	reset()
	GlobalVar.to_minigame_list()
	
func reset():
	nb_trash = 10
