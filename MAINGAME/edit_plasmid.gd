extends Node
#bcp de répétition avec build, j'en ferai une fonction dans un singleton maybe, à voir
var y = 0
var size_x = 80
var size_y = 50
var font = preload("res://font/joystix monospace.otf")
var brick = preload("res://sprites/brick.PNG")

func _ready():
	var style = $cross_model.get_theme_stylebox("normal")
	for n in Genome.plasmids.size():
		for i in Genome.plasmids[n].size():
			#le baille des rectangles-----------------------------------
			
			var rectangle = Sprite2D.new()
			rectangle.texture = brick
			rectangle.scale = Vector2(0.158, 0.172)
			rectangle.position = Vector2(i*size_x + 60, (size_y + 30)*n + 40)
			rectangle.modulate = Genome.plasmids[n][i].Col  
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
		button.add_theme_font_override("font",font)
		button.add_theme_stylebox_override("normal",style)
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



