extends Area2D
static var score = 0
static var required_score = 0
var rng = RandomNumberGenerator.new()
var size = 0
var filled = 0
var win = false
var inside = false
static var max = 2.1
var lose = false

var empty = preload("res://minijeu_10/figures/Emptytube@4x.png")
var half = preload("res://minijeu_10/figures/Halftube@4x.png")
var full = preload("res://minijeu_10/figures/Filledtube@4x.png")

func texture(T):
	if T == "empty":
		$Sprite2D.set_texture(empty)
	elif T == "half":
		$Sprite2D.set_texture(half)
	elif T == "full":
		$Sprite2D.set_texture(full)

func _ready():
	texture("empty")
	required_score += 1 
	var firstrandom = rng.randf_range(1,max)
	size = floor(firstrandom) * 10
	$Label.visible = false
	#on donne une valeur de 10 ou de 20 au tube


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = str(filled)
	$Label.text += "/"
	$Label.text += str(size)
	#pour écrire le score sur les tubes
	
	if filled >= round(size/2) and $Sprite2D.texture == empty:
		texture("half")
	elif filled >= size and $Sprite2D.texture == half:
		texture("full")
	
		
	if size == filled and win == false:
		score+=1
		win = true
	if filled > size:
		lose = true
		
	#check que c'est rempli ou si ça a dépassé
	
func destroy():
	score = 0
	required_score = 0


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
		
