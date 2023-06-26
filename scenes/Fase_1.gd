extends Node2D

var EnemyFear = preload("res://Enemies/Enemy_Fear.tscn")
var EnemyA = preload("res://Enemies/Enemy_A.tscn")
var EnemyC = preload("res://Enemies/Enemy_C.tscn")
var EnemyShooter = preload("res://Enemies/Enemy_Shooter.tscn")
onready var enemiesTimer := $Timer_enemies as Timer
onready var player := $Player_JaxTeller
var enemiesPosition = 0
var sceneLimit : Position2D
var sceneLimit2 : Position2D
var timer
var random = RandomNumberGenerator.new()
var flag = false

func _ready() -> void:
	sceneLimit = get_node("scene_limit")
	sceneLimit2 = get_node("scene_limit2")
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
	
func newEnemyShooter():
	var eS = EnemyShooter.instance()
	enemiesPosition = player.global_position
	eS.position = Vector2(enemiesPosition.x + 2900, 900) # Ajuste de acordo com as suas necessidades
	add_child(eS)

func _on_Timer_timeout() -> void:
	if player.position.x < sceneLimit.position.x:
		random.randomize()
		if random.randi_range(1, 3) == 1:
			newEnemyFear()
		elif random.randi_range(1, 3) == 2:
			newEnemyA()
		elif random.randi_range(1, 3) == 3 and player.position.x > sceneLimit2.position.x:
			newEnemyShooter()
		else:
			newEnemyC()
	
func _physics_process(delta: float) -> void:
	
	if sceneLimit == null:
		return
	
	if player.position.x > sceneLimit.position.x and flag == false:
		flag = true
		print("YOU WINS")
		yield(get_tree().create_timer(5), "timeout")
		get_tree().change_scene("res://scenes/CongratulationsScreen.tscn")
	
func _timeout():
	print("Timed out!")

