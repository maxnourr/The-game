extends Node
var description = [
	"The pill can protect the bacteria",
	"acid can be dangerous for bacterias",
	"ampiciline is a antibiotic, it kills non-resistant bacteria",
	"UV light can make fluorescence visible",
	"mucus cover the intestine wall",
	"allolactose activate lac operon",
	"T cells protect the body from aggression",
	"cadmium is a dangerous heavy metal",
	"cell wall"
] # le tableau qui keep track des rectangles, giga important pour pop


func _ready():
	if GlobalVar.level == "res://tuto/tuto.tscn":
		$tuto.visible = true
	elif GlobalVar.max_level > 1:
		for n in (GlobalVar.max_level):
			$Container.get_child(n+1).visible = true



func _on_exit_button_down():
	Global.click()
	get_tree().change_scene_to_file(GlobalVar.level)


func _on_pill_mouse_entered():
	$explications.text = description[0]

func _on_acid_mouse_entered():
	$explications.text = description[1]
	
func _on_amp_mouse_entered():
	$explications.text = description[2]

func _on_uv_light_mouse_entered():
	$explications.text = description[3]

func _on_mucus_mouse_entered():
	$explications.text = description[4]

func _on_lactose_mouse_entered():
	$explications.text = description[5]

func _on_t_cells_mouse_entered():
	$explications.text = description[6]

func _on_cadmium_mouse_entered():
	$explications.text = description[7]

func _on_cell_wall_mouse_entered():
	$explications.text = description[8]



