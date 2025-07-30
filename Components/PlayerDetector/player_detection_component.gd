class_name PlayerDetectionComponent
extends Area2D

signal on_player_entered(player: Player)
signal on_player_exit(player: Player)

@onready var collision_shape : CollisionShape2D = $CollisionShape2D

func _on_body_entered(body):
	if body is Player:
		on_player_entered.emit(body)

func _on_body_exited(body):
	if body is Player:
		on_player_exit.emit(body)
