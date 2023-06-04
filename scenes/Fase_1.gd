extends Node2D

var Enemy = preload("res://Enemies/Enemy_Fear.tscn")
onready var enemiesTimer := $Timer as Timer
onready var player := $Player_JaxTeller
var enemiesPosition = 0
var sceneLimit : Position2D

func _ready() -> void:
	sceneLimit = get_node("scene_limit")
	player = get_node("Player_JaxTeller")

func newEnemy():
	var e1 = Enemy.instance()
	enemiesPosition = player.global_position
	e1.position = Vector2(enemiesPosition.x + 2500, 900) # Ajuste de acordo com as suas necessidades
	add_child(e1)
	print(player.global_position)

func _on_Timer_timeout() -> void:
	newEnemy()
	
func _physics_process(delta: float) -> void:
	if sceneLimit == null:
		return
	
	if player.position.x > sceneLimit.position.x:
		null
