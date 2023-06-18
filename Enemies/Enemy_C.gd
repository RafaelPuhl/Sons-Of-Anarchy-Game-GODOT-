extends KinematicBody2D

const GRAVIDADE = 2500
const speed = 200

var velocidade = Vector2.ZERO
var player = null

func _ready():
	add_to_group("enemies") # Adiciona o inimigo ao grupo "enemies"
	player = get_parent().get_node("Player_JaxTeller") # Ajuste o nome do nó do jogador de acordo com a sua cena

func _physics_process(delta):
	velocidade.y += GRAVIDADE * delta
	velocidade = move_and_slide(velocidade, Vector2.UP)
	if is_on_floor() and player and player.is_inside_tree():
		var direction = player.global_position - global_position
		direction = direction.normalized()
		velocidade += direction * speed * delta
