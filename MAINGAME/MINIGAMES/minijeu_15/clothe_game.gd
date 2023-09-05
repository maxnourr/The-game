
extends Node

#for all game
static var time = 15
var malus = false #change the time if activated
var win_state = ""
var running = false

var game_intro = "You are going to the lab\nDress accordingly"
var game_rules = "left mouse click/pad click : \nselect/deselect an item"

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
var gant = false
var banana = false
var hair_c = false
var hair_l = false


# Called when the node enters the scene tree for the first time.
func on_ready():
	pass

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(delta):
	pass

func restart(): 
	return "you have to wear glasses, glove, blouse,\n shoes, mask in some case\n and please no eating in the lab !"
	
func verify():
	var value = -7
	#calculated score
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
	if gant == true:
		value +=1
	if banana == false:
		value +=1
	if hair_c == true:
		value +=1
	if hair_l == false:
		value +=1
	
	#update progress bar
	$ProgressBar.value = value
	
	#if you have the max -> you win
	if value == 7:
		win()
			
				

#called if start is pressed, set timer and instanciate tubes
func start():
	running = true

func _on_sunglass_pressed():
	if running:
		sunglasses = !sunglasses
		$body/sunglasses.visible = !$body/sunglasses.visible
		verify()


func _on_pglass_pressed():
	if running:
		protectglass = !protectglass
		$body/protectglass.visible = !$body/protectglass.visible
		verify()

func _on_b_pressed():
	if running:
		blouse = !blouse
		$body/blouse.visible = !$body/blouse.visible
		verify()

func _on_t_pressed():
	if running:
		teeshirt = !teeshirt
		$body/teeshirt.visible = !$body/teeshirt.visible
		verify()

func _on_p_pressed():
	if running:
		pant = !pant
		$body/pant.visible = !$body/pant.visible
		verify()

func _on_s_pressed():
	if running:
		shoes = !shoes
		$body/shoes.visible = !$body/shoes.visible
		verify()

func _on_sho_pressed():
	if running:
		short = !short
		$body/short.visible = !$body/short.visible
		verify()

func _on_pensho_pressed():
	if running:
		openshoes = !openshoes
		$body/openshoes.visible = !$body/openshoes.visible
		verify()

func _on_m_pressed():
	if running:
		mask = !mask
		$body/mask.visible = !$body/mask.visible
		verify()

func _on_c_pressed():
	if running:
		carnaval = !carnaval
		$body/carnaval.visible = !$body/carnaval.visible
		verify()

func _on_g_pressed():
	if running:
		gant = !gant
		$body/gant.visible = !$body/gant.visible
		verify()


func _on_bana_pressed():
	if running:
		banana = !banana
		$body/banana.visible = !$body/banana.visible
		verify()
	

func _on_h_c_pressed():
	if running:
		hair_c = !hair_c
		$body/hair_c.visible = !$body/hair_c.visible
		verify()

func _on_h_l_pressed():
	if running:
		hair_l = !hair_l
		$body/hair_l.visible = !$body/hair_l.visible
		verify()

	
func reset():
	time = 15

func win():
	running = false
	time = max(5,time-3)
	$ProgressBar.visible = false
	GlobalVar.win = 1
	GlobalVar.coins +=1
	win_state = "you win"
	
func lose():
	running = false
	$ProgressBar.visible = false
	GlobalVar.win = -1
	win_state = "haha looser"


