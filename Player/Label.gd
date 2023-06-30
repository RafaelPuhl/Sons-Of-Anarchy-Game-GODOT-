extends Label

func _process(delta: float) -> void:
	text = "Munição: " + String(Global.score)
