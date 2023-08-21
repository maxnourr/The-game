extends Node
var play = false  #lance ou non le jeu
var max_price = 600 #play ne peut pas passer à oui si PlayerVar.cost > à ça 
var timer= 0
var waiting = 0

func _ready():
	Global.body()
	#calcul le prix total actuel et l'écrit en haut-----------------------
	PlayerVar.cost = 0
	for n in Genome.plasmids.size():
			for i in Genome.plasmids[n].size():
				PlayerVar.cost += Genome.plasmids[n][i].Price
				
	$Price.text = str(PlayerVar.cost)
	$Price.text += "/"
	$Price.text += str(max_price)
	#-----------------------------------------------------------------

#--------------------------------------------------------------------------
	
func _process(delta):
	PlayerVar.Play = play
	PlayerVar.PlayerX = $bacteria.position.x
	PlayerVar.PlayerY= $bacteria.position.y
	$background/ColorRect.color = Color(0.424, 0.235, 0.275)
	check_win()
	if play:
		waiting +=1
		if waiting >=30:
			waiting = 0
			if $bacteria/flagel.visible == true:
				$bacteria/flagel.visible = false
				$bacteria/flagel2.visible = true
			else:
				$bacteria/flagel.visible = true
				$bacteria/flagel2.visible = false
		if PlayerVar.moving:
			$bacteria.position.x += 1 #ce qui le fait avancer
			$bacteria/light.visible = PlayerVar.gfp
			$bacteria/particles.visible = PlayerVar.Interlekin
			$bacteria/body.modulate = PlayerVar.player_color #pour l'instant pas fou que ce soit là
		#faudra trouver un moyen de réaliser ce changement local dans express ou playervar
		if timer == 1:
			for n in Genome.plasmids.size(): #check tout les plasmids
				for i in Genome.plasmids[n].size(): #check tout les genes du plasmid n
					Express.express(Genome.plasmids[n][i])
					if(Genome.plasmids[n][i].State == false): #arrête la lecture du plasmid
						break
		timer += 1
		if timer >= 36:
			timer = 0				
		

func _on_editor_button_down(): #le builder de genes
	Global.click()
	Global.theme_build()
	get_tree().change_scene_to_file("res://build.tscn")


func _on_play_button_down(): #le play button
	Global.click()
	if PlayerVar.cost < max_price:
		play = true
		$Button.visible = false


func _on_stop_button_down():# le stop button
	play = false
	get_tree().reload_current_scene()
	PlayerVar.default()


func _on_button_button_down():#le  boutton d'edit des plasmids
	Global.click()
	if !play:
		get_tree().change_scene_to_file("res://edit_plasmid.tscn")

func check_win(): #fonction qui vérifie si on a gagné ou perdu
	if PlayerVar.win == 1:
		play = false
		$bacteria/normal.visible = false
		$bacteria/happy.visible = true
	if PlayerVar.win == 2:
		play = false
		$bacteria/normal.visible = false
		$bacteria/angry.visible = true
		


func _on_help_button_down():
	$explanation.visible = true


func _on_out_button_down():
	$explanation.visible = false


func _on_menu_pressed():
	Global.click()
	GlobalVar.to_menu()
