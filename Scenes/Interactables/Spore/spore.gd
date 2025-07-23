class_name Spore
extends Area2D

@export var move_speed := 100
@export var follow_distance := 50

var _player: Player

func _ready():
	$AnimatedSprite2D.play("default", 0.5)
	
func _physics_process(delta):
	_move_toward_player(delta)

func _move_toward_player(delta: float):
	if _player == null:
		return
	
	var currentPosition := position
	var playerPosition := _player.position
	var distanceTo = currentPosition.distance_to(playerPosition)
	
	position = currentPosition.lerp(playerPosition, delta)

func _on_body_entered(body):
	if body is Player and _player == null:
		_player = body
		return

	if body is Flower:
		body.activate()
		_player = null
		queue_free()
		return

func on_enter_flower():
	queue_free();
