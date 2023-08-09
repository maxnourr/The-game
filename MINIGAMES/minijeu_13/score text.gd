extends CanvasLayer

func update_score(score):
	$Label.text = "give me more coffee : " + str(score)

func victory(Text):
	$Label2.text = Text
	
