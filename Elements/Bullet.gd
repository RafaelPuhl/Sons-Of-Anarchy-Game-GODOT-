extends Area2D

const SPEED := 5000
var direction := 1
var velocity := Vector2.ZERO


func _ready():
	connect("body_entered", self, "_on_Bullet_body_entered")

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)

func _on_Bullet_body_entered(body):
	if body.is_in_group("enemies"):
		print("A bala colidiu com um inimigo!") # Esta é a linha que adicionamos
		queue_free() # Destrua a bala
		body.queue_free() # Destrua o inimigo
