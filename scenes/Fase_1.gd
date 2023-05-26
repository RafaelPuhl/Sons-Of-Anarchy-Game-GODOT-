extends Node2D

var Enemy = preload("res://Enemies/Enemy_1.tscn")
onready var enemiesTimer := $Timer as Timer

func _ready() -> void:
	pass
	

func newEnemy():
	var e1 = Enemy.instance()
	e1.position = Vector2(1500, 300) # Ajuste de acordo com as suas necessidades
	add_child(e1)
	print("Instanciou a morte")


func _on_Timer_timeout() -> void:
	newEnemy()
