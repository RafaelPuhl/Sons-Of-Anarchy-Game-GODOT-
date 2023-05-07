extends KinematicBody2D

const GRAVIDADE = 2500
var velocidade = Vector2.ZERO

onready var sprite = $AnimatedSprite

func _ready() -> void:
	pass

func _physics_process(delta):
	velocidade.y += GRAVIDADE * delta
	velocidade = move_and_slide(velocidade)
	
	var direcao = Input.get_action_strength("right") - Input.get_action_strength("left")
	velocidade.x = direcao * 600
	
	if velocidade.x > 0:
		sprite.play("right")
	elif Input.get_action_strength("atirar"):
		sprite.play("fire")
		print("Atirou")
	else:
		sprite.stop()
		sprite.frame = 0
		
	if Input.is_action_just_pressed("jump"):
		print("Pulou")
		velocidade.y = -1000
		
	
