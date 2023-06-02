extends Node2D

var Enemy = preload("res://Enemies/Enemy_1.tscn")
onready var enemiesTimer := $Timer as Timer
onready var player := $Player_JaxTeller
var enemiesPosition = 0

func _ready() -> void:
	pass
	

func newEnemy():
	var e1 = Enemy.instance()
	enemiesPosition = player.global_position
	e1.position = Vector2(enemiesPosition.x + 2500, 900) # Ajuste de acordo com as suas necessidades
	add_child(e1)
	print("Instanciou a morte")
	print(player.global_position)

func _on_Timer_timeout() -> void:
	newEnemy()
