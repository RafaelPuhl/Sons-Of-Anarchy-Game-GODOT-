extends Area2D

const SPEED := 5000
var direction := 1  
var velocity := Vector2.ZERO

func _ready():
	pass
	
func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)
