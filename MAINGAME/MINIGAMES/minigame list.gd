extends Control

func _ready():
	if GlobalVar.first_open:
		GlobalVar.load_game()
		GlobalVar.first_open = false
	else:
		GlobalVar.save_game()
	Global.music_menu()
	if GlobalVar.on_randon == true:
		GlobalVar.win = 0
		GlobalVar.first = true
		GlobalVar.on_randon = false
		final_speed_run()


			
func _on_game_1_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.minigame[0])

func _on_game_2_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.minigame[1])

func _on_game_3_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.minigame[2])
	
func _on_game_4_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.minigame[3])
	
func _on_game_5_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.minigame[4])
	
func _on_game_6_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.minigame[5])

func _on_game_7_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.minigame[6])

func _on_game_8_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.minigame[7])

func _on_game_9_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.minigame[8])

func _on_game_10_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.minigame[9])

func _on_game_11_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.minigame[10])

func _on_game_12_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.minigame[11])

func _on_game_13_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.minigame[12])

func _on_game_14_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.minigame[13])
	
func _on_game_15_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.minigame[14])	

func _on_random_pressed():
	Global.button_sound()
	Global.music_game2()
	GlobalVar.on_randon = true
	GlobalVar.pass_game()
	
func _on_randomhard_pressed():
	Global.button_sound()
	Global.music_game2()
	GlobalVar.on_hard_core = true
	_on_random_pressed()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.set_text("coins : " + str(GlobalVar.coins) + "\nmaximum survival score : " + str(GlobalVar.max_normal_score)+ "\nmaximum extreme survival score : " + str(GlobalVar.max_score))

func _on_return_pressed():
	Global.button_sound()
	GlobalVar.save_game()
	GlobalVar.to_minigames()


func _on_return_game_pressed():
	Global.button_sound()
	GlobalVar.save_game()
	
	if GlobalVar.on_hard_core :
		var P = $VBoxContainer5/TextEdit.get_text()
		if P == "":
			P = "A mysterious guy"
		GlobalVar.best_list(P)
		$VBoxContainer5/TextEdit.visible = false
		GlobalVar.on_hard_core = false
		
	$VBoxContainer5.visible = false
	$VBoxContainer.visible=true
	$VBoxContainer2.visible=true
	$VBoxContainer3.visible=true
	$VBoxContainer4.visible=true
	
func final_speed_run():
	GlobalVar.current_score = GlobalVar.coins - GlobalVar.start_score
	$VBoxContainer5/speed_run_end.set_text("Congrats, your score is " + str(GlobalVar.current_score)) 
	
	if GlobalVar.on_hard_core :
		$VBoxContainer5/TextEdit.visible = true
		if GlobalVar.current_score > GlobalVar.max_score:
			GlobalVar.max_score = GlobalVar.current_score
	else:
		if GlobalVar.current_score > GlobalVar.max_normal_score:
			GlobalVar.max_normal_score = GlobalVar.current_score
	$VBoxContainer.visible=false
	$VBoxContainer2.visible=false
	$VBoxContainer3.visible=false
	$VBoxContainer4.visible=false
	$VBoxContainer5.visible = true
	
	
	
