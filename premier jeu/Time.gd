extends Label
var count_down_time = 5
var timer_running = false
var loose = false


# Called when the node enters the scene tree for the first time.
func _ready():
	set_text(str(count_down_time))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if timer_running:
		count_down_time -= delta
		set_text(str(max(0,int(count_down_time))))
		
	if count_down_time <= 0:
		timer_running = false
		loose = true
		
