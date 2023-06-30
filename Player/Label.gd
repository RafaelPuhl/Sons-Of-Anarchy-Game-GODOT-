extends Label

func _process(delta: float) -> void:
	text = "Munução: " + String(Global.score)
