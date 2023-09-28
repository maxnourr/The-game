extends Node
var plasmids = [] #la liste de tout les plasmids
var plasmids2 = []
#le singleton qui contient tout les différents genes
#la classe gene, nommée Genome car "gene" semble déjà être quelque chose pour godot
var is_bact_2 = false
#--------------------------------------------------------------
var genomes = []
class genome:
	var ID: int
	var Level : int
	var Price: int
	var State: bool
	var Col: Color
	var Name: String
	var Molecule: bool
	var description: String
	func _init(id: int,level: int, price: int, state: bool, color: Color,Nam: String,mol:bool):
		ID = id
		Level = level
		Price = price
		State = state
		Col = color
		Name = Nam
		Molecule = mol
#-----------------------------------------------------------
#tout les genes seront ici
#----------------------------------
var GFP = genome.new(1,3, 100, true,Color(0.49, 1, 0.467),"GFP",false)
var LacI = genome.new(2,5, 100, false,Color(0.9, 0.9, 0.9),"LacO",false)
var ampr = genome.new(3,2,100,true,Color(1,0.5,0.5),"AMPr",false)
var SpaC = genome.new(4,4,100,true,Color(0.8,0.5,0.5),"SpaC",false)
var IL10 = genome.new(5,6,200,true,Color(0.3,0.3,0.6),"IL-10",false)
var EC20 = genome.new(6,7,100,true,Color(0.4,0.4,0.4),"Ec20",false)
var FtsZ = genome.new(7,8,100,true,Color(0.4,0.7,0.7),"FtsZ inhibitor",true)
var Luxl = genome.new(8,9,100,true,Color(0.7,0.7,0),"Luxl",false)
var LuxR = genome.new(9,9,100,false,Color(0.8,0.2,0),"LuxR",false)
var Biofertiliser = genome.new(10,9,100,true,Color(0,0.2,0.8),"Biofertiliser",false)
#var AHL = genome.new(8,100,true,Color(0.7,0.7,0),"Luxl",false)

#---------------------------------
func _ready():
	genomes.push_back(ampr)
	genomes.push_back(GFP)
	genomes.push_back(SpaC)
	genomes.push_back(LacI)
	genomes.push_back(IL10)
	genomes.push_back(EC20)
	genomes.push_back(FtsZ)
	genomes.push_back(Luxl)
	genomes.push_back(LuxR)
	genomes.push_back(Biofertiliser)
	
	
#------ les explications
	GFP.description = "Green fluorescent protein \n light up in presence of UV light"
	LacI.description = "The lac operon is activated \n only in presence of allolactose \n expressing the following genes"
	ampr.description = "Ampiciline resistance \n provide resistance to Ampiciline"
	SpaC.description = "Allow your bacteria to \n bind to mucus"
	IL10.description = "Produce Interlekin 10 \n prevent T cells for catching you"
	EC20.description = "Allow your bacteria to \n bind to cadmium"
	FtsZ.description = "FTsZ is one of the gene responsible for mitosis \n FtsZ inhibitor is a molecule inhibiting ftsZ"
	Luxl.description = "geme to produce the molecule AHL for corum sensing"
	LuxR.description = "The lux operon is activated \n only in presence of AHL\n expressing the following genes"
	Biofertiliser.description = "The Biofertiliser help the soil to recover"




