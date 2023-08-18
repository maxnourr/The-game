extends Control

var level_link = ["start","level 1","level 2","level 3","level 4","end"]

var transfer_time = 200
var waited = 200
var step_x = 0
var step_y = 0
var load = false

func _ready():
	if GlobalVar.first_open:
		GlobalVar.load_game()
		GlobalVar.first_open = false
	else:
		GlobalVar.save_game()
	
	Global.music_menu()
	
	place_bacteria()
	for i in range(0,GlobalVar.max_level+1):
		get_node(level_link[i]+"/cadena").hide()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.set_text("coins : " + str(GlobalVar.coins)+"\nlevel : " + str(GlobalVar.max_level))
	if waited < transfer_time:
		waited +=1
		$bacteria.position.x += step_x
		$bacteria.position.y += step_y
	if waited == transfer_time and load == true:
		load = false
		Global.music_game1()
		await get_tree().create_timer(1).timeout
		print("load "+str(GlobalVar.current_level))
		GlobalVar.to_load(GlobalVar.game[GlobalVar.current_level])

	
func place_bacteria():
	if GlobalVar.current_level==0:
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
	Global.button_sound()
	
	
	if GlobalVar.max_level > 0:
		GlobalVar.current_level = 0
		place_bacteria()
		load = true
	else:	
		place_bacteria()
		await get_tree().create_timer(1).timeout
		Global.music_game1()
		GlobalVar.to_load(GlobalVar.game[0])

func _on_level_1_pressed():
	Global.button_sound()
	
	if GlobalVar.max_level >= 1:
		GlobalVar.current_level = 1
		place_bacteria()
		load = true


func _on_level_2_pressed():
	Global.button_sound()
	
	if GlobalVar.max_level >= 2:
		GlobalVar.current_level = 2
		place_bacteria()
		load = true


func _on_level_3_pressed():
	Global.button_sound()
	
	if GlobalVar.max_level >= 3:
		GlobalVar.current_level = 3
		place_bacteria()
		load = true


func _on_level_4_pressed():
	Global.button_sound()
	
	if GlobalVar.max_level >= 4:
		GlobalVar.current_level = 4
		place_bacteria()
		load = true


func _on_end_pressed():
	Global.button_sound()
	
	if GlobalVar.max_level >= GlobalVar.game.size()-1:
		GlobalVar.current_level = GlobalVar.game.size()-1
		place_bacteria()
		load = true


func _on_button_pressed():
	if GlobalVar.current_level == level_link.size()-1:
		GlobalVar.current_level = 0
	else :
		GlobalVar.current_level += 1
		GlobalVar.max_level = min(GlobalVar.max_level+1,GlobalVar.game.size()-1)
		get_node(level_link[GlobalVar.current_level]+"/cadena").hide()
	place_bacteria()
