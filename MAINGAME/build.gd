extends Node
var rectangles = [] # le tableau qui keep track des rectangles, giga important pour pop
var plasmid = [] #le tableau qui contiendra tout les genes

#la taille des rectangles qui apparaissent dans le menu plasmid
var size_x = 80
var size_y = 50
var font = preload("res://font/joystix monospace.otf")
var brick = preload("res://sprites/brick.PNG")


func _ready():
	var style = $gene.get_theme_stylebox("normal")
	plasmid = []
	rectangles = []
	$Pop.position.y = 350
	for n in Genome.genomes.size():
		var button = Button.new()
		button.size.x = 80
		button.size.y = 40
		button.text = Genome.genomes[n].Name
		button.position.x = 10
		button.position.y = (size_y)*n 
		
		add_child(button)
		button.add_theme_font_override("font",font)
		button.add_theme_stylebox_override("normal",style)
		button.pressed.connect(_button_pressed.bind(Genome.genomes[n]))
		button.mouse_entered.connect(_mouse_on.bind(Genome.genomes[n]))
		button.mouse_exited.connect(_mouse_out.bind(Genome.genomes[n]))


func _process(delta):
#affiche au bon endroit la petite croix
	$Pop.visible = false
	if(plasmid.size() > 0):
		$Pop.visible = true
	$Pop.position.x = ((size_x-2) * (plasmid.size()+1))
	
	
	

	


#affiche la config actuelle des plasmids
func new_rect(x,color):
	var rectangle = Sprite2D.new()
	rectangle.texture = brick
	rectangle.scale = Vector2(0.158, 0.172)
	rectangle.position = Vector2(x*size_x, 400)
	rectangle.modulate = color  # Set rectangle color
	add_child(rectangle)  # Add the rectangle to the scene
	rectangles.append(rectangle)
	print(rectangle.name)

#la petite croix
func _on_pop_button_down():
	plasmid.pop_back()
	#permet de supprimer le dernier rectangle créé dans new_rect
	var last_rectangle = rectangles.pop_back()
	last_rectangle.queue_free()



func _on_save_button_down():
	Global.click()
	if (plasmid.size() > 0):
		Genome.plasmids.push_back(plasmid) #rajoute le plasmid créé à la liste des plasmids dans l'e-coli
	get_tree().change_scene_to_file("res://main.tscn")

func _on_exit_button_down():
	Global.click()
	get_tree().change_scene_to_file("res://main.tscn")
	
func _button_pressed(genome):
	plasmid.push_back(genome)
	new_rect(plasmid.size(),genome.Col)
	Global.click()
	
func _mouse_on(genome):
	$explications.visible = true
	$explications.text = genome.description
	
	
func _mouse_out(genome):
	$explications.visible = false
		
	
	

