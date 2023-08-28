extends Node
var x = 0
var base1
var base2

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.level = "res://tuto/tuto.tscn"
	$main/explanation/Label.text = " [center] This place will provide explanations regarding each levels now click on the edit button [/center]"
	$background/ColorRect.visible = true



func _on_area_2d_area_entered(area):
	PlayerVar.win = 1
	PlayerVar.moving = false


func _on_button_button_down():
	$CanvasLayer.visible = false
