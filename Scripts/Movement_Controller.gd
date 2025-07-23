class_name Movement_Controller
extends Node

@export var maximum_dashes := 2

var total_dashes := 0
var jumped := false

func get_movement_direction() -> Vector2:
	return Vector2.ZERO;

func wants_jump() -> bool:
	return false;
	
func wants_dash() -> bool:
	return false;

func could_dash() -> bool:
	return total_dashes < maximum_dashes

func increment_dashes():
	total_dashes += 1
	
func reset_dash():
	if total_dashes == 0:
		return;
	total_dashes = 0

func reset_jump(): 
	jumped = false

func set_jumped():
	jumped = true
