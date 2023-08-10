extends Node

var is_game_won: bool=false
var time = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = time #set timer
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not $Timer.is_stopped():
		var T = max(0,round($Timer.time_left))
		$CanvasLayer/Label2.text = str(max(0,T))
		if T == 0:
			$Timer.stop()
			is_game_won=false
			$ColorRect.color=Color(1, 0.231, 0.231)
			$CanvasLayer/Label.text="You LOOSE!!!!"

func _on_plate_area_entered(area):
	if area.type=="bad":
		$Timer.stop()
		is_game_won=false
		$ColorRect.color=Color(1, 0.231, 0.231)
		$CanvasLayer/Label.text="You LOOSE!!!!"
		print("Pizza entered, ", is_game_won)
		
		
	elif area.type=="good":
		$Timer.stop()
		is_game_won=true
		$ColorRect.color=Color(0.643, 1, 0.486)
		$CanvasLayer/Label.text="You WIN!!!!"
		print("LB entered, ", is_game_won)
