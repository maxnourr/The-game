extends Control

var level_link = ["start","level 1","level 2","level 3","level 4","level 5","level 6","level 7","level 8","end"]

var transfer_time = 200
var waited = 200
var switch = 0
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
		switch +=1
		$bacteria.position.x += step_x
		$bacteria.position.y += step_y
		if switch > 15:
			switch = 0
			if $bacteria/flagel.visible == true:
				$bacteria/flagel.visible = false
				$bacteria/flagel2.visible = true
			else:
				$bacteria/flagel.visible = true
				$bacteria/flagel2.visible = false
	if waited == transfer_time :
		waited = transfer_time+1
		get_node(level_link[GlobalVar.current_level]+"/cadena").hide()
		get_node(level_link[GlobalVar.current_level]+"/open").show()
	#	if load == true:
	#		await get_tree().create_timer(1).timeout
	#		
	#		GlobalVar.to_load(GlobalVar.game[GlobalVar.current_level])

	
func place_bacteria():
	if GlobalVar.current_level==0:
		waited = transfer_time
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
		place_bacteria()

func _on_level_1_pressed():
	
	if GlobalVar.max_level >= 1:
		Global.button_sound()
		get_node(level_link[GlobalVar.current_level]+"/open").hide()
		GlobalVar.current_level = 1
		place_bacteria()


func _on_level_2_pressed():
	
	if GlobalVar.max_level >= 2:
		Global.button_sound()
		get_node(level_link[GlobalVar.current_level]+"/open").hide()
		GlobalVar.current_level = 2
		place_bacteria()


func _on_level_3_pressed():
	
	if GlobalVar.max_level >= 3:
		Global.button_sound()
		get_node(level_link[GlobalVar.current_level]+"/open").hide()
		GlobalVar.current_level = 3
		place_bacteria()


func _on_level_4_pressed():
	
	if GlobalVar.max_level >= 4:
		Global.button_sound()
		get_node(level_link[GlobalVar.current_level]+"/open").hide()
		GlobalVar.current_level = 4
		place_bacteria()


func _on_end_pressed():
	
	if GlobalVar.max_level >= GlobalVar.game.size()-1:
		Global.button_sound()
		get_node(level_link[GlobalVar.current_level]+"/open").hide()
		GlobalVar.current_level = GlobalVar.game.size()-1
		place_bacteria()


func _on_button_pressed():
	get_node(level_link[GlobalVar.current_level]+"/open").hide()
	if GlobalVar.current_level == level_link.size()-1:
		GlobalVar.current_level = 0
	else :
		GlobalVar.current_level += 1
		GlobalVar.max_level = min(GlobalVar.max_level+1,GlobalVar.game.size()-1)
		get_node(level_link[GlobalVar.current_level]+"/cadena").texture = load("res://sprites/cadena ouvert.png")
	place_bacteria()


func _on_go_pressed():
	GlobalVar.to_load(GlobalVar.game[GlobalVar.current_level])

func _on_x_pressed():
	$file.hide()

func _on_open_pressed():
	$file/RichTextLabel.text = "Level\n " + str(GlobalVar.current_level)
	$file.show()

