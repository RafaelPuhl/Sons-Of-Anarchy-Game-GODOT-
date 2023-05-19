extends RigidBody2D

var speed = 5000
var direction = 1  

func _ready():
	self.linear_velocity = Vector2(speed * direction, 0)
