extends Node
#bcp de répétition avec build, j'en ferai une fonction dans un singleton maybe, à voir
var y = 0
var size_x = 80
var size_y = 50

func _ready():
	
	for n in Genome.plasmids.size():
		for i in Genome.plasmids[n].size():
			#le baille des rectangles-----------------------------------
			
			var rectangle = ColorRect.new()
			rectangle.size = Vector2(size_x, size_y)
			rectangle.position = Vector2(i*size_x, (size_y + 30)*n)
			rectangle.color = Genome.plasmids[n][i].Col  
			add_child(rectangle)  
			#----------------------
		#rajoute les boutons x au bout de chaque plasmids -----------------------	
		var button = Button.new()
		button.size.x = 10
		button.size.y = 10
		button.text = "x"
		button.position.x = (Genome.plasmids[n].size())*size_x
		button.position.y = (size_y + 30)*n 
		add_child(button)
		button.pressed.connect(_button_pressed.bind(n)) 
		#connecte chaque button à la fonction pressed avec une coordonnée précise n
		#permet de delete le bon plasmid
		
		

func _process(delta):
	pass
			
		
	


func _on_back_button_down():
	get_tree().change_scene_to_file("res://main.tscn")
	
func _button_pressed(number):
	Genome.plasmids.pop_at(number) #delete le plasmid associé au boutton :)
	get_tree().reload_current_scene()



