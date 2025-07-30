class_name PlayerMovementController
extends MovementController

func get_movement_direction() -> Vector2:
	var x := Input.get_axis("move_left", "move_right")
	var y := Input.get_axis("move_up", "move_down")
	return Vector2(x, y)

func wants_jump() -> bool:
	return Input.is_action_just_pressed("jump")
	
func wants_dash() -> bool:
	return Input.is_action_just_pressed("dash")
