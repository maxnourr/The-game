extends Area2D
static var score = 0
static var required_score = 0
var rng = RandomNumberGenerator.new()
var size = 0
var filled = 0
var win = false
var inside = false


func _ready():
	required_score += 1 
	var firstrandom = rng.randf_range(1,2.1)
	size = floor(firstrandom) * 10
	#on donne une valeur de 10 ou de 20 au tube


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ColorRect/Label.text = str(filled)
	$ColorRect/Label.text += "/"
	$ColorRect/Label.text += str(size)
	#pour écrire le score sur les tubes
	
		
	
		
	if size == filled and win == false:
		score+=1
		win = true
	if filled > size and win == true:
		score += -1
		win = false
		
	#check que c'est rempli ou si ça a dépassé






func _on_area_entered(area):
	inside = true
	
func _on_area_exited(area):
	inside = false
	

# comme la quantité de liquide de la seringue est dans le scripte seringue et qu'il faut
# qu'il reste du liquide dedans pour pouvoir remplir la fiole, on a besoin d'intéragir
#entre deux variables de deux scriptes differents
# la fonction check si dessous permet de le faire dans le scripte node.gd
func check(fill):
	if fill > 0 and inside and Input.is_action_just_pressed("click"):
		filled += 5
		
