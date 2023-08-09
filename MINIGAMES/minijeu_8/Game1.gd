extends Node

var sco = 0
var nb_dirt = 20
var linktube = preload("dirt.tscn") #to create new tube
var rng = RandomNumberGenerator.new()
var win = false

static var time = 5

func _ready():
	$Button3/Label.set_text("coins : " + str(GlobalVar.coins))
	$Button2.hide() #no restart
	$Timer.wait_time = time #set timer

	updateScoreLabel()    


func _process(delta):
	
	var T = max(0,round($Timer.time_left))
		#update time
		
	#if timer running we update
	if not $Timer.is_stopped():
		$TEXT/time.text = str(max(0,T))
		#if time runs out (do not use signal because of malus
		if T == 0:
			if win == false:
				$MarginContainer/mouse.running = false
				$TEXT/win_state.text = "haha looser"
				restart()
		
	
		if sco != $MarginContainer/mouse.score:
			sco = $MarginContainer/mouse.score
			updateScoreLabel()
	
func restart(): 
	if win == false:
		$Button2.set_text("Restart")
	else:
		$Button2.set_text("Continue")
	$Button2.show() # show restart
	$Button3.show()
	$Button3/Label.set_text("coins : "+str(GlobalVar.coins))
	$TEXT/explanation.text = "cleaning is the key !"

func increaseScore():
	#score += points
	sco = $MarginContainer/mouse.score
	updateScoreLabel()

# Function to update the score text on the Label.
func updateScoreLabel():
	var labelNode = $MarginContainer/Scorelabel
	labelNode.text = "Score: " + str(sco)
	if sco >= nb_dirt:
		$TEXT/win_state.text = "You win"
		$MarginContainer/mouse.running = false
		win = true
		GlobalVar.coins +=1
		$Timer.stop()
		restart()
		

func _on_button_pressed():
	$Button.hide() #hide start	
	$Button3.hide()
	#set timer
	$TEXT/time.text = str(round($Timer.time_left))
	$MarginContainer/mouse.running = true
	
	for n in nb_dirt:
		var dirt = linktube.instantiate()
		randomize()
		dirt.position.x = rng.randi_range(220,get_viewport().size.x-50)
		dirt.position.y = rng.randi_range(120,get_viewport().size.y-50)
		add_child(dirt)
	
		
	$Timer.start()

#called if restart pressed
func _on_button_2_pressed():
	if win :
		time = max(4,time-2)
	if GlobalVar.on_randon == true and win:
		GlobalVar.pass_game()
	else:
		get_tree().reload_current_scene()
		

func _on_button_3_pressed():
	GlobalVar.to_menu()
