extends SporeState

@export var idle_state: SporeState
@export var push_strength: int = 200
@export var push_decay: int = 400

var _player_entered: bool = false
var _initial_push_dir: Vector2
var _negative_push_dir: Vector2

func enter() -> void:
	super()
	_initial_push_dir = get_movement_input().normalized()
	_negative_push_dir = _initial_push_dir * -1;
	parent.velocity = _initial_push_dir * push_strength

func process_physics(delta: float) -> SporeState:
	var scalar_projection = _initial_push_dir.dot(parent.velocity)
	
	if parent.is_on_floor() or parent.is_on_ceiling() or parent.is_on_wall():
			return idle_state
	
	if scalar_projection <= 0:
		return idle_state
	
	parent.velocity += (_negative_push_dir * push_decay) * delta
	parent.move_and_slide()
	
	return null

func exit() -> void:
	super()
	movement_controller.movement_direction = Vector2.ZERO
