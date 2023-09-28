extends Node


var level_link = ["level 1","level 2","level 3","level 4","level 5","level 6","level 7","level 8"]
var explain = ["You just need to encapsulate the bacteria","Express the ampicilline resistance gene","Express the ampicilline resistance gene\n and GFP gene to shine","Express the mucus binding gene","LacI permit the expression of Spac in presence of allactose\n and avoid expression after","Expressing IL10 avoid destruction by T-cells","48C !\n Express Spac only in the medium, so in presence of allolactose.\nYou need to express EC20 constitutively","Here you don't need a new gene but to inhibit a existing gene.\n Here we use a molecule inhibiting Ftsz, we could also knock-out the gene.","Luxl is express in the first bacteria \n releasing AHL molecule \n catched by the second bacteria, activate LuxR \n and produce the biofertiliser"]

var Sol = [
	[[]],
	[[Genome.genomes[0]]],
	[[Genome.genomes[0],Genome.genomes[1]]],
	[[Genome.genomes[2]]],
	[[Genome.genomes[3],Genome.genomes[2]]],
	[[Genome.genomes[4]]],
	[[Genome.genomes[3],Genome.genomes[2]],[Genome.genomes[5]]],
	[[Genome.genomes[6]]],
	[[Genome.genomes[8],Genome.genomes[9]],[Genome.genomes[7]]],
	
]

var size_x = 80
var size_y = 50
var font = preload("res://font/joystix monospace.otf")
var gene = preload("res://assets/gene.tscn")
var molecule = preload("res://assets/molecule.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(level_link.size()):
		get_node("Container/"+level_link[i]+"/cadena").hide()
		get_node("Container/"+level_link[i]+"/Label").text = level_link[i]
		get_node("Container/"+level_link[i]).pressed.connect(solution.bind(i))
	
	$level9/cadena.hide()
	$level9/Label.text = "Collab"
	$level9.pressed.connect(solution.bind(8))

func solution(i):
	$explain.text = explain[i]
	for n in $gene.get_children():
		$gene.remove_child(n)
		n.queue_free()
	
	for Y in Sol[i].size():
		for X in Sol[i][Y].size():
			#le baille des rectangles-----------------------------------
			var rectangle
			if Sol[i][Y][X].Molecule == true:
				rectangle = molecule.instantiate()
			else:
				rectangle = gene.instantiate()
			rectangle.visible = true
			rectangle.position = Vector2(X*size_x + 300, -(size_y + 30)*Y + 200)
			rectangle.modulate = Sol[i][Y][X].Col  
			rectangle.set_text(Sol[i][Y][X].description)
			$gene.add_child(rectangle)  # Add the rectangle to the scene
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_exit_pressed():
	Global.click()
	GlobalVar.to_game_list()
