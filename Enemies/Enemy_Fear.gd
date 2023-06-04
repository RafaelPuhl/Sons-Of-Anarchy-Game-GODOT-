extends KinematicBody2D

const GRAVIDADE = 2500
var velocidade = Vector2.ZERO

func _ready():
	add_to_group("enemies") # Adiciona o inimigo ao grupo "enemies"


func _physics_process(delta):
	velocidade.y += GRAVIDADE * delta
	velocidade = move_and_slide(velocidade,Vector2.UP)
