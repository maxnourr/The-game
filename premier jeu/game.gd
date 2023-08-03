extends Node
var count_down_time = 5
var timer_running = false
var loose = false

# Called when the node enters the scene tree for the first time.
func _ready():
	timer_running = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if $clock.touch:
		count_down_time += 5
		$clock.touch = false
		
	if loose:
		$CanvasLayer.victory("you loose")
		
	$CanvasLayer.update_score($food.score)
	
	if $food.score == $food.max and loose == false:
		$CanvasLayer/Label2.text = "you win"
		timer_running = false
	
	if $player.position.x < 0:
		#$player.position.x = 0
		$player.position.x = get_viewport().size.x
	if $player.position.x > get_viewport().size.x:
		$player.position.x = 0
	if $player.position.y < 0:
		$player.position.y = get_viewport().size.y
	if $player.position.y > get_viewport().size.y:
		$player.position.y = 0
		
	if timer_running:
		count_down_time -= delta
		$CanvasLayer/Time.text = str(max(0,int(count_down_time)))
		
	if count_down_time <= 0:
		timer_running = false
		loose = true
	



func _on_button_pressed():
	$food.destroy()
	get_tree().reload_current_scene()
