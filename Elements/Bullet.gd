extends KinematicBody2D

var speed = 5000
var direction = 1  
var velocidade = Vector2.ZERO

func _ready():
	pass
	
func _physics_process(delta):
	velocidade = move_and_slide(velocidade,Vector2.UP)
	velocidade.x = speed
