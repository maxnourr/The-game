

extends Area2D

var add = false

@export var type = "default"
@export var option = "default"

var Type = ["glass","mask","top","down","shoes"]

var glass = ["sunglass","protection_glass"]

var sunglass = preload("res://sunglass.png")
var protection_glass = preload("res://glassprotect.png")

var Mask = ["mask"]

var mask = preload("res://sunglass.png")

var top = ["tee_shirt","blouse","naked"]

var tee_shirt = preload("res://sunglass.png")
var blouse = preload("res://sunglass.png")
var naked = preload("res://sunglass.png")

var down = ["long","short"]

var long = preload("res://sunglass.png")
var short = preload("res://sunglass.png")

var shoes = ["open","close","soke"]

var open = preload("res://sunglass.png")
var close = preload("res://sunglass.png")
var soke = preload("res://sunglass.png")

func set_type():
	pass
	#$Sprite2D.texture = str_to_var(option)
	
func _ready():
	set_type()
	



func _on_button_pressed():
	add = true
