class_name Movement_Controller
extends Node

@export var parent: CharacterBody2D

func get_movement_direction() -> Vector2:
	return Vector2.ZERO;

func wants_jump() -> bool:
	return false;
	
func wants_dash() -> bool:
	return false;
