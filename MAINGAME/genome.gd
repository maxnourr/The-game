extends Node
var plasmids = [] #la liste de tout les plasmids
#le singleton qui contient tout les différents genes
#la classe gene, nommée Genome car "gene" semble déjà être quelque chose pour godot
#--------------------------------------------------------------
var genomes = []
class genome:
	var ID: int
	var Price: int
	var State: bool
	var Col: Color
	var Name: String
	var description: String
	func _init(id: int, price: int, state: bool, color: Color,Nam: String):
		ID = id
		Price = price
		State = state
		Col = color
		Name = Nam
#-----------------------------------------------------------
#tout les genes seront ici
#----------------------------------
var GFP = genome.new(1, 100, true,Color(0.49, 1, 0.467),"GFP")
var LacI = genome.new(2, 100, false,Color(0.9, 0.9, 0.9),"LacI")
var ampr = genome.new(3,100,true,Color(1,0.5,0.5),"AMPr")
var SpaC = genome.new(4,100,true,Color(0.8,0.5,0.5),"SpaC")
var IL10 = genome.new(5,200,true,Color(0.3,0.3,0.6),"IL-10")
var EC20 = genome.new(6,100,true,Color(0.4,0.4,0.4),"Ec20")
var FtsZ = genome.new(7,100,true,Color(0.4,0.7,0.7),"FtsZ")

#---------------------------------
func _ready():
	
	
#------ les explications
	GFP.description = "Green fluorescent protein \n light up in presence of UV light"
	LacI.description = "Allolactose inhibitor \n prevent the expression of the following \n genes if no Allolactose is present"
	ampr.description = "Ampiciline resistance \n provide resistance to Ampiciline"
	SpaC.description = "Allow your bacteria to \n bind to mucus"
	IL10.description = "Produce Interlekin 10 \n prevent T cells for catching you"
	EC20.description = "Allow your bacteria to \n bind to cadmium"
	FtsZ.description = "description_to_be_added"



