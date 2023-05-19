extends RigidBody2D

var speed = 2000
var direction = 1  

func _ready():
	self.linear_velocity = Vector2(speed * direction, 0)
