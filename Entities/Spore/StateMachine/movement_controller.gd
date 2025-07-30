class_name SporeMovementController
extends MovementController

var movement_direction: Vector2 = Vector2.ZERO
var is_pushed: bool = false

func get_movement_direction() -> Vector2:
	return movement_direction
	
func wants_dash() -> bool:
	if is_pushed:
		is_pushed = false
		return true
	return false
	
