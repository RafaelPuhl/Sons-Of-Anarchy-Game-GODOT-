extends Node2D

var EnemyFear = preload("res://Enemies/Enemy_Fear.tscn")
var EnemyA = preload("res://Enemies/Enemy_A.tscn")
var EnemyC = preload("res://Enemies/Enemy_C.tscn")
onready var enemiesTimer := $Timer_enemies as Timer
onready var player := $Player_JaxTeller
var enemiesPosition = 0
var sceneLimit : Position2D
var timer
var random = RandomNumberGenerator.new()
var flag = false

func _ready() -> void:
	sceneLimit = get_node("scene_limit")
	player = get_node("Player_JaxTeller")

func newEnemyFear():
	var e1 = EnemyFear.instance()
	enemiesPosition = player.global_position
	e1.position = Vector2(enemiesPosition.x + 2900, 900) # Ajuste de acordo com as suas necessidades
	add_child(e1)
	
func newEnemyA():
	var eA = EnemyA.instance()
	enemiesPosition = player.global_position
	eA.position = Vector2(enemiesPosition.x + 2900, 900) # Ajuste de acordo com as suas necessidades
	add_child(eA)

func newEnemyC():
	var eC = EnemyC.instance()
	enemiesPosition = player.global_position
	eC.position = Vector2(enemiesPosition.x + 2900, 900) # Ajuste de acordo com as suas necessidades
	add_child(eC)

func _on_Timer_timeout() -> void:
	if player.position.x < sceneLimit.position.x:
		random.randomize()
		if random.randi_range(1, 2) == 1:
			newEnemyFear()
		elif random.randi_range(1, 2) == 2:
			newEnemyA()
		else:
			newEnemyC()
	
func _physics_process(delta: float) -> void:
	
	if sceneLimit == null:
		return
	
	if player.position.x > sceneLimit.position.x and flag == false:
		flag = true
		print("YOU WINS")
		yield(get_tree().create_timer(5), "timeout")
		get_tree().change_scene("res://scenes/GameOverScreen.tscn")
	
func _timeout():
	print("Timed out!")

