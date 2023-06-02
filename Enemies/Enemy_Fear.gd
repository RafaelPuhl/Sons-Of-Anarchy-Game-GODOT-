extends KinematicBody2D

const GRAVIDADE = 2500
var velocidade = Vector2.ZERO

func _ready():
	pass


func _physics_process(delta):
	velocidade.y += GRAVIDADE * delta
	velocidade.x = 600
	velocidade = move_and_slide(velocidade,Vector2.UP)
	
