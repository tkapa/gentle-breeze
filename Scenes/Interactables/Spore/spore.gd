class_name Spore
extends Area2D

@export var move_speed := 100
@export var follow_distance := 50

const PUSH_DECAY := 1500

var _player: Player
var _pushed := false
var _direction: Vector2
var _negative_direction: Vector2
var _dash_speed: int

func _ready():
	$AnimatedSprite2D.play("default", 0.5)
	
func _physics_process(delta):
	if _player != null:
		_move_toward_player(delta)
		return
	if _pushed:
		_move_against_dash(delta)
		return

func _move_toward_player(delta: float):
	var currentPosition := position
	var playerPosition := _player.position
	
	position = currentPosition.lerp(playerPosition, delta)

func _move_against_dash(delta: float):
	var velocity = _negative_direction * _dash_speed * delta
	
	position += velocity

func _on_body_entered(body):
	if body is Player and _player == null:
		_player = body
		SignalBus.player_dashed.connect(_on_player_dash)
		return

	if body is Flower:
		body.activate()
		_player = null
		queue_free()
		return

func _on_player_dash(direction: Vector2, dash_speed: int):
	_pushed = true
	_player = null
	_direction = direction
	_negative_direction = direction * -1
	_dash_speed = dash_speed
	SignalBus.player_dashed.disconnect(_on_player_dash)

func on_enter_flower():
	queue_free();
