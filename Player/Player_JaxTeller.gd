extends KinematicBody2D
export (PackedScene) var bullet : PackedScene

const GRAVIDADE = 2500
var velocidade = Vector2.ZERO
var max_speed = 1000
var desaceleration_rate = 200
var desaceleration_timer = 0.0
var shooting = false
var direction = 2.8

onready var sprite = $AnimatedSprite
onready var shootSound = $ShootSound
	
func _ready() -> void:
	pass

func _physics_process(delta):
	velocidade.y += GRAVIDADE * delta
	velocidade = move_and_slide(velocidade,Vector2.UP)

	var direcao = Input.get_action_strength("right")

	if direcao != 0:
		velocidade.x = direcao * max_speed
		desaceleration_timer = 0
	elif Input.is_action_just_pressed("stop"):
		velocidade.x = 0
	else:
		desaceleration_timer += delta
		if desaceleration_timer < 2:
			velocidade.x -= desaceleration_rate * delta * sign(velocidade.x)
			velocidade.x = clamp(velocidade.x, -max_speed, max_speed)
		else:
			velocidade.x = 0

	if velocidade.x > 0 and Input.get_action_strength("atirar"):
		sprite.play("fire")

	elif Input.get_action_strength("atirar"):
		sprite.play("fire")
		

	elif velocidade.x > 0:
		sprite.play("right")

	else:
		sprite.stop()
		sprite.frame = 0

	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocidade.y = -1000
		
	if shooting == true:
		shootSound.play()
		shooting = false

func _on_AnimatedSprite_animation_finished() -> void:
	if sprite.animation == "fire":
		shooting = true
		var p = bullet.instance()
		p.direction = sign(velocidade.x) if velocidade.x != 0 else 1 # Direção da bala baseada na velocidade do player
		p.global_position = global_position  + Vector2(50 * direction, 0)
		owner.add_child(p) 

func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("enemies"):
		get_tree().change_scene("res://scenes/GameOverScreen.tscn")
