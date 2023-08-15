extends Node
var play = false  #lance ou non le jeu
var max_price = 600 #play ne peut pas passer à oui si PlayerVar.cost > à ça 

func _ready():
	#calcul le prix total actuel et l'écrit en haut-----------------------
	PlayerVar.cost = 0
	for n in Genome.plasmids.size():
			for i in Genome.plasmids[n].size():
				PlayerVar.cost += Genome.plasmids[n][i].Price
				
	$Price.text = str(PlayerVar.cost)
	$Price.text += "/"
	$Price.text += str(max_price)
#--------------------------------------------------------------------------
func _process(delta):
	
	if play:
		$player.position.x += 1 #ce qui le fait avancer
		$player/Sprite2D.modulate = PlayerVar.player_color #pour l'instant pas fou que ce soit là
		#faudra trouver un moyen de réaliser ce changement local dans express ou playervar
		
		for n in Genome.plasmids.size(): #check tout les plasmids
			for i in Genome.plasmids[n].size(): #check tout les genes du plasmid n
				Express.express(Genome.plasmids[n][i])
				if(Genome.plasmids[n][i].State == false): #arrête la lecture du plasmid
					break
		


func _on_editor_button_down(): #le builder de genes
	get_tree().change_scene_to_file("res://build.tscn")


func _on_play_button_down(): #le play button
	if PlayerVar.cost < max_price:
		play = true
		$player/Button.visible = false


func _on_stop_button_down():# le stop button
	play = false
	get_tree().reload_current_scene()


func _on_button_button_down():#le  boutton d'edit des plasmids
	if !play:
		get_tree().change_scene_to_file("res://edit_plasmid.tscn")

