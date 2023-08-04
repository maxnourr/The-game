
extends Node

#timer
var time = 20

# screen
var width = 0 #will be initialised in ready() 
var height = 0


#game
var lose = false 

#object
var sunglasses = false
var protectglass = false
var blouse = false
var teeshirt = false
var pant = false
var short = false
var shoes = false
var openshoes = false
var mask = false
var carnaval = false


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
	
	#at the center
	$body.position.x = get_viewport().size.x/2
	$body.position.y = get_viewport().size.y/2
	
	#scale bacterias
	$body.scale.x = get_viewport().size.x*0.5/1152
	$body.scale.y = $body.scale.x
	
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
		
		#if time runs out (do not use signal because of malus
		if T == 0:
			if lose == false:
				$TEXT/win_state.text = "haha looser"
				print(sunglasses)
				print(protectglass)
				print(blouse)
				print(teeshirt)
				print(pant)
				print(short)
				print(shoes)
				print(openshoes)
				print(mask)
				print(carnaval)
				
				restart()
			lose = true 

func restart(): 
	$Button2.show() # show restart
	
func verify():
	var value = -5
	
	if sunglasses == false:
		value +=1
	if protectglass == true:
		value +=1
	if blouse == true:
		value +=1
	if teeshirt == false:
		value +=1
	if pant == true:
		value +=1
	if short == false:
		value +=1
	if shoes == true:
		value +=1
	if openshoes == false:
		value +=1
	if mask == true:
		value +=1
	if carnaval == false:
		value +=1
	
	$ProgressBar.value = value
	
	if value == 5:
		$ProgressBar.visible = false
		$Timer.stop()
		$TEXT/win_state.text = "you win"
		restart()
			
				

#called if start is pressed, set timer and instanciate tubes
func _on_button_pressed():
	$Button.hide() #hide start
	#set timer
	$TEXT/time.text = str(round($Timer.time_left))
	$Timer.start()

#called if restart pressed
func _on_button_2_pressed():
	get_tree().reload_current_scene()


func _on_sunglass_pressed():
	sunglasses = !sunglasses
	$body/sunglasses.visible = !$body/sunglasses.visible
	verify()


func _on_pglass_pressed():
	protectglass = !protectglass
	$body/protectglass.visible = !$body/protectglass.visible
	verify()

func _on_b_pressed():
	blouse = !blouse
	$body/blouse.visible = !$body/blouse.visible
	verify()

func _on_t_pressed():
	teeshirt = !teeshirt
	$body/teeshirt.visible = !$body/teeshirt.visible
	verify()

func _on_p_pressed():
	pant = !pant
	$body/pant.visible = !$body/pant.visible
	verify()

func _on_s_pressed():
	short = !short
	$body/short.visible = !$body/short.visible
	verify()

func _on_sho_pressed():
	shoes = !shoes
	$body/shoes.visible = !$body/shoes.visible
	verify()

func _on_pensho_pressed():
	openshoes = !openshoes
	$body/openshoes.visible = !$body/openshoes.visible
	verify()

func _on_m_pressed():
	mask = !mask
	$body/mask.visible = !$body/mask.visible
	verify()

func _on_c_pressed():
	carnaval = !carnaval
	$body/carnaval.visible = !$body/carnaval.visible
	verify()
