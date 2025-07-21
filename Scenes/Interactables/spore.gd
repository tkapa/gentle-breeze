class_name Spore
extends Area2D

@export var move_speed := 100
@export var follow_distance := 50

var _player: Player

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default", 0.5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	_move_toward_player(delta)

func _move_toward_player(delta: float):
	if _player == null:
		return
	
	var currentPosition := position
	var playerPosition := _player.position
	var distanceTo = currentPosition.distance_to(playerPosition)
	
	if distanceTo > follow_distance:
		position = currentPosition.move_toward(playerPosition * 0.95, move_speed * delta)

func _on_body_entered(body):
	if body is Player:
		_player = body
		print_debug("Body Entekrje;lkj")
		return
