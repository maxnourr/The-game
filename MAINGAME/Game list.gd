extends Control

var level_link = ["start","level 1","level 2","level 3","level 4","level 5","level 6","level 7","level 8","end"]

var transfer_time = 200
var waited = 200
var switch = 0
var step_x = 0
var step_y = 0

func _ready():
	if GlobalVar.first_open:
		GlobalVar.load_game()
		GlobalVar.first_open = false
	else:
		GlobalVar.save_game()
	
	Global.music_menu()
	
	place_bacteria(false)
	for i in range(0,GlobalVar.max_level+1):
		get_node(level_link[i]+"/cadena").hide()
		
	$start/Label.text = "tuto"
	$"level 1"/Label.text = "level 1"
	$"level 2"/Label.text = "level 2"
	$"level 3"/Label.text = "level 3"
	$"level 4"/Label.text = "level 4"
	$"level 5"/Label.text = "level 5"
	$"level 6"/Label.text = "level 6"
	$"level 7"/Label.text = "level 7"
	$"level 8"/Label.text = "level 8"
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.set_text("coins : " + str(GlobalVar.coins)+"   level : " + str(GlobalVar.max_level))
	
	if PlayerVar.win ==1 and GlobalVar.current_level == GlobalVar.max_level:
		PlayerVar.win =0
		Global.open()
		pass_level()
	
	if waited < transfer_time:
		waited +=1
		switch +=1
		$bacteria.position.x += step_x
		$bacteria.position.y += step_y
		if switch > 30:
			switch = 0
			if $bacteria.texture == load("res://sprites/gauche.png"):
				$bacteria.texture = load("res://sprites/droite.png")
			else:
				$bacteria.texture = load("res://sprites/gauche.png")
	if waited == transfer_time :
		waited = transfer_time+1
		get_node(level_link[GlobalVar.current_level]+"/cadena").hide()
		get_node(level_link[GlobalVar.current_level]+"/open").show()
	
	if get_node(level_link[GlobalVar.current_level]).open == true:
		get_node(level_link[GlobalVar.current_level]).open = false
		$file/RichTextLabel.text = "Level\n " + str(GlobalVar.current_level)
		$file/RichTextLabel2.text = titles[GlobalVar.current_level]
		$file/RichTextLabel3.text = explications[GlobalVar.current_level]
		$file.show()

	
func place_bacteria(move):
	if !move:
		$bacteria.position.x = get_node(level_link[GlobalVar.current_level]).position.x
		$bacteria.position.y = get_node(level_link[GlobalVar.current_level]).position.y
	else:
		waited = 0
		step_x = (get_node(level_link[GlobalVar.current_level]).position.x-$bacteria.position.x)/transfer_time
		step_y = (get_node(level_link[GlobalVar.current_level]).position.y-$bacteria.position.y)/transfer_time
	

func _on_return_pressed():
	Global.button_sound()
	GlobalVar.save_game()
	GlobalVar.to_menu()


func _on_start_pressed():
	
	if GlobalVar.max_level > 0:
		Global.button_sound()
		get_node(level_link[GlobalVar.current_level]+"/open").hide()
		GlobalVar.current_level = 0
		place_bacteria(true)

func _on_level_1_pressed():
	
	if GlobalVar.max_level >= 1:
		Global.button_sound()
		get_node(level_link[GlobalVar.current_level]+"/open").hide()
		GlobalVar.current_level = 1
		place_bacteria(true)


func _on_level_2_pressed():
	
	if GlobalVar.max_level >= 2:
		Global.button_sound()
		get_node(level_link[GlobalVar.current_level]+"/open").hide()
		GlobalVar.current_level = 2
		place_bacteria(true)


func _on_level_3_pressed():
	
	if GlobalVar.max_level >= 3:
		Global.button_sound()
		get_node(level_link[GlobalVar.current_level]+"/open").hide()
		GlobalVar.current_level = 3
		place_bacteria(true)


func _on_level_4_pressed():
	
	if GlobalVar.max_level >= 4:
		Global.button_sound()
		get_node(level_link[GlobalVar.current_level]+"/open").hide()
		GlobalVar.current_level = 4
		place_bacteria(true)


func _on_level_5_pressed():
	
	if GlobalVar.max_level >= 5:
		Global.button_sound()
		get_node(level_link[GlobalVar.current_level]+"/open").hide()
		GlobalVar.current_level = 5
		place_bacteria(true)


func _on_level_6_pressed():
	
	if GlobalVar.max_level >= 6:
		Global.button_sound()
		get_node(level_link[GlobalVar.current_level]+"/open").hide()
		GlobalVar.current_level = 6
		place_bacteria(true)


func _on_level_7_pressed():
	
	if GlobalVar.max_level >= 7:
		Global.button_sound()
		get_node(level_link[GlobalVar.current_level]+"/open").hide()
		GlobalVar.current_level = 7
		place_bacteria(true)


func _on_level_8_pressed():
	
	if GlobalVar.max_level >= 8:
		Global.button_sound()
		get_node(level_link[GlobalVar.current_level]+"/open").hide()
		GlobalVar.current_level = 8
		place_bacteria(true)


func pass_level():
	if GlobalVar.current_level == level_link.size()-1:
		GlobalVar.current_level = 0
	else :
		GlobalVar.max_level = min(GlobalVar.max_level+1,GlobalVar.game.size()-1)
		get_node(level_link[GlobalVar.max_level]+"/cadena").show() 
		
		Global.click()
		await get_tree().create_timer(1).timeout
		get_node(level_link[GlobalVar.max_level]+"/cadena").texture = load("res://sprites/cadena ouvert.png")


func _on_go_pressed():
	GlobalVar.to_load(GlobalVar.game[GlobalVar.current_level])

func _on_x_pressed():
	$file.hide()
	

var explications = [
	"discover how to play the game", "survive the acidic stomach using a pill", "Discover AmpR, a very usefull genes",
	"make your bacteria glow using gfp",
	"Bind to Mucus using SpaC","Add conditions to gene expressions",
	"Learn to tame  an immunitary system","use everything you've learned to catch and evacuate cadmium",
	"Change your bacteria shape"
]

var	titles = [
	"tutorial", "an acidic journey",
	"survival","a study in green",
	"stick to it", "a dairy dare",
	"police control", "the big day",
	"fashion week"
]



