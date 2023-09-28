extends Node
var rectangles = [] # le tableau qui keep track des rectangles, giga important pour pop
var plasmid = [] #le tableau qui contiendra tout les genes

#la taille des rectangles qui apparaissent dans le menu plasmid
var size_x = 80
var size_y = 50
var font = preload("res://font/joystix monospace.otf")
var gene = preload("res://assets/gene.tscn")
var mol = preload("res://assets/molecule.tscn")
var molecule = false
var stylebox_molecule := StyleBoxFlat.new()
var stylebox_gene := StyleBoxFlat.new()
				

func _ready():
	stylebox_molecule.border_width_left = 2
	stylebox_molecule.border_color = Color(0,0,0,1)
	stylebox_molecule.bg_color = Color(10,2,2,0.5)
	
	stylebox_gene.border_width_left = 2
	stylebox_gene.border_color = Color(0,0,0,1)
	stylebox_gene.bg_color = Color(2,2,10,0.5)
				
	if GlobalVar.level == "res://tuto/tuto.tscn":
		$tuto.visible = true
	else:
		$tuto.visible = false
	
	if GlobalVar.level == "res://level Thessaloniki/Thessaloniki.tscn":
		$save2.visible = true
	else:
		$save2.visible = false
		
	var style_gene = $gene.get_theme_stylebox("normal")
	var style_molecule = $molecule.get_theme_stylebox("normal")
	plasmid = []
	rectangles = []
	$Pop.position.y = 350
	if GlobalVar.max_level > 1:
		for n in Genome.genomes.size():
			if Genome.genomes[n].Level <= GlobalVar.max_level:
				var button = Button.new()
				button.size.x = 80
				button.size.y = 40
				button.text = Genome.genomes[n].Name
				if Genome.genomes[n].Molecule:
					button.add_theme_stylebox_override("normal",style_molecule)
				else:
					button.add_theme_stylebox_override("normal",style_gene)
			
				button.add_theme_color_override("font_color", Color(255,255,255)) 
			
				button.position.x = 10
				button.position.y = (size_y)*n 
		
				add_child(button)
				button.add_theme_font_override("font",font)
				button.pressed.connect(_button_pressed.bind(Genome.genomes[n]))
				button.mouse_entered.connect(_mouse_on.bind(Genome.genomes[n]))
				button.mouse_exited.connect(_mouse_out.bind(Genome.genomes[n]))


func _process(delta):
#affiche au bon endroit la petite croix
	$Pop.visible = false
	if(plasmid.size() > 0):
		$Pop.visible = true
	$Pop.position.x = ((size_x-2) * (plasmid.size()+1)) +80
	

#affiche la config actuelle des plasmids
func new_rect(x,color,description):
	var rectangle = gene.instantiate()
	rectangle.position = Vector2(x*size_x+100, 400)
	rectangle.modulate = color  # Set rectangle color
	rectangle.set_text(description)
	add_child(rectangle)  # Add the rectangle to the scene
	rectangles.append(rectangle)
	
#affiche la config actuelle des plasmids
func new_circle(x,color,description):
	var circle = mol.instantiate()
	circle.position = Vector2(x*size_x+100, 400)
	circle.modulate = color  # Set rectangle color
	circle.set_text(description)
	add_child(circle)  # Add the rectangle to the scene
	rectangles.append(circle)

#la petite croix
func _on_pop_button_down():
	plasmid.pop_back()
	if molecule == true:
		molecule = false
	#permet de supprimer le dernier rectangle créé dans new_rect
	var last_rectangle = rectangles.pop_back()
	last_rectangle.queue_free()



func _on_save_button_down():
	Global.click()
	if (plasmid.size() > 0):
		Genome.plasmids.push_back(plasmid) #rajoute le plasmid créé à la liste des plasmids dans l'e-coli
	get_tree().change_scene_to_file(GlobalVar.level)

func _on_exit_button_down():
	Global.click()
	get_tree().change_scene_to_file(GlobalVar.level)
	
func _button_pressed(genome):
	if !genome.Molecule and molecule==false:
		plasmid.push_back(genome)
		new_rect(plasmid.size(),genome.Col,genome.description)
		Global.click()
	elif plasmid.is_empty():
		plasmid.push_back(genome)
		new_circle(plasmid.size(),genome.Col,genome.description)
		molecule = true
		Global.click()
	
func _mouse_on(genome):
	$explications.visible = true
	$explications.text = genome.description
	$explications.text += "\n"
	$explications.text += "Price: "
	$explications.text += str(genome.Price)
	
	
func _mouse_out(genome):
	$explications.visible = false
		
	
	



func _on_save_2_button_down():
	Global.click()
	if (plasmid.size() > 0):
		Genome.plasmids2.push_back(plasmid) #rajoute le plasmid créé à la liste des plasmids dans l'e-coli
	get_tree().change_scene_to_file(GlobalVar.level)
