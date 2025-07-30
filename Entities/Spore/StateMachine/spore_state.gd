class_name SporeState
extends Node

@export
var animation_name: String
@export
var move_speed: float = 200

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var parent: Spore
var animations: AnimatedSprite2D
var movement_controller: SporeMovementController
var player_detection_component: PlayerDetectionComponent

func enter() -> void:
	return;

func exit() -> void:
	return;

func process_input(event: InputEvent) -> SporeState:
	return null;

func process_physics(delta: float) -> SporeState:
	return null;

func process_frame(delta: float) -> SporeState:
	return null;

func get_movement_input() -> Vector2:
	return movement_controller.get_movement_direction()

func get_pushed() -> bool: 
	return movement_controller.wants_dash()
