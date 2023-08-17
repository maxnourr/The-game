extends Control

func _ready():
	Global.music_menu()
	if GlobalVar.on_randon == true:
		GlobalVar.win = false
		GlobalVar.first = true
		GlobalVar.on_randon = false
		GlobalVar.on_hard_core = false
		final_speed_run()


			
func _on_game_1_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[0])

func _on_game_2_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[1])

func _on_game_3_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[2])
	
func _on_game_4_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[3])
	
func _on_game_5_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[4])
	
func _on_game_6_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[5])

func _on_game_7_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[6])

func _on_game_8_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[7])

func _on_game_9_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[8])

func _on_game_10_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[9])

func _on_game_11_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[10])

func _on_game_12_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[11])

func _on_game_13_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[12])

func _on_game_14_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[13])
	
func _on_game_15_pressed():
	Global.button_sound()
	Global.music_game1()
	GlobalVar.to_load(GlobalVar.game[14])	

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
	$Label.set_text("coins : " + str(GlobalVar.coins) + "\nmaximum score : " + str(GlobalVar.max_score))

func _on_return_pressed():
	Global.button_sound()
	GlobalVar.save_game()
	GlobalVar.to_menu()


func _on_return_game_pressed():
	Global.button_sound()
	GlobalVar.save_game()
	
	var P = $VBoxContainer5/TextEdit.get_text()
	if P == "":
		P = "A mysterious guy"
	
	GlobalVar.best_list(P)
	
	$VBoxContainer.visible=true
	$VBoxContainer2.visible=true
	$VBoxContainer3.visible=true
	$VBoxContainer4.visible=true
	$VBoxContainer5.visible = false
	
func final_speed_run():
	GlobalVar.current_score = GlobalVar.coins - GlobalVar.start_score
	$VBoxContainer5/speed_run_end.set_text("Congrats, your score is " + str(GlobalVar.current_score))
	if GlobalVar.current_score > GlobalVar.max_score:
		GlobalVar.max_score = GlobalVar.current_score
	$VBoxContainer.visible=false
	$VBoxContainer2.visible=false
	$VBoxContainer3.visible=false
	$VBoxContainer4.visible=false
	$VBoxContainer5.visible = true
	
