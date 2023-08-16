extends Node
var rectangles = [] # le tableau qui keep track des rectangles, giga important pour pop
var plasmid = [] #le tableau qui contiendra tout les genes

#la taille des rectangles qui apparaissent dans le menu plasmid
var size_x = 80
var size_y = 50

func _ready():
	plasmid = []
	rectangles = []
	$Pop.position.y = 400


func _process(delta):
#affiche au bon endroit la petite croix
	$Pop.visible = false
	if(plasmid.size() > 0):
		$Pop.visible = true
	$Pop.position.x = (size_x * (plasmid.size()+1))
	
	
	

	


#affiche la config actuelle des plasmids
func new_rect(x,color):
	var rectangle = ColorRect.new()
	rectangle.size = Vector2(size_x, size_y)
	rectangle.position = Vector2(x*size_x, 400)
	rectangle.color = color  # Set rectangle color
	add_child(rectangle)  # Add the rectangle to the scene
	rectangles.append(rectangle)
	print(rectangle.name)

#la petite croix
func _on_pop_button_down():
	plasmid.pop_back()
	#permet de supprimer le dernier rectangle créé dans new_rect
	var last_rectangle = rectangles.pop_back()
	last_rectangle.queue_free()

#les boutons de genes
func _on_gfp_button_down():
	plasmid.push_back(Genome.GFP)
	new_rect(plasmid.size(),Genome.GFP.Col)
	

func _on_othergene_button_down():
	plasmid.push_back(Genome.Lacl)
	new_rect(plasmid.size(),Genome.Lacl.Col)


func _on_save_button_down():
	if (plasmid.size() > 0):
		Genome.plasmids.push_back(plasmid) #rajoute le plasmid créé à la liste des plasmids dans l'e-coli
	get_tree().change_scene_to_file("res://main.tscn")

func _on_exit_button_down():
	get_tree().change_scene_to_file("res://main.tscn")
	

func _on_button_button_down():
	plasmid.push_back(Genome.ampr)
	new_rect(plasmid.size(),Genome.ampr.Col)
