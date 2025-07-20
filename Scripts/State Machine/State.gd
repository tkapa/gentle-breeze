class_name State
extends Node

@export
var animation_name: String
@export
var move_speed: float = 200

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var parent: CharacterBody2D
var animations: AnimatedSprite2D
var movement_controller: Node

func enter() -> void:
	return;

func exit() -> void:
	return;

func process_input(event: InputEvent) -> State:
	return null;

func process_physics(delta: float) -> State:
	return null;

func process_frame(delta: float) -> State:
	return null;

func get_movement_input() -> Vector2:
	return movement_controller.get_movement_direction()

func get_jump() -> bool:
	return movement_controller.wants_jump()

func get_dash() -> bool: 
	return movement_controller.wants_dash() && movement_controller.could_dash()
