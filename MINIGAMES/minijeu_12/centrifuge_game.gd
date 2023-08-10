extends Node

var rng = RandomNumberGenerator.new()
var win = false
var number = 1

var blue_number = 1
var pink_number = 4
var red_number = 0
var green_number = 0

var goal1 = 0
var goal2 = 0

var time = 5

func _ready():
	$Button3/Label.set_text("coins : " + str(GlobalVar.coins))
	$Button2.hide() #no restart
	$Timer.wait_time = time #set timer
	
	goal1 = blue_number+6
	if goal1 > 12:
		goal1 -= 12
	goal2 = pink_number+6
	if goal2 > 12:
		goal2 -= 12


func _process(delta):
	
	var T = max(0,round($Timer.time_left))
		#update time
		
	#if timer running we update
	if not $Timer.is_stopped():
		$TEXT/time.text = str(max(0,T))
		#if time runs out (do not use signal because of malus
		if T == 0:
			if win == false:
				$TEXT/win_state.text = "haha looser"
				restart()
	
func restart(): 
	if win == false:
		$Button2.set_text("Restart")
	else:
		$Button2.set_text("Continue")
	$Button2.show() # show restart
	$Button3.show()
	$Button3/Label.set_text("coins : "+str(GlobalVar.coins))
	$TEXT/explanation.text = "cleaning is the key !"
		

func _on_button_pressed():
	$Button.hide() #hide start	
	$Button3.hide()
	#set timer
	$TEXT/time.text = str(round($Timer.time_left))
		
	$Timer.start()

#called if restart pressed
func _on_button_2_pressed():
	if win :
		pass
	if GlobalVar.on_randon == true and win:
		GlobalVar.pass_game()
	else:
		get_tree().reload_current_scene()
		

func _on_button_3_pressed():
	GlobalVar.to_menu()

func _on_up_pressed():
	if number <12:
		number += 1
	else:
		number = 1
	$centrifuge.rotate(-PI/6)
	

func _on_down_pressed():
	if number >1:
		number -= 1
	else:
		number = 12
	$centrifuge.rotate(PI/6)
	

func _on_red_pressed():
	$red.visible = true
	red_number = number
	$tubes/red.queue_free()

func _on_green_pressed():
	$green.visible = true
	green_number = number
	$tubes/green.queue_free()
