extends TileMap

var Player2Scene = preload("res://Enemies/Enemy_1.tscn")

func _ready() -> void:
	var timer = get_tree().create_timer(5.0) # Cria um timer que acaba após 30 segundos
	timer.connect("timeout", self, "_on_timer_timeout") # Conecta o sinal "timeout" do timer à função "_on_timer_timeout"
	_on_timer_timeout()
	
func _on_timer_timeout():
	var player2 = Player2Scene.instance()
	player2.position = Vector2(200, 200) # Ajuste de acordo com as suas necessidades
	add_child(player2)
	print("Instanciou a morte")
