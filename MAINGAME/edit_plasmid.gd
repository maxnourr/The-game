extends Node
#bcp de répétition avec build, j'en ferai une fonction dans un singleton maybe, à voir
var y = 0
var size_x = 80
var size_y = 50
var font = preload("res://font/joystix monospace.otf")
var gene = preload("res://assets/gene.tscn")
var molecule = preload("res://assets/molecule.tscn")

func _ready():
	if GlobalVar.level == "res://tuto/tuto.tscn":
		$tuto.visible = true
	else:
		$tuto.visible = false
		
	var style = $cross_model.get_theme_stylebox("normal")

	if not Genome.is_bact_2 :
		for n in Genome.plasmids.size():
			for i in Genome.plasmids[n].size():
			#le baille des rectangles-----------------------------------
				var rectangle
				if Genome.plasmids[n][i].Molecule == true:
					rectangle = molecule.instantiate()
				else:
					rectangle = gene.instantiate()
				rectangle.visible = true
				rectangle.position = Vector2(i*size_x + 60, (size_y + 30)*n + 40)
				rectangle.modulate = Genome.plasmids[n][i].Col  
				rectangle.set_text(Genome.plasmids[n][i].description)
				add_child(rectangle)  # Add the rectangle to the scene
			#----------------------
		#rajoute les boutons x au bout de chaque plasmids -----------------------	
			var button = Button.new()
			button.size.x = 10
			button.size.y = 10
			button.text = "x"
			button.position.x = (Genome.plasmids[n].size())*size_x
			button.position.y = (size_y + 30)*n 
			add_child(button)
			button.add_theme_font_override("font",font)
			button.add_theme_stylebox_override("normal",style)
			button.pressed.connect(_button_pressed.bind(n)) 
		#connecte chaque button à la fonction pressed avec une coordonnée précise n
		#permet de delete le bon plasmid
	else:
		for n in Genome.plasmids2.size():
			for i in Genome.plasmids2[n].size():
			#le baille des rectangles-----------------------------------
				var rectangle
				if Genome.plasmids2[n][i].Molecule == true:
					rectangle = molecule.instantiate()
				else:
					rectangle = gene.instantiate()
				rectangle.visible = true
				rectangle.position = Vector2(i*size_x + 60, (size_y + 30)*n + 40)
				rectangle.modulate = Genome.plasmids2[n][i].Col  
				rectangle.set_text(Genome.plasmids2[n][i].description)
				add_child(rectangle)  # Add the rectangle to the scene
			#----------------------
		#rajoute les boutons x au bout de chaque plasmids -----------------------	
			var button = Button.new()
			button.size.x = 10
			button.size.y = 10
			button.text = "x"
			button.position.x = (Genome.plasmids2[n].size())*size_x
			button.position.y = (size_y + 30)*n 
			add_child(button)
			button.add_theme_font_override("font",font)
			button.add_theme_stylebox_override("normal",style)
			button.pressed.connect(_button_pressed.bind(n)) 
		



func _on_back_button_down():
	get_tree().change_scene_to_file(GlobalVar.level)
	
func _button_pressed(number):
	if not Genome.is_bact_2 :
		Genome.plasmids.pop_at(number) #delete le plasmid associé au boutton :)
		get_tree().reload_current_scene()
	else:
		Genome.plasmids2.pop_at(number) #delete le plasmid associé au boutton :)
		get_tree().reload_current_scene()



