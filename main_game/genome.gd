extends Node
var plasmids = [] #la liste de tout les plasmids
#le singleton qui contient tout les différents genes
#la classe gene, nommée Genome car "gene" semble déjà être quelque chose pour godot
#--------------------------------------------------------------
class genome:
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
var GFP = genome.new(1, 100, true,Color(0.49, 1, 0.467))
var othergene = genome.new(2, 100, false,Color(1, 0.45, 0.467))


#---------------------------------
