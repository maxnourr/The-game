
extends Node

#for all game
var time = 5
var malus = false #change the time if activated
var malus_time = 3
var win_state = ""

var game_intro = "careful ! bacterias are attacking your culture.\nFind the good tube and give them"
var game_rules = "left mouse click/pad click : \ndrag and drop a tube "
#static because we want to increase the number with the difficulty (each turn)
static var nb_tube = 1
var goal = 3

#tubes
var linktube = preload("ampi.tscn") #to create new tube

#circle
var step = 0 #will be initialisate in ready(), change in diameter at each delta
var max_size = 0

var x = 0
var y = 0
var x_tronc = 0
var y_tronc = 0

# Called when the node enters the scene tree for the first time.
func on_ready():
	
	max_size = $circle.scale.x
	step = max(0,(max_size/2)/time)
	
	x = range(50,1152-50)
	y = range(100,648-100)
	x_tronc = range(50,$bacterias.position.x -200) + range($bacterias.position.x +200,1152-50)
	y_tronc = range(100,$bacterias.position.y -200) + range($bacterias.position.y +200,648-100)
	
	if GlobalVar.on_randon:
		if nb_tube <3:
			nb_tube = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(delta):
		#update circle size
		$circle.scale.x = max(max_size/2,$circle.scale.x - step*delta)
		$circle.scale.y = $circle.scale.x

func restart(): 
		$Tube.on_game = false
		if nb_tube == 2:
			return "Ampicillin is an antibiotic\nmodified bacterias have antibiotic resistance\n adding AMPI will avoid contamination"
		elif nb_tube == 3:
			return "SOC is a nutrition buffer\n it help bacterias grow, even unwanted bacterias !\n if you givz SOC without AMPI, you risk contamination"
		elif nb_tube == 4:
			return "Blue dye is just blue dye..."
		return ""

#called when a tube enter the bacterias
func _on_bacterias_area_entered(area):

	if area.type == "AMPI": # we want ampicillin
		win()
		$bacterias.texture("happy")
		#area.queue_free()
	elif area.type == "BLUE": #do nothing
		win_state = "I'm blue didadudidaduda"
		$bacterias.blue_medium()
		area.queue_free()
	elif area.type == "SOC": #good medium grow even unwanted bacterias
		win_state = "Bacterias are happy ! malus :("   
		malus = true 
		step = max(0,(max_size/2)/(max(0,time-malus_time))) #change step if malus !
		area.queue_free()

#called if start is pressed, set timer and instanciate tubes
func start():
	#instantiate tubes
	for n in nb_tube:
		var tube = linktube.instantiate()
		tube.on_game = true
		
		if round(n) <= 0:
			tube.set_type("AMPI") #need at least 1
		elif round(n) == 1:
			tube.set_type("SOC")
		elif round(n) == 2:
			tube.set_type("BLUE")
		else: #random type
			tube.set_type(tube.type_list[randi() % tube.type_list.size()])
		
		#add random out of the central square
		#it is a horrible way to do it but it's working, godot destroyed my brain
		#randomize()
		var test = GlobalVar.rng.randi_range(0,1)
		if test == 1:
			tube.position.x = x[randi() % x.size()]
			tube.position.y = y_tronc[randi() % y_tronc.size()]
		else:
			tube.position.x = x_tronc[randi() % x_tronc.size()]
			tube.position.y = y[randi() % y.size()]
		add_child(tube)

#called if restart pressed
func win():
	GlobalVar.win = 1
	win_state = "you win"
	if nb_tube >= 3:
		GlobalVar.coins +=1
	nb_tube += 1
	
func lose():
	win_state = "haha looser"

func reset():
	nb_tube = 1
