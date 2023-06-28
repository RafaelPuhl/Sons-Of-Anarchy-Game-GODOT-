extends Label

func _process(delta: float) -> void:
	text = "Score: " + String(Global.score)
