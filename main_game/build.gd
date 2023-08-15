extends Node
var rectangles = [] # le tableau qui keep track des rectangles, giga important pour pop
var plasmid = [] #le tableau qui contiendra tout les genes
#la taille des rectangles qui apparaissent dans le menu plasmid
var size_x = 80
var size_y = 50

#la classe gene, nommée Genome car "gene" semble déjà être quelque chose pour godot
#--------------------------------------------------------------
class Genome:
	var ID: int
	var Price: int
	var State: bool
	var Col: Color
	func _init(id: int, price: int, state: bool, color: Color):
		ID = id
		Price = price
		State = state
		Col = color
#-----------------------------------------------------------

#tout les genes seront ici
#----------------------------------
var GFP = Genome.new(1, 100, true,Color(0.49, 1, 0.467))
var othergene = Genome.new(2, 100, true,Color(1, 0.45, 0.467))


#---------------------------------

func _ready():
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
	plasmid.push_back(GFP)
	new_rect(plasmid.size(),GFP.Col)
	

func _on_othergene_button_down():
	plasmid.push_back(othergene)
	new_rect(plasmid.size(),othergene.Col)
